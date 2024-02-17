<?php

namespace App\Http\Controllers;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;
use Auth;
use PDF;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    public function index(){
        $categories=Category::where('status','Active')->where('deleted','No')->get();
        return view('backend.product.view',['categories'=>$categories]);
    }


    public function store(Request $request){
        
        $validated = $request->validate([
            'name' => 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
            'serial' => 'required|max:255',
            'category_id' => 'required',
            'model' => 'required'
        ]);

       
            
        $product=new Product();
        $product->name=$request->name;
        $product->ex_factory_date=$request->ex_factory_date;
        $product->serial_no=$request->serial;
        $product->model=$request->model;
        $product->category_id=$request->category_id;
        
        $product->status='Active';
        $product->deleted='No';
        $product->created_by=Auth::id();
        $product->created_date=date('d-m-Y');
        $product->save();
        $message="Product saved successfully";
        return $message;


    }



    public function getProducts(){
        $data = "";
        $products = Product::where('deleted', 'No')->where('status','Active')->orderBy('id', 'DESC')->get();
        $output = array('data' => array());
        $i = 1;
        $category='';
        foreach ($products as $product) {
           
           $editDisplay='';
            if (Auth::guard('web')->user()->can('Product Edit')){ 
                $editDisplay='d-block';
            }else{
                $editDisplay='d-none';
            }
           
                $deleteDisplay='';
            if (Auth::guard('web')->user()->can('Product Delete')){
                $deleteDisplay='d-block';
            }else{
                $deleteDisplay='d-none';
            }
           
           $category=Category::find($product->category_id);
            $button = '<td style="width: 12%;">
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-cog"></i>
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                <li class="action '.$editDisplay.'" onclick="editProduct(' . $product->id . ')"  ><a  class="btn" ><i class="fas fa-edit"></i> Edit </a></li>
                                    
                                <li class="action '.$deleteDisplay.'"><a   class="btn"  onclick="confirmDelete(' . $product->id . ')" ><i class="fas fa-trash-alt"></i> Delete </a></li>
                                </ul>
                            </div>
                        </td>';

            $output['data'][] = array(
                $i++,
                $product->ex_factory_date,
                $product->name,
                $product->model,
                $category->name,
                $product->serial_no,
                $product->status,
                $button
            );
        }

        return $output;
    }



    public function editProduct(Request $request){
        $product=Product::find($request->id);
        return $product;
    }



    public function update(Request $request){
        $validated = $request->validate([
            'name' => 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
            'serial' => 'required|max:255',
            'category_id' => 'required',
            'model'      => 'required',
            'status'      => 'required'
        ]);
        $product=Product::find($request->id);
        $product->name=$request->name;
        $product->ex_factory_date=$request->ex_factory_date;
        $product->model=$request->model;
        $product->serial_no=$request->serial;
        $product->category_id=$request->category_id;
        $product->status=$request->status;
        $product->save();
        $message="Product updated successfully";
        return $message;
    }



    public function delete(Request $request){
        $product=Product::find($request->id);
        $product->status="Inactive";
        $product->deleted="Yes";
        $product->deleted_by=Auth::id();
        $product->deleted_date=date('d-m-Y');
        $product->save();
        $message="Product deleted successfully";
        return $message;
    }

    public function qrCode($id){
        if($id){
            $info=DB::table('service_warrenties') 
                ->leftjoin('products','service_warrenties.product_id','products.id')
                ->select('service_warrenties.*','products.name as product_name','products.model as product_model')
                ->where('service_warrenties.id','=',$id)
                ->first();
           $url='http://english-bangla-dictionary.com/trident/details/registration/'.$id;
            $pdf = PDF::loadView('backend.warrenty.warrentyQrPdf',['info' => $info,'url'=>$url]);
		    return $pdf->stream('Warrenty-QR-pdf.pdf', array("Attachment" => false));
        }else{
            abort(404);
        }
    }





}
