<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Product;
use App\Models\Customer;
use App\Models\ServiceWarrenty;
use App\Models\WarrentyType;
use App\Models\WarrentyCustomer;
use PDF;
use Illuminate\Support\Facades\DB;

use App\Exports\WarrentyListExport; 
use Maatwebsite\Excel\Facades\Excel;

class WarrentyController extends Controller
{
    public function index(){
        return view('backend.warrenty.home');
    }

    public function searchView(){
        $warrenties = ServiceWarrenty::where('status','=','Active')->latest()->get();
        return view('backend.warrenty.search.searchData',['warrenties'=>$warrenties]);
    }
    
    public function search(){
        return view('backend.warrenty.search');
    }



    public function addRegistration(){
        return view('backend.warrenty.addRegistration');
    }

    public function saveStep2(Request $request){
        $validated = $request->validate([
            'checked' => 'required'
        ]);
        $categories=Category::where('deleted','=','No')->where('status','=','Active')->get();
        return view('backend.warrenty.step2form',['categories'=>$categories]);
    }

    public function saveStepTwoPost(Request $request){

        $validated = $request->validate([
            'category_id' => 'required',
            'product_id' => 'required',
            'serial_no' => 'required',
            'registered_by' => 'required',
        ]);
        DB::beginTransaction();
		try {
            if (empty($request->session()->get('service'))){
                
                $warrentyCode = ServiceWarrenty::max('reg_id');
    			$warrentyCode++;
    			$warrentyCode=str_pad($warrentyCode, 6, '0', STR_PAD_LEFT);
    			
                $service= new ServiceWarrenty();
                
                $random = 'WR-'.date('Y').'-'.$warrentyCode;
                $service->registration_number=$random;
                $service->fill($validated);
                $request->session()->put('service',$service);
            }else{
                $service= $request->session()->get('service');
                $service->fill($validated);
                $request->session()->put('service',$service);
            }
            
            
			DB::commit();
		    return redirect()->route('installationForm');
		} catch (Exception $e) {
			DB::rollBack();
			return response()->json(['error' =>  $e->getMessage()]);
		}
    }


    public function getProduct(Request $request){
        $products=Product::where('category_id',$request->category_id)->get();
        $html = '';
        $html .='<label  class="form-label">Product Info and Serial No</label>
                <select class="form-select" id="product_name" name="product_id" onchange="getProductDetails()" required>
                <option value="">Select Product info and serial No.</option>';
        foreach($products as $product){
            $html .='<option value="'.$product->id.'">'.$product->name.'<br><span class="text-success"> -- '.$product->serial_no.'</span></option>';
        }
            $html .='</select>';
        return $html;
    }


    public function getProductData(Request $request){

        $product=Product::find($request->product_id);

        $html='';
        $html .='<h5>General Details</h5>
                <div class="table">
                    <table  width="50%" class="table table-bordered  table-hover m-0">
                        <tr>
                            <td width="40%">Product:</td>
                            <td width="60%">'.$product->name.'</td>
                        </tr>
                        <tr>
                            <td width="40%">Serial No:</td>
                            <td width="60%"><input type="text" name="serial_no" value="'.$product->serial_no.'" hidden>'.$product->serial_no.'</td>
                        </tr>
                        <tr>
                            <td width="40%">Issued By:</td>
                            <td width="60%"><input type="text" name="registered_by" value="'.$product->user->name.'" hidden>'.$product->user->name.'</td>
                        </tr>
                        <tr>
                            <td width="40%">Dispatched ex factory Date:</td>
                            <td width="60%">'.$product->ex_factory_date.'</td>
                        </tr>
                    </table>
                </div>';

        return $html;

    }



    public function installationForm(){
        return view('backend.warrenty.step3form');
    }

    public function saveInstallationForm(Request $request){


        $validated = $request->validate([
            'instalation_date' => 'required',
            'warrenty_type' => 'required',
            'application_type' => 'required',
            'imei_number' => 'required',
            'annual_run_hour' => 'required',
            'estimited_first_service_date' => 'required'
        ]);


            $service= $request->session()->get('service');
            $service->fill($validated);
            $request->session()->put('service',$service);

        return redirect()->route('userDetailsForm');
    }


    public function userDetailsForm(){
        return view('backend.warrenty.step4form');
    }



    public function getCustomerInfo(Request $request){
        $customer=Customer::where('phone','=',$request->phone)->first();
        return $customer;
    }

    public function saveUserDetailsForm(Request $request){
       
        $validated = $request->validate([
            'company_name'=> 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
            'address'=> 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
            'city'=> 'required',
            'post_code'=> 'nullable|numeric',
            'country'=> 'required',
            'first_name'=> 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
            'phone'=> 'required|min:11|max:15|regex:/^([0-9\+]*)$/',
            'email'=> 'nullable|email|max:255|regex:/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix',

        ]);
       DB::beginTransaction();
		try {
        $checkPreviousCustomer=Customer::find($request->customer_id);
        if($checkPreviousCustomer){
            $customer=Customer::find($request->customer_id);
            $customer->name=$request->first_name;
            $customer->company_name=$request->company_name;
            $customer->email=$request->email;
            $customer->address=$request->address;
            $customer->city=$request->city;
            $customer->country=$request->country;
            $customer->post_code=$request->post_code;
            $customer->save();
        }else{
            $customer= new Customer();
            $customer->name=$request->first_name;
            $customer->company_name=$request->company_name;
            $customer->email=$request->email;
            $customer->phone=$request->phone;
            $customer->address=$request->address;
            $customer->city=$request->city;
            $customer->country=$request->country;
            $customer->post_code=$request->post_code;
            $customer->save();
        }
        
        
        
        $data=[
            'company_name'=>$request->company_name,
            'address'=> $request->address,
            'city'=> $request->city,
            'post_code'=> $request->post_code,
            'country'=> $request->country,
            'first_name'=> $request->first_name,
            'phone'=> $request->phone,
            'email'=> $request->email,
            'customer_id'=>$customer->id
            ];
        
        $service= $request->session()->get('service');
        $service->fill($data);
        $request->session()->put('service',$service);
        

        
	    DB::commit();
		    return redirect()->route('uploadForm');
		} catch (Exception $e) {
			DB::rollBack();
			return response()->json(['error' =>  $e->getMessage()]);
		}
    }


    public function uploadForm(){
        return view('backend.warrenty.step5form');
    }

    public function saveUploadForm(Request $request){

       // return $request;
        $request->validate([
            'comission_form' => 'required|mimes:png,jpg,jpeg,pdf,xlx,csv|max:2048'
        ]);
        $filename=time().'.'.$request->comission_form->extension();
        $request->comission_form->move(public_path('upload'), $filename);
        $document = [
            'comission_form' => $filename
        ];
        
        $service= $request->session()->get('service');
        $service->fill($document);
        $request->session()->put('service',$service);

        return redirect()->route('submitForm');
    }


    public function submitForm(){
        return view('backend.warrenty.step6form');
    }

    public function saveSubmitForm(Request $request){

        DB::beginTransaction();
		try {

            $service= $request->session()->get('service');
            $maxCode = ServiceWarrenty::max('reg_id');
    		$maxCode++;
    		$maxCode=str_pad($maxCode, 6, '0', STR_PAD_LEFT);
            $service->reg_id=$maxCode;
            
            $n = 13;
            $token = bin2hex(random_bytes($n));
            
            $instalationDate=$service->instalation_date;
            $warrentyTime=$service->warrenty_type;
            $expireDate= date('Y-m-d', strtotime($instalationDate. ' + '.$warrentyTime.' years'));
            
            $service->token='WR' . $token;
            $service->expire_date= $expireDate;
            $service->save();
            $request->session()->forget('service');

            $warrentyCustomer= new WarrentyCustomer();
            $warrentyCustomer->reg_id=$service->id;
            $warrentyCustomer->customer_id=$service->customer_id;
            $warrentyCustomer->created_date=date('d-m-Y');
            $warrentyCustomer->save();

        DB::commit();
		    return redirect()->route('warrenty.home')->with('message','Data added Successfully');
		} catch (Exception $e) {
			DB::rollBack();
			return response()->json(['error' =>  $e->getMessage()]);
		}
        

    }




    public function details($id){
         $serviceWarrenty=ServiceWarrenty::find($id);
         if($serviceWarrenty){
            $product=Product::find($serviceWarrenty->product_id);
            $category=Category::find($product->category_id);
            $warrentyType=WarrentyType::find($serviceWarrenty->warrenty_type);
           $customer=Customer::find($serviceWarrenty->customer_id);
            $pdf = PDF::loadView('backend.warrenty.search.searchDetails',['serviceWarrenty'=>$serviceWarrenty,'product'=>$product,'category'=>$category,'warrentyType'=>$warrentyType,'customer'=>$customer]);
		    return $pdf->stream('registration-report-pdf.pdf', array("Attachment" => false));
         }else{
             abort(404);
         }
         
       
    }


    public function delete($id){
         $serviceWarrenty=ServiceWarrenty::find($id);
         if($serviceWarrenty){
         $serviceWarrenty->status="Inactive";
         $serviceWarrenty->save();
         return redirect()->back()->with('message','Data deleted Successfully');
         }else{
             abort(404);
         }
    }

    public function edit($id){
         $serviceWarrenty=ServiceWarrenty::find($id);
         $customer=Customer::find($serviceWarrenty->customer_id);
         $customerLists=WarrentyCustomer::leftjoin('customers','customers.id','=','warrenty_customers.customer_id')
                        ->where('warrenty_customers.reg_id','=',$id)
                        ->orderby('warrenty_customers.id','DESC')
                        ->get();
         if($serviceWarrenty){
         return view('backend.warrenty.search.edit',['serviceWarrenty'=>$serviceWarrenty,'customer'=>$customer,'customerLists'=>$customerLists]);
         }else{
            abort(404);
        }
    }

    public function updateUserDetailsForm(Request $request){
        $validated = $request->validate([
            'company_name'=> 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
            'address'=> 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
            'city'=> 'required',
            'post_code'=> 'nullable|numeric',
            'country'=> 'required',
            'first_name'=> 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
            'phone'=> 'required|min:11|max:15|regex:/^([0-9\+]*)$/',
            'email'=> 'nullable|email|max:255|regex:/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix'
        ]);
        //return $request;
        DB::beginTransaction();
		try {
	
        $checkPreviousCustomer=Customer::find($request->customer_id);
        if($checkPreviousCustomer){
            $customer=Customer::find($request->customer_id);
            $customer->name=$request->first_name;
            $customer->company_name=$request->company_name;
            $customer->email=$request->email;
            $customer->address=$request->address;
            $customer->city=$request->city;
            $customer->country=$request->country;
            $customer->post_code=$request->post_code;
            $customer->save();
        }else{
            $customer= new Customer();
            $customer->name=$request->first_name;
            $customer->company_name=$request->company_name;
            $customer->email=$request->email;
            $customer->phone=$request->phone;
            $customer->address=$request->address;
            $customer->city=$request->city;
            $customer->country=$request->country;
            $customer->post_code=$request->post_code;
            $customer->save();
        }
        $serviceWarrenty=ServiceWarrenty::find($request->warrenty_id);
        
        if($serviceWarrenty->customer_id != $request->customer_id){
            $lastCustomer=WarrentyCustomer::where('customer_id','=',$serviceWarrenty->customer_id)
                            ->where('reg_id','=',$request->warrenty_id)
                            ->orderby('id','Desc')
                            ->first();
                if($lastCustomer){
                    $lastCustomer->end_date=date('d-m-Y');
                    $lastCustomer->save();
                }
            $warrentyCustomer= new WarrentyCustomer();
            $warrentyCustomer->reg_id=$request->warrenty_id;
            $warrentyCustomer->customer_id=$customer->id;
            $warrentyCustomer->created_date=date('d-m-Y');
            $warrentyCustomer->save();
            $serviceWarrenty->customer_id=$customer->id;
            $serviceWarrenty->save();
            
        }
        
            
        DB::commit();
		    return redirect()->route('search.view')->with('message','Data updated Successfully');
		} catch (Exception $e) {
			DB::rollBack();
			return response()->json(['error' =>  $e->getMessage()]);
		}
    }


    public function attachment($id){
        $serviceWarrenty=ServiceWarrenty::find($id);
        if($serviceWarrenty){
            return response()->file(public_path('upload/'.$serviceWarrenty->comission_form),['content-type'=>$serviceWarrenty->comission_form]);
            return $serviceWarrenty->comission_form;
        }else{
            abort(404);
        }
        
    }

     public function generateWarrentyQR($id){
            if($id){
                $info=DB::table('service_warrenties') 
                    ->leftjoin('products','service_warrenties.product_id','products.id')
                    ->select('service_warrenties.*','products.name as product_name','products.model as product_model')
                    ->where('service_warrenties.id','=',$id)
                    ->first();
              
                $pdf = PDF::loadView('backend.warrenty.warrentyQrPdf',['info' => $info]);
    		    return $pdf->stream('Warrenty-QR-pdf.pdf', array("Attachment" => false));
            }else{
                abort(404);
            }
        }



    public function warrenty_list_excel(){
         $warrenties = ServiceWarrenty::where('status','=','Active')->latest()->get();
         return Excel::download(new WarrentyListExport($warrenties),'Warrenty Register.xlsx'); 
    }
    


}
