<?php

namespace App\Http\Controllers;
use App\Models\Category;
use App\Models\SpareParts;
use App\Models\Stock;
use Illuminate\Http\Request;
use PDF;
use Illuminate\Support\Facades\DB;
use App\Exports\SparePartsExport;
use Maatwebsite\Excel\Facades\Excel;

class ProductPartsController extends Controller
{
    public function index(){
        $parts=SpareParts::where('status','=','Active')->get();
        return view('backend.spareParts.partsList',['parts'=>$parts]);
    }
    
    public function add_spare_parts(Request $request){
        $categories=Category::where('status','Active')->where('deleted','No')->get();
        return view('backend.spareParts.addSpareParts',['categories'=>$categories]);
    }
    
    
    public function store(Request $request){
        $request->validate([
            'name' => 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
            'opening_stock' => 'required|max:7|regex:/^\d+(\.\d{1,2})?$/',
            'category_id' => 'required',
            'product_code' => 'required|unique:spare_parts,product_code',
            'unit' => 'required|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
            'model_no' => 'required|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
            'purchase_price' => 'required|regex:/^\d+(\.\d{1,2})?$/',
            'sale_price' => 'required|regex:/^\d+(\.\d{1,2})?$/'
        ]);
        
        $n = 13;
        $token = bin2hex(random_bytes($n));
        
        $parts= new SpareParts();
        $parts->name=$request->name;
        $parts->token='SP' . $token;
        $parts->category_id=$request->category_id;
        $parts->unit=$request->unit;
        $parts->model=$request->model_no;
        $parts->product_code=$request->product_code;
        $parts->purchase_price=$request->purchase_price;
        $parts->sale_price=$request->sale_price;
        $parts->opening_qty=$request->opening_stock;
        $parts->status="Active";
        $parts->remarks=$request->notes;
        $parts->save();
        
        $stocks=new Stock();
        $stocks->product_id=$parts->id;
        $stocks->qty=$request->opening_stock;
        $stocks->save();
        
        return ['message'=>'<span class="alert alert-success col-md-12" role="alert" >Spare Part saved successfully.</span>'];
    }
    
    
    public function editSparePart($id){
        $part=SpareParts::find($id);
        $categories=Category::where('status','Active')->where('deleted','No')->get();
        return view('backend.spareParts.editSpareParts',['part'=>$part,'categories'=>$categories]);
    }
    
    
     public function update(Request $request){
        $request->validate([
            'name' => 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
            'opening_stock' => 'required|max:7|regex:/^\d+(\.\d{1,2})?$/',
            'category_id' => 'required',
            'product_code' => 'required',
            'unit' => 'required|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
            'model_no' => 'required|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
            'purchase_price' => 'required|regex:/^\d+(\.\d{1,2})?$/',
            'sale_price' => 'required|regex:/^\d+(\.\d{1,2})?$/',
        ]);
        
        $parts=SpareParts::find($request->id);
        $parts->name=$request->name;
        $parts->category_id=$request->category_id;
        $parts->unit=$request->unit;
        $parts->model=$request->model_no;
        $parts->product_code=$request->product_code;
        $parts->purchase_price=$request->purchase_price;
        $parts->sale_price=$request->sale_price;
        $parts->opening_qty=$request->opening_stock;
        $parts->remarks=$request->notes;
        $parts->save();
        
        $stocks=new Stock();
        $stocks->product_id=$parts->id;
        $stocks->qty=$request->opening_stock;
        $stocks->save();
        
        return ['message'=>'<span class="alert alert-success col-md-12" role="alert" >Spare Part saved successfully.</span>'];
    }
    
     public function delete($id){
        $parts=SpareParts::find($id);
        $parts->status="Inactive";
        $parts->save();
        return redirect()->route('productParts')->with('message', 'Spare Part deleted successfully');
    }
   
     public function qrCode($id){
        if($id){
            $info=SpareParts::find($id);
            $pdf = PDF::loadView('backend.spareParts.sparePartsQrPdf',['info' => $info]);
		    return $pdf->stream('spare-parts-QR-pdf.pdf', array("Attachment" => false));
        }else{
            abort(404);
        }
    }
    
    
    public function exel(){
        $parts=SpareParts::where('status','=','Active')->get();
        return Excel::download(new SparePartsExport($parts),'parts.xlsx');
    }
    
}
