<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ServiceWarrenty;
use App\Models\SpareParts;
use App\Models\Stock;
use App\Models\Claim;
use App\Models\Customer;
use App\Models\ClaimProduct;
use App\Models\ClaimAttachment;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use PDF;
use App\Exports\ClaimExport;
use App\Exports\ServiceExport;
use Maatwebsite\Excel\Facades\Excel;
 

class ClaimController extends Controller
{
    
    public function index(){
        $claims=DB::table('claims')
            ->leftjoin('service_warrenties','service_warrenties.id','=','claims.reg_id')
            ->leftjoin('products','service_warrenties.product_id','=','products.id')
            ->leftjoin('categories','service_warrenties.category_id','=','categories.id')
            ->leftjoin('employees','claims.engineer_id','=','employees.id')
            ->select('claims.*','service_warrenties.first_name','service_warrenties.last_name','service_warrenties.company_name','service_warrenties.phone','service_warrenties.serial_no','products.name as productName','employees.name as serviceBy',
            'products.model as productModel','categories.name as categoryName')
            ->orderBy('claims.id','DESC')
            ->where('claims.status','!=','Inactive')
            ->where('claims.claim_type','Claim')
            ->get();
           
         return view('backend.claims.claimView',['claims'=>$claims]);
    }
    
    
    public function create(){
        $registrations=ServiceWarrenty::select('id','serial_no')->get();
        return view('backend.claims.createClaim',['registrations'=>$registrations]);
    }
    
    
    
    
    public function getWarrentyInfo(Request $request){
        
        $info=DB::table('service_warrenties')
                ->leftjoin('products','service_warrenties.product_id','products.id')
                ->select('service_warrenties.*','products.name as product_name','products.model as product_model')
                ->where('service_warrenties.id','=',$request->serial_no)
                ->first();
        $claims=Claim::where('reg_id','=',$request->serial_no)->get();
        
        $previousClaimCount=0;
        if(count($claims) > 0){
            $previousClaimCount=count($claims);
        }else{
            $previousClaimCount=0;
        }
       // return $info;
         $html='';
        $html .='<h5>Party Info</h5>
                <div class="table">
                    <table  width="100%" class="table table-bordered  table-hover m-0">
                        <tr>
                            <td width="40%">Product:</td>
                            <td width="60%">'.$info->product_name.'</td>
                        </tr>
                        <tr>
                            <td width="40%">Model:</td>
                            <td width="60%">'.$info->product_model.'</td>
                        </tr>
                        <tr>
                            <td width="40%">Serial No:</td>
                            <td width="60%">'.$info->serial_no.'</td>
                        </tr>
                        <tr>
                            <td width="40%">Registration No:</td>
                            <td width="60%">'.$info->registration_number.'</td>
                        </tr>
                        <tr>
                            <td width="40%">Issued By:</td>
                            <td width="60%">'.date("d-m-Y", strtotime($info->instalation_date)).'</td>
                        </tr>
                        <tr>
                            <td width="40%">IMEI Number:</td>
                            <td width="60%">'.$info->imei_number.'</td>
                        </tr>
                    </table>
                    <div class="container row">
                        <button class="btn btn-secondary col-md-3" onclick="showRegistrationInfo('.$info->id.')">Show Registration Info</button>
                        <button class="btn btn-secondary col-md-6" onclick="showRegisteredServiceRepair('.$info->id.')">Show Registered Service & Repair Events <span class="badge badge-light">'.$previousClaimCount.'</span> </button>
                        <button class="btn btn-secondary col-md-3" onclick="addClaimInfo('.$info->id.')">Create Claim</button>
                    </div>
                </div>';
            
            
        return $html;
    }
    
    
    
    public function getRegistrationInfo($id){
       $info=ServiceWarrenty::find($id);
       return view('backend.claims.registrationInfo',['info'=>$info]);
    }
    
    
    public function getRegisteredServiceRepair($id){
       
       $info=DB::table('service_warrenties')
                ->leftjoin('products','service_warrenties.product_id','products.id')
                ->select('service_warrenties.*','products.name as product_name','products.model as product_model')
                ->where('service_warrenties.id','=',$id)
                ->first();
        if($info){
             
             $claims=DB::table('claims')
                    ->leftjoin('service_warrenties','service_warrenties.id','=','claims.reg_id')
                    ->leftjoin('products','service_warrenties.product_id','=','products.id')
                    ->leftjoin('categories','service_warrenties.category_id','=','categories.id')
                    ->select('claims.*','service_warrenties.first_name','service_warrenties.last_name','service_warrenties.phone','service_warrenties.serial_no','products.name as productName',
                    'products.model as productModel','categories.name as categoryName')
                    ->where('claims.reg_id','=',$id)
                    ->orderBy('claims.id','DESC')
                     ->where('claims.status','!=','Inactive')
                    ->get();
             if($claims){
                 $message='1';
                 return view('backend.claims.registeredServiceRepair',['info'=>$info,'claims'=>$claims,'message'=>$message]);
             }else{
                 $message='2';
                 return view('backend.claims.registeredServiceRepair',['info'=>$info,'message'=>$message]);
             }
            
        }else{
            abort(404);
        }
       
    }
    
    
    
    public function createNewClaimPageOne($id){
      $info=DB::table('service_warrenties')
                ->leftjoin('products','service_warrenties.product_id','products.id')
                ->leftjoin('categories','service_warrenties.category_id','categories.id')
                ->select('service_warrenties.*','products.name as product_name','products.model as product_model','categories.name as categoryName')
                ->where('service_warrenties.id','=',$id)
                ->first();
        $parts=SpareParts::where('status','=','Active')->get();
        
       return view('backend.claims.createNewClaimPageOne',['info'=>$info,'parts'=>$parts,'reg_id'=>$id]);
    }
    
    
    
    
    
    
    public function createNewClaimPageTwo($id){
        
        $parts=SpareParts::where('status','=','Active')->get();
        return view('backend.claims.createNewClaimPageTwo',['parts'=>$parts,'id'=>$id]);
    }
    
    
    public function addToSession(Request $request){
        //return $request;
        $data = '';
		$available_quantity = 0;
		if (Session::get("claim_session_product_array") != null) {
		    
			$is_available = 0;
			foreach (Session::get("claim_session_product_array") as $keys => $values) {
				if (Session::get("claim_session_product_array")[$keys]['part_id'] == $request->part_id) {
				    //return 'ht';
					$is_available++;
					session()->put("claim_session_product_array." . $keys . ".part_quantity", Session::get("claim_session_product_array")[$keys]['part_quantity'] + $request->qty);
				}
			}
			if ($is_available == 0) {
				if(isset($request->part_id)) {
					$partInfo = SpareParts::where('status', 'Active')->where('id', $request->part_id)->first();
					$stocks = Stock::where('product_id','=',$request->part_id)->first();
					if ($stocks) {
						$available_quantity = $stocks->qty;
					} else {
						$available_quantity = 0;
					}
				}
				$item_array = [
    				'part_id'                   =>     $partInfo->id,
    				'part_name'                 =>     $partInfo->name . ' - ' . $partInfo->model,
    				'available_qty'             =>     $available_quantity,
    				'part_price'                =>    $partInfo->sale_price,
    				'part_quantity'             =>    $request->qty
    			];
				Session::push('claim_session_product_array', $item_array);
			}
		} else {
                $partInfo='';
		    if (isset($request->part_id)) {
				$partInfo = SpareParts::where('status', 'Active')->where('id', $request->part_id)->first();
				$stocks = Stock::where('product_id','=',$request->part_id)->first();
				if ($stocks) {
					$available_quantity = $stocks->qty;
				} else {
					$available_quantity = 0;
				}
			}
			//return $partInfo;
			$item_array = [
				'part_id'                   =>    $partInfo->id,
				'part_name'                 =>    $partInfo->name . ' - ' . $partInfo->model,
				'available_qty'             =>    $available_quantity,
				'part_price'                =>    $partInfo->sale_price,
				'part_quantity'             =>    $request->qty
			];
			Session::push('claim_session_product_array', $item_array);
		}
		$data .= "Success";
		return $data;
    }
    
    
    public function fetchSession(){
        
        $grandTotal = 0;
		$cart = '';
		if (Session::get('claim_session_product_array') != null) {
			$i = 1;

			foreach (Session::get('claim_session_product_array') as $keys => $values) {
				$unitPrice = Session::get("claim_session_product_array")[$keys]["part_price"];
				$totalPrice = Session::get("claim_session_product_array")[$keys]["part_quantity"] * $unitPrice;
				$productId = Session::get("claim_session_product_array")[$keys]["part_id"];
				
				$cart .= '<tr><td style="text-align: center;">' . $i++ . '<input type="hidden" name="ids[]" id="id_' . $productId . '" value="' . $productId . '" /></td>' .
        					'<td>' . Session::get("claim_session_product_array")[$keys]["part_name"].' </td>' .
        					'<td style="text-align: center;"><span id="available_qty_' . $productId . '">' . Session::get("claim_session_product_array")[$keys]["available_qty"] . '</span></td>' .
        					'<td><input type="number" class="form-control" style="text-align: center;width: 100%;" id="quantity_' . $productId . '" name="quantity[]" onkeyup="loadCartandUpdate(' . $productId . ')" value="' . Session::get("claim_session_product_array")[$keys]["part_quantity"] . '" /></td>' .
        					'<td><input type="number" class="form-control" style="text-align: center;width: 100%;" id="unitPrice_' . $productId. '"  name="unitPrice[]" onkeyup="loadCartandUpdate(' . $productId . ')" value="' . $unitPrice . '" /></td>' .
        					'<td style="text-align: right;"><span id="totalPrice_' . $productId .  '">' . $totalPrice . '</span></td>' .
        					'<td style="text-align: center;"><span onclick="removeSessionPart(' . Session::get("claim_session_product_array")[$keys]["part_id"] .  ')" style="color:red;"><i class="fa fa-trash"> </i></span></td>
					    </tr>';
				$grandTotal += $totalPrice;
			}
				$cart .= '<tr><td colspan="5" class="text-right" > Total Tk : </td><td id="totalAmount" class="text-right"> ' . $grandTotal . '</td><td></td></tr>';
				
			$cart .= '<tr><td colspan="5" class="text-right"><b>VAT(7.5%)</b></td><td class="text-right" id="vat">' . $grandTotal * 0.075 . '</td><td ></td></tr>';
			$cart .= '<tr><td colspan="5" class="text-right"><b>Grand Total</b></td><td class="text-right" id="vat">' . ($grandTotal * 0.075) +$grandTotal  . '</td><td ></td></tr>';
		}else{
		    $empty='null';
		    return $empty;
		}
		
	
		$data = array(
			'cart' => $cart,
			'totalAmount' => $grandTotal
		);
		return $data;
    }
    
    
    
    public function updateSession(Request $request){

        if (Session::get("claim_session_product_array") != null) {
			foreach (Session::get("claim_session_product_array") as $keys => $values) {
				if (Session::get("claim_session_product_array")[$keys]['part_id'] == $request->id) {
				    if(Session::get("claim_session_product_array")[$keys]['available_qty'] >= $request->quantity){
				        session()->put("claim_session_product_array." . $keys . ".part_quantity", $request->quantity);
    					session()->put("claim_session_product_array." . $keys . ".part_price", $request->unitPrice);
    					$data = "Success";
				    }else{
				        $data="exceed";
				    }
				}
			}
		} else {
			$data = "";
		}
		return $data;
    }
    
    
    public function clearSession(Request $request){
        Session::forget('claim_session_product_array');
		$data = "Success";
		return $data;
    }
    
    
    
    public function removePart(Request $request){
        $id = $request->id;
		$data = '';
		$cartData = Session::get('claim_session_product_array');
		foreach (Session::get("claim_session_product_array") as $keys => $values) {
			if (Session::get("claim_session_product_array")[$keys]['part_id'] == $id) {
				unset($cartData[$keys]);
				Session::put('claim_session_product_array', $cartData);
				$data = "Success";
				break;
			}
		}
		$data = "Success";
		return $data;
    }
    
    
    // public function submitFinalPart(Request $request){
    //     //return $request;
    //     $claim=Claim::find($request->claimId);
    //     if($claim){
    //         $claim->currency=$request->currency;
    //         $claim->vat=$request->vat;
    //         $claim->grand_total=$request->grand_total;
    //         $claim->type="saved";
    //         $claim->save();
            
    //       foreach (Session::get("claim_session_product_array") as $keys => $values){
               
    // 			$claimProduct= new ClaimProduct();
    // 			$claimProduct->claim_id= $request->claimId;
    // 			$claimProduct->part_id= Session::get("claim_session_product_array")[$keys]['part_id'];
    // 			$claimProduct->qty= Session::get("claim_session_product_array")[$keys]['part_quantity'];
    // 			$claimProduct->unit_price= Session::get("claim_session_product_array")[$keys]['part_price'];
    // 			$claimProduct->total_price= Session::get("claim_session_product_array")[$keys]['part_price'] *Session::get("claim_session_product_array")[$keys]['part_quantity'];
    // 			$claimProduct->status= "Active";
    // 			$claimProduct->save();
    			
    // 			$stock=Stock::where('product_id','=',Session::get("claim_session_product_array")[$keys]['part_id'])->first();
    // 			$stock->decrement('qty', Session::get("claim_session_product_array")[$keys]['part_quantity']);
    // 		}
    // 		Session::forget('claim_session_product_array');
    // 		return 'success';
    //     }else{
    //         return 'false';
    //     }
        
    // }
    
    
    
    
    
    public function saveClaimsInfo(Request $request){
        //return $request;
        $validated = $request->validate([
                'customer_id'                   => 'required',
                'claim_ref_no'                  => 'required',
                'model'                         => 'required',
                'run_hour'                      => 'required|numeric|regex:/^\d+(\.\d{1,2})?$/',
                'operating_hours_last_service'  => 'required|numeric|regex:/^\d+(\.\d{1,2})?$/',
                'failure_date'                  => 'nullable',
                'work_done_date'                => 'nullable',
                'defect_details'                => 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
               
            ]);
            
          DB::beginTransaction();
            try {
            $maxCode = Claim::max('claim_serial');
    		$maxCode++;
    		$maxCode=str_pad($maxCode, 6, '0', STR_PAD_LEFT);
    		
            $claim= new Claim();
            $claim->customer_id                     =$request->customer_id;
            $claim->reg_id                          =$request->reg_id;
            $claim->claim_serial                    =$maxCode;
            $claim->year                            =date('Y');
            $claim->serial_key                      ='WC';
            $claim->claim_reference                 =$request->claim_ref_no;
            $claim->model                           =$request->model;
            $claim->run_hour                        =$request->run_hour;
            $claim->operating_hours_last_service    =$request->operating_hours_last_service;
            $claim->service_by                      =$request->service_by;
            $claim->comission_date                  =$request->comission_date;
            $claim->failure_date                    =$request->failure_date;
            $claim->work_done_date                  =$request->work_done_date;
            $claim->defect_details                  =$request->defect_details;
            $claim->defect_issue                     =$request->defect_issue;
            $claim->oil_consumption                 =$request->oil_consumption;
            $claim->ambient_temperature             =$request->ambient_temperature;
            $claim->action_taken                    =$request->action_taken;
            $claim->currency                        =$request->currency;
            $claim->vat                             =$request->vat;
            $claim->grand_total                     =$request->grand_total;
            $claim->claim_type                      ="Claim";
            $claim->engineer_id                     =auth()->user()->id;
            $claim->type                            ="saved";
            $claim->status                          ="Open";
            $claim->save();
            $lastId=$claim->id;
            if (Session::get("claim_session_product_array") != null) {
                
                foreach (Session::get("claim_session_product_array") as $keys => $values){
        			$claimProduct= new ClaimProduct();
        			$claimProduct->claim_id= $lastId;
        			$claimProduct->part_id= Session::get("claim_session_product_array")[$keys]['part_id'];
        			$claimProduct->qty= Session::get("claim_session_product_array")[$keys]['part_quantity'];
        			$claimProduct->unit_price= Session::get("claim_session_product_array")[$keys]['part_price'];
        			$claimProduct->total_price= Session::get("claim_session_product_array")[$keys]['part_price'] *Session::get("claim_session_product_array")[$keys]['part_quantity'];
        			$claimProduct->status= "Active";
        			$claimProduct->save();
        			
        			$stock=Stock::where('product_id','=',Session::get("claim_session_product_array")[$keys]['part_id'])->first();
        			$stock->decrement('qty', Session::get("claim_session_product_array")[$keys]['part_quantity']);
        		}
        		Session::forget('claim_session_product_array');
            }
            
      
		DB::commit();
             return response()->json(['message'=>'<span class="alert alert-success col-md-12" role="alert" >Data successfully saved.</span>', 'lastId'=>$lastId]);
        } catch (Exception $e) {
            DB::rollBack();
            return response()->json(['error' =>  'Claim  rollback!']);
        }
    }
    
    
    
    
    public function claimDetails($id){
       
       $claim=DB::table('claims')
            ->leftJoin('service_warrenties','service_warrenties.id','=','claims.reg_id')
            ->leftJoin('products','service_warrenties.product_id','=','products.id')
            ->leftJoin('categories','service_warrenties.category_id','=','categories.id')
            ->leftjoin('employees','claims.engineer_id','=','employees.id')
            ->select('claims.*','service_warrenties.registration_number','employees.name as serviceBy','service_warrenties.serial_no','service_warrenties.instalation_date','service_warrenties.warrenty_type','service_warrenties.annual_run_hour' ,'products.name as product_name','products.model as model','categories.name as category_name')
            ->where('claims.id','=',$id)
            ->first();
        $customer=Customer::find($claim->customer_id);
        $claimProducts=ClaimProduct::leftJoin('spare_parts','spare_parts.id','=','claim_products.part_id')
                        ->leftJoin('categories','spare_parts.category_id','=','categories.id')
                        ->select('claim_products.*','spare_parts.name','spare_parts.model','spare_parts.product_code','categories.name as category_name')
                        ->where('claim_id','=',$id)
                        ->get();
        $pdf = PDF::loadView('backend.claims.claimReportPdf',['claim' => $claim,'customer'=>$customer,'claimProducts'=>$claimProducts]);
		return $pdf->stream('claim-report-pdf.pdf', array("Attachment" => false));
    }
    
    
    
    public function claimDelete($id){
        $claim=Claim::find($id);
        $claim->status="Inactive";
        $claim->save();
        return redirect()->back()->with('message','Data deleted Successfully');
        
    }
    
    
    public function claimEdit($id){
        $claim=Claim::find($id);
        $customer=Customer::find($claim->customer_id); 
        $info=DB::table('service_warrenties')
                ->leftjoin('products','service_warrenties.product_id','products.id')
                ->leftjoin('categories','service_warrenties.category_id','categories.id')
                ->select('service_warrenties.*','products.name as product_name','products.model as product_model','categories.name as categoryName')
                ->where('service_warrenties.id','=',$claim->reg_id)
                ->first(); 
        $parts=SpareParts::where('status','=','Active')->get();
        Session::forget('claim_edit_session_product_array');
        return view('backend.claims.editCalim',['claim'=>$claim,'customer'=>$customer,'parts'=>$parts,'info'=>$info]);
    }
    
    
    public function editAddToSession(Request $request){
        //return $request;
        $data='';
        if($request->part_id == null){
            
        
            $claimProducts=ClaimProduct::where('claim_id','=',$request->claim_id)->get();
            
            foreach($claimProducts as $claim_product){
        		$available_quantity = 0;
        		if (Session::get("claim_edit_session_product_array") != null) {
        		    
        			$is_available = 0;
        			foreach (Session::get("claim_edit_session_product_array") as $keys => $values) {
        				if (Session::get("claim_edit_session_product_array")[$keys]['part_id'] == $claim_product->part_id) {
        				    //return 'ht';
        					$is_available++;
        					session()->put("claim_edit_session_product_array." . $keys . ".part_quantity", Session::get("claim_edit_session_product_array")[$keys]['part_quantity'] + $claim_product->qty);
        				}
        			}
        			if ($is_available == 0) {
        				if(isset($request->part_id)) {
        					$partInfo = SpareParts::where('status', 'Active')->where('id','=', $claim_product->part_id)->first();
        					$stocks = Stock::where('product_id','=',$claim_product->part_id)->first();
        					if ($stocks) {
        						$available_quantity = $stocks->qty;
        					} else {
        						$available_quantity = 0;
        					}
        				}
        				$item_array = [
            				'part_id'                   =>     $partInfo->id,
            				'part_name'                 =>     $partInfo->name . ' - ' . $partInfo->model,
            				'available_qty'             =>     $available_quantity,
            				'part_price'                =>    $claim_product->unit_price,
            				'part_quantity'             =>    $claim_product->qty
            			];
        				Session::push('claim_edit_session_product_array', $item_array);
        			}
        		} else {
                        $partInfo='';
        		    if (isset($claim_product->part_id)) {
        				$partInfo = SpareParts::where('status', 'Active')->where('id','=', $claim_product->part_id)->first();
        				$stocks = Stock::where('product_id','=',$claim_product->part_id)->first();
        				if ($stocks) {
        					$available_quantity = $stocks->qty;
        				} else {
        					$available_quantity = 0;
        				}
        				
        				$item_array = [
                        				'part_id'                   =>    $partInfo->id,
                        				'part_name'                 =>    $partInfo->name . ' - ' . $partInfo->model,
                        				'available_qty'             =>    $available_quantity,
                        				'part_price'                =>    $claim_product->unit_price,
                        				'part_quantity'             =>    $claim_product->qty
                            			];
            			Session::push('claim_edit_session_product_array', $item_array);
        			}
        		}
            }
        }elseif($request->part_id != null){
            
            $available_quantity = 0;
    		if (Session::get("claim_edit_session_product_array") != null) {
    		    
    			$is_available = 0;
    			foreach (Session::get("claim_edit_session_product_array") as $keys => $values) {
    				if (Session::get("claim_edit_session_product_array")[$keys]['part_id'] == $request->part_id) {
    				    //return 'ht';
    					$is_available++;
    					session()->put("claim_edit_session_product_array." . $keys . ".part_quantity", Session::get("claim_edit_session_product_array")[$keys]['part_quantity'] + $request->qty);
    				}
    			}
    			if ($is_available == 0) {
    				if(isset($request->part_id)) {
    					$partInfo = SpareParts::where('status', 'Active')->where('id', $request->part_id)->first();
    					$stocks = Stock::where('product_id','=',$request->part_id)->first();
    					if ($stocks) {
    						$available_quantity = $stocks->qty;
    					} else {
    						$available_quantity = 0;
    					}
    				}
    				$item_array = [
        				'part_id'                   =>     $partInfo->id,
        				'part_name'                 =>     $partInfo->name . ' - ' . $partInfo->model,
        				'available_qty'             =>     $available_quantity,
        				'part_price'                =>    $partInfo->sale_price,
        				'part_quantity'             =>    $request->qty
        			];
    				Session::push('claim_edit_session_product_array', $item_array);
    			}
    		} else {
                    $partInfo='';
    		    if (isset($request->part_id)) {
    				$partInfo = SpareParts::where('status', 'Active')->where('id', $request->part_id)->first();
    				$stocks = Stock::where('product_id','=',$request->part_id)->first();
    				if ($stocks) {
    					$available_quantity = $stocks->qty;
    				} else {
    					$available_quantity = 0;
    				}
    			}
    			//return $partInfo;
    			$item_array = [
    				'part_id'                   =>    $partInfo->id,
    				'part_name'                 =>    $partInfo->name . ' - ' . $partInfo->model,
    				'available_qty'             =>    $available_quantity,
    				'part_price'                =>    $partInfo->sale_price,
    				'part_quantity'             =>    $request->qty
    			];
    			Session::push('claim_edit_session_product_array', $item_array);
    		}
        }
        
		$data .= "Success";
		return $data;
    
    }
    
    
    
    public function fetchEditSession(){
        
        $grandTotal = 0;
		$cart = '';
		if (Session::get('claim_edit_session_product_array') != null) {
			$i = 1;

			foreach (Session::get('claim_edit_session_product_array') as $keys => $values) {
				$unitPrice = Session::get("claim_edit_session_product_array")[$keys]["part_price"];
				$totalPrice = Session::get("claim_edit_session_product_array")[$keys]["part_quantity"] * $unitPrice;
				$productId = Session::get("claim_edit_session_product_array")[$keys]["part_id"];
				
				$cart .= '<tr><td style="text-align: center;">' . $i++ . '<input type="hidden" name="ids[]" id="id_' . $productId . '" value="' . $productId . '" /></td>' .
        					'<td>' . Session::get("claim_edit_session_product_array")[$keys]["part_name"].' </td>' .
        					'<td style="text-align: center;"><span id="available_qty_' . $productId . '">' . Session::get("claim_edit_session_product_array")[$keys]["available_qty"] . '</span></td>' .
        					'<td><input type="number" class="form-control" style="text-align: center;width: 100%;" id="quantity_' . $productId . '" name="quantity[]" onkeyup="loadCartandUpdate(' . $productId . ')" value="' . Session::get("claim_edit_session_product_array")[$keys]["part_quantity"] . '" /></td>' .
        					'<td><input type="number" class="form-control" style="text-align: center;width: 100%;" id="unitPrice_' . $productId. '"  name="unitPrice[]" onkeyup="loadCartandUpdate(' . $productId . ')" value="' . $unitPrice . '" /></td>' .
        					'<td style="text-align: right;"><span id="totalPrice_' . $productId .  '">' . $totalPrice . '</span></td>' .
        					'<td style="text-align: center;"><span onclick="removeSessionPart(' . Session::get("claim_edit_session_product_array")[$keys]["part_id"] .  ')" style="color:red;"><i class="fa fa-trash"> </i></span></td>
					    </tr>';
				$grandTotal += $totalPrice;
			}
				$cart .= '<tr><td colspan="5" class="text-right" > Total Tk : </td><td id="totalAmount" class="text-right"> ' . $grandTotal . '</td><td></td></tr>';
				
			$cart .= '<tr><td colspan="5" class="text-right"><b>VAT(7.5%)</b></td><td class="text-right" id="vat">' . $grandTotal * 0.075 . '</td><td ></td></tr>';
			$cart .= '<tr><td colspan="5" class="text-right"><b>Grand Total</b></td><td class="text-right" id="vat">' . ($grandTotal * 0.075) +$grandTotal  . '</td><td ></td></tr>';
		}else{
		    $empty='null';
		    return $empty;
		}
		
	
		$data = array(
			'cart' => $cart,
			'totalAmount' => $grandTotal
		);
		return $data;
    }
    
    
    public function editUpdateSession(Request $request){
        if (Session::get("claim_edit_session_product_array") != null) {
			foreach (Session::get("claim_edit_session_product_array") as $keys => $values) {
				if (Session::get("claim_edit_session_product_array")[$keys]['part_id'] == $request->id) {
				    if(Session::get("claim_edit_session_product_array")[$keys]['available_qty'] >= $request->quantity){
				        session()->put("claim_edit_session_product_array." . $keys . ".part_quantity", $request->quantity);
    					session()->put("claim_edit_session_product_array." . $keys . ".part_price", $request->unitPrice);
    					$data = "Success";
				    }else{
				        $data="exceed";
				    }
				}
			}
		} else {
			$data = "";
		}
		return $data;
    }
    
    public function claimRemovePart(Request $request){
        $id = $request->id;
		$data = '';
		$cartData = Session::get('claim_edit_session_product_array');
		foreach (Session::get("claim_edit_session_product_array") as $keys => $values) {
			if (Session::get("claim_edit_session_product_array")[$keys]['part_id'] == $id) {
				unset($cartData[$keys]);
				Session::put('claim_edit_session_product_array', $cartData);
				$data = "Success";
				break;
			}
		}
		$data = "Success";
		return $data;
    }
    
    
    public function editClearSession(Request $request){
        Session::forget('claim_edit_session_product_array');
		$data = "Success";
		return $data;
    }
    
    public function updateClaimsInfo(Request $request){
        $validated = $request->validate([
                'claim_id'                      => 'required',
                'customer_id'                   => 'required',
                'claim_ref_no'                  => 'required',
                'model'                         => 'required',
                'run_hour'                      => 'required|numeric|regex:/^\d+(\.\d{1,2})?$/',
                'operating_hours_last_service'  => 'required|numeric|regex:/^\d+(\.\d{1,2})?$/',
                'failure_date'                  => 'nullable',
                'work_done_date'                => 'nullable',
                'defect_details'                => 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
                
            ]);
            
          DB::beginTransaction();
            try {
           
        		
            $claim=Claim::find($request->claim_id);
            $claim->claim_reference                 =$request->claim_ref_no;
            $claim->model                           =$request->model;
            $claim->run_hour                        =$request->run_hour;
            $claim->operating_hours_last_service    =$request->operating_hours_last_service;
            $claim->service_by                      =$request->service_by;
            $claim->comission_date                  =$request->comission_date;
            $claim->failure_date                    =$request->failure_date;
            $claim->work_done_date                  =$request->work_done_date;
            $claim->defect_details                  =$request->defect_details;
            $claim->defect_issue                     =$request->defect_issue;
            $claim->oil_consumption                 =$request->oil_consumption;
            $claim->ambient_temperature             =$request->ambient_temperature;
            $claim->action_taken                    =$request->action_taken;
            $claim->currency                        =$request->currency;
            $claim->vat                             =$request->vat;
            $claim->grand_total                     =$request->grand_total;
            if($request->status != 0){
                 $claim->status                     =$request->status;
            }
            $claim->save();
            if (Session::get("claim_edit_session_product_array") != null) {
                
                foreach (Session::get("claim_edit_session_product_array") as $keys => $values){
        			$claimProduct=ClaimProduct::where('claim_id','=',$request->claim_id)->where('part_id','=',Session::get("claim_edit_session_product_array")[$keys]['part_id'])->first();
        			
        			if($claimProduct){
        			    $claimProduct->part_id= Session::get("claim_edit_session_product_array")[$keys]['part_id'];
            			$claimProduct->qty= Session::get("claim_edit_session_product_array")[$keys]['part_quantity'];
            			$claimProduct->unit_price= Session::get("claim_edit_session_product_array")[$keys]['part_price'];
            			$claimProduct->total_price= Session::get("claim_edit_session_product_array")[$keys]['part_price'] *Session::get("claim_edit_session_product_array")[$keys]['part_quantity'];
            			$claimProduct->save();
        			}elseif(!$claimProduct){
        			    $claimProduct=new ClaimProduct();
        			    $claimProduct->claim_id= $request->claim_id;
        			    $claimProduct->part_id= Session::get("claim_edit_session_product_array")[$keys]['part_id'];
            			$claimProduct->qty= Session::get("claim_edit_session_product_array")[$keys]['part_quantity'];
            			$claimProduct->unit_price= Session::get("claim_edit_session_product_array")[$keys]['part_price'];
            			$claimProduct->total_price= Session::get("claim_edit_session_product_array")[$keys]['part_price'] *Session::get("claim_edit_session_product_array")[$keys]['part_quantity'];
            			$claimProduct->status= "Active";
            			$claimProduct->save();
        			}
        			
        			
        			$stock=Stock::where('product_id','=',Session::get("claim_edit_session_product_array")[$keys]['part_id'])->first();
        			//$stock->decrement('qty', Session::get("claim_edit_session_product_array")[$keys]['part_quantity']);
        		}
        		Session::forget('claim_edit_session_product_array');
            }
            
      
		DB::commit();
             return response()->json(['message'=>'<span class="alert alert-success col-md-12" role="alert" >Data successfully edited.</span>']);
        } catch (Exception $e) {
            DB::rollBack();
            return response()->json(['error' =>  'Claim  rollback!']);
        }
    }
    
     
     
    public function claim_list_excel($type){
        if($type== 'Claim'){
            $claims=DB::table('claims')
                ->leftjoin('service_warrenties','service_warrenties.id','=','claims.reg_id')
                ->leftjoin('products','service_warrenties.product_id','=','products.id')
                ->leftjoin('categories','service_warrenties.category_id','=','categories.id')
                ->select('claims.*','service_warrenties.first_name','service_warrenties.last_name','service_warrenties.company_name','service_warrenties.phone','service_warrenties.serial_no','products.name as productName',
                'products.model as productModel','categories.name as categoryName')
                ->orderBy('claims.id','DESC')
                ->where('claim_type','=','Claim')
                 ->where('claims.status','!=','Inactive')
                ->get();
            return Excel::download(new ClaimExport($claims),'claims.xlsx');
        }elseif($type== 'Service'){
          $claims=DB::table('claims')
                ->leftjoin('service_warrenties','service_warrenties.id','=','claims.reg_id')
                ->leftjoin('products','service_warrenties.product_id','=','products.id')
                ->leftjoin('categories','service_warrenties.category_id','=','categories.id')
                ->leftjoin('employees','claims.engineer_id','=','employees.id')
                ->select('claims.*','employees.name as serviceBy','service_warrenties.first_name','service_warrenties.last_name','service_warrenties.company_name','service_warrenties.phone','service_warrenties.serial_no','products.name as productName',
                'products.model as productModel','categories.name as categoryName')
                ->orderBy('claims.id','DESC')
                ->where('claim_type','=','Service')
                 ->where('claims.status','!=','Inactive')
                ->get();
            return Excel::download(new ServiceExport($claims),'services.xlsx');
        }
        
        
          
     
    }
    
    
    
    
    public function attachment($id){
        $attachments=ClaimAttachment::where('claim_id','=',$id)->where('deleted','=','No')->get();
        return view('backend.claims.attachmentView',['id'=>$id,'attachments'=>$attachments]);
    }
    
    public function storeClaimAttachment(Request $request){
        $request->validate([
            'claim_attachment' => 'required|mimes:png,jpg,jpeg,pdf,xlx,csv|max:2048'
        ]);
        $filename=time().'.'.$request->claim_attachment->extension();
        $request->claim_attachment->move(public_path('upload'), $filename);
        
        $attachment=new ClaimAttachment();
        $attachment->claim_id=$request->claim_id;
        $attachment->claim_attachment=$filename;
        $attachment->date=date('d-m-Y');
        $attachment->entry_by=auth()->user()->id;
        $attachment->deleted='No';
        $attachment->save();
        return redirect()->route('claim.attachment',$request->claim_id)->with('message','Attachment successfully added');
    }
    
    
    public function attachmentDetails($id){
        $attachment=ClaimAttachment::find($id);
        if($attachment){
            return response()->file(public_path('upload/'.$attachment->claim_attachment),['content-type'=>$attachment->claim_attachment]);
            return $attachment->claim_attachment;
        }else{
            abort(404);
        }
    }
    
    
    public function attachmentDelete($id){
        $attachment=ClaimAttachment::find($id);
        $attachment->deleted='Yes';
        $attachment->save();
         return redirect()->route('claim.attachment',$attachment->claim_id)->with('message','Attachment successfully deleted');
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
