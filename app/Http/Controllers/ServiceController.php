<?php

namespace App\Http\Controllers;
use App\Models\ServiceWarrenty;
use App\Models\Claim;
use App\Models\SpareParts;
use App\Models\Product;
use App\Models\ClaimProduct;
use App\Models\Stock;
use App\Models\Employee;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use PDF;
use Illuminate\Support\Facades\Session;

class ServiceController extends Controller
{
    public function index(){
        $service=DB::table('claims')
            ->leftjoin('service_warrenties','service_warrenties.id','=','claims.reg_id')
            ->leftjoin('products','service_warrenties.product_id','=','products.id')
            ->leftjoin('categories','service_warrenties.category_id','=','categories.id')
            ->leftjoin('employees','claims.engineer_id','=','employees.id')
            ->select('claims.*','employees.name as serviceBy','service_warrenties.first_name','service_warrenties.last_name','service_warrenties.company_name','service_warrenties.phone','service_warrenties.serial_no','products.name as productName',
            'products.model as productModel','categories.name as categoryName')
            ->orderBy('claims.id','DESC')
            ->where('claims.status','Active')
            ->where('claims.claim_type','Service')
            ->get();
           if($service){
               return view('backend.service.serviceList',['claims'=>$service]);
           }else{
               abort(404);
           }
         
    }
    
    
     public function create(){
        $registrations=ServiceWarrenty::select('id','serial_no')->get();
        if($registrations){
            return view('backend.service.service_create',['registrations'=>$registrations]);
        }else{
            abort(404);
        }
        
    }
    
    
     public function getWarrentyInfo(Request $request){
         $html='';
       if($request->token != null){
        $info=DB::table('service_warrenties')
                ->leftjoin('products','service_warrenties.product_id','products.id')
                ->select('service_warrenties.*','products.name as product_name','products.model as product_model')
                ->where('service_warrenties.token','=',$request->token)
                ->first();
                
         $html='';
         if($info){
             $html .='<h5>Registered Product Info</h5>
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
                    <div class="container">
                        <button class="btn btn-secondary  float-right m-2" onclick="serviceStepOneToTwo('.$info->id.')">Next</button>
                    </div>
                </div>';
            
                return $html;
         }else{
             return $html='<span class="text-danger">No record found</span>';
         }
       }else{
           return $html='<span class="text-danger">No record found</span>';
       }
    }
    
    
   public function stepTwoCreate($id){
      
        if($id){
            return view('backend.service.service_createStepTwo',['id'=>$id]);
        }else{
            abort(404);
        }
   }
    
    public function getEmployeeInfo(Request $request){
       $html='';
       if($request->token != null){
        $employee=Employee::where('token','=',$request->token)->first();
                
         $html='';
         if($employee){
             $html .='<h5>Employee Info</h5>
                <div class="table">
                    <table  width="100%" class="table table-bordered  table-hover m-0">
                        <tr>
                            <td width="40%">Employee Name:</td>
                            <td width="60%">'.$employee->name.'</td>
                        </tr>
                        <tr>
                            <td width="40%">Employee Designation:</td>
                            <td width="60%">'.$employee->designation.'</td>
                        </tr>
                        
                    </table>
                    <div class="container">
                        <button class="btn btn-secondary  float-right m-2" onclick="serviceStepTwoToThree('.$employee->id.')">Next</button>
                    </div>
                </div>';
            
                return $html;
         }else{
             return $html='<span class="text-danger">No record found</span>';
         }
       }else{
           return $html='<span class="text-danger">No record found</span>';
       }
    }
    
    
    public function stepThreeCreate($id, $registration_id){
         if($id && $registration_id){
            return view('backend.service.service_createStepThree',['id'=>$id,'registration_id'=>$registration_id]);
        }else{
            abort(404);
        }
    }
    
    
    
    public function serviceProductAddSession(Request $request){
       
        //return $request;
       $sparePart=SpareParts::where('token','=',$request->token)->first();
       
        $data = '';
        if($sparePart){
           
    		$available_quantity = 0;
    		if (Session::get("service_session_product_array") != null) {
    		    
    			$is_available = 0;
    			foreach (Session::get("service_session_product_array") as $keys => $values) {
    				if (Session::get("service_session_product_array")[$keys]['part_id'] == $sparePart->id) {
    				    //return 'ht';
    					$is_available++;
    					session()->put("service_session_product_array." . $keys . ".part_quantity", Session::get("service_session_product_array")[$keys]['part_quantity'] + $request->qty);
    				}
    			}
    			if ($is_available == 0) {
    				if(isset($request->part_id)) {
    				
    					$stocks = Stock::where('product_id','=',$sparePart->id)->first();
    					if ($stocks) {
    						$available_quantity = $stocks->qty;
    					} else {
    						$available_quantity = 0;
    					}
    				}
    				$sparePart=SpareParts::where('token','=',$request->token)->first();
    				$item_array = [
        				'part_id'                   =>     $sparePart->id,
        				'part_name'                 =>     $sparePart->name . ' - ' . $sparePart->model,
        				'available_qty'             =>     $available_quantity,
        				'part_price'                =>    $sparePart->sale_price,
        				'part_quantity'             =>    $request->qty
        			];
    				Session::push('service_session_product_array', $item_array);
    			}
    		} else {
                    $sparePart='';
                    $sparePart=SpareParts::where('token','=',$request->token)->first();
    		    if (isset($request->part_id)) {
    				
    				$stocks = Stock::where('product_id','=',$sparePart->id)->first();
    				if ($stocks) {
    					$available_quantity = $stocks->qty;
    				} else {
    					$available_quantity = 0;
    				}
    			}
    			//return $sparePart;
    			$item_array = [
    				'part_id'                   =>    $sparePart->id,
    				'part_name'                 =>    $sparePart->name . ' - ' . $sparePart->model,
    				'available_qty'             =>    $available_quantity,
    				'part_price'                =>    $sparePart->sale_price,
    				'part_quantity'             =>    $request->qty
    			];
    			Session::push('service_session_product_array', $item_array);
    		}
    		$data .= "Success";
    		return $data;
        }else{
            $data = "Error";
		    return $data;
        }
    }
    
    
    
     public function fetchSession(){
        
        $grandTotal = 0;
		$cart = '';
		if (Session::get('service_session_product_array') != null) {
			$i = 1;

			foreach (Session::get('service_session_product_array') as $keys => $values) {
				$unitPrice = Session::get("service_session_product_array")[$keys]["part_price"];
				$totalPrice = Session::get("service_session_product_array")[$keys]["part_quantity"] * $unitPrice;
				$productId = Session::get("service_session_product_array")[$keys]["part_id"];
				
				$cart .= '<tr><td style="text-align: center;">' . $i++ . '<input type="hidden" name="ids[]" id="id_' . $productId . '" value="' . $productId . '" /></td>' .
        					'<td>' . Session::get("service_session_product_array")[$keys]["part_name"].' </td>' .
        					'<td style="text-align: center;"><span id="available_qty_' . $productId . '">' . Session::get("service_session_product_array")[$keys]["available_qty"] . '</span></td>' .
        					'<td><input type="number" class="form-control" style="text-align: center;width: 100%;" id="quantity_' . $productId . '" name="quantity[]" onkeyup="loadCartandUpdate(' . $productId . ')" value="' . Session::get("service_session_product_array")[$keys]["part_quantity"] . '" /></td>' .
        					'<td><input type="number" class="form-control" style="text-align: center;width: 100%;" id="unitPrice_' . $productId. '"  name="unitPrice[]" onkeyup="loadCartandUpdate(' . $productId . ')" value="' . $unitPrice . '" /></td>' .
        					'<td style="text-align: right;"><span id="totalPrice_' . $productId .  '">' . $totalPrice . '</span></td>' .
        					'<td style="text-align: center;"><span onclick="removeSessionPart(' . Session::get("service_session_product_array")[$keys]["part_id"] .  ')" style="color:red;"><i class="fa fa-trash"> </i></span></td>
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

        if (Session::get("service_session_product_array") != null) {
			foreach (Session::get("service_session_product_array") as $keys => $values) {
				if (Session::get("service_session_product_array")[$keys]['part_id'] == $request->id) {
				    
				        session()->put("service_session_product_array." . $keys . ".part_quantity", $request->quantity);
    					session()->put("service_session_product_array." . $keys . ".part_price", $request->unitPrice);
    					$data = "Success";
				    
				}
			}
		} else {
			$data = "";
		}
		return $data;
    }
    
    
    public function clearSession(Request $request){
        Session::forget('service_session_product_array');
		$data = "Success";
		return $data;
    }
    
    
    
    public function removePart(Request $request){
        $id = $request->id;
		$data = '';
		$cartData = Session::get('service_session_product_array');
		foreach (Session::get("service_session_product_array") as $keys => $values) {
			if (Session::get("service_session_product_array")[$keys]['part_id'] == $id) {
				unset($cartData[$keys]);
				Session::put('service_session_product_array', $cartData);
				$data = "Success";
				break;
			}
		}
		$data = "Success";
		return $data;
    }
    
    
    public function store(Request $request){
        //return $request;
        $validated = $request->validate([
                'engineer_id'                   => 'required',
                'reg_id'                        => 'required',
                'run_hour'                      => 'required|numeric|regex:/^\d+(\.\d{1,2})?$/',
            ]);
            
            
          DB::beginTransaction();
            try {
            $registration=ServiceWarrenty::find($request->reg_id);
            $product=Product::find($registration->product_id);
            
            $maxCode = Claim::max('claim_serial');
    		$maxCode++;
    		$maxCode=str_pad($maxCode, 6, '0', STR_PAD_LEFT);
    		
            $service = new Claim();
            $service->customer_id                     =$registration->customer_id;
            $service->reg_id                          =$request->reg_id;
            $service->claim_serial                    =$maxCode;
            $service->year                            =date('Y');
            $service->serial_key                      ='WS';
            $service->model                           =$product->model;
            $service->run_hour                        =$request->run_hour;
            $service->service_by                      ='';
            $service->comission_date                  =$registration->instalation_date;
            $service->work_done_date                  =date('Y-m-d');
            $service->claim_type                      ="Service";
            $service->engineer_id                     =$request->engineer_id;
            $service->remarks                         =$request->remarks;
            $service->type                            ="saved";
            $service->status                          ="Active";
            $service->save();
            $lastId=$service->id;
            if (Session::get("service_session_product_array") != null) {
                
                foreach (Session::get("service_session_product_array") as $keys => $values){
        			$serviceProduct= new ClaimProduct();
        			$serviceProduct->claim_id= $lastId;
        			$serviceProduct->part_id= Session::get("service_session_product_array")[$keys]['part_id'];
        			$serviceProduct->qty= Session::get("service_session_product_array")[$keys]['part_quantity'];
        			$serviceProduct->unit_price= Session::get("service_session_product_array")[$keys]['part_price'];
        			$serviceProduct->total_price= Session::get("service_session_product_array")[$keys]['part_price'] *Session::get("service_session_product_array")[$keys]['part_quantity'];
        			$serviceProduct->status= "Active";
        			$serviceProduct->save();
        			
        			$stock=Stock::where('product_id','=',Session::get("service_session_product_array")[$keys]['part_id'])->first();
        			$stock->decrement('qty', Session::get("service_session_product_array")[$keys]['part_quantity']);
        		}
        		Session::forget('service_session_product_array');
            }
            
      
		DB::commit();
             return response()->json(['message'=>'<span class="alert alert-success col-md-12" role="alert" >Data successfully saved.</span>', 'lastId'=>$lastId]);
        } catch (Exception $e) {
            DB::rollBack();
            return response()->json(['error' =>  'Claim  rollback!']);
        }
    }
    
    
}
