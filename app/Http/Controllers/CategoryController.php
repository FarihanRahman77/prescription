<?php

namespace App\Http\Controllers;
use App\Models\Category;
use Illuminate\Http\Request;
use Auth;

class CategoryController extends Controller
{
    public function index(){
      
        return view('backend.category.view');
    }


    public function getCategories(){
        
        $data = "";
        $categories = Category::where('deleted', 'No')->where('status','Active')->orderBy('id', 'DESC')->get();
        $output = array('data' => array());
        $i = 1;
        foreach ($categories as $category) {
                
                $editDisplay='';
            if (Auth::guard('web')->user()->can('Category Edit')){ 
                $editDisplay='d-block';
            }else{
                $editDisplay='d-none';
            }
           
                $deleteDisplay='';
            if (Auth::guard('web')->user()->can('Category Delete')){
                $deleteDisplay='d-block';
            }else{
                $deleteDisplay='d-none';
            }
           
            $button = '<td style="width: 12%;">
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-cog"></i>
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1"> 
                               
                                <li class="action '.$editDisplay.'" onclick="editCategory(' . $category->id . ')"  ><a  class="btn" ><i class="fas fa-edit"></i> Edit </a></li>
                               
                                <li class="action'.$deleteDisplay.'"><a   class="btn"  onclick="confirmDelete(' . $category->id . ')" ><i class="fas fa-trash-alt"></i> Delete </a></li>
                                </ul>
                            </div>
                        </td>';

            $output['data'][] = array(
                $i++,
                $category->name,
                $category->type,
                $category->status,
                $button
            );
        }

        return $output;
    }
   



    public function store(Request $request){
        $validated = $request->validate([
            'category_name' => 'required|max:255|unique:categories,name|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
            'category_type' => 'required'
        ]);
        
        $category=new Category();
        $category->name=$request->category_name;
        $category->type=$request->category_type;
        $category->status='Active';
        $category->deleted='No';
        $category->created_by=Auth::id();
        $category->save();
        $message="Category saved successfully";
        return $message;
    }


    public function editCategory(Request $request){
        $category=Category::find($request->id);
        return $category;
    }


    public function update(Request $request){
        $validated = $request->validate([
            'name' => 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
            'type' => 'required',
            'status' => 'required'
        ]);

        $category=Category::find($request->id);
        $category->name=$request->name;
        $category->type=$request->type;
        $category->status=$request->status;
        $category->updated_by=Auth::id();
        $category->updated_date=date('d-m-Y');
        $category->save();
        $message="Category Updated successfully";
        return $message;
    }


    public function delete(Request $request){
        $category=Category::find($request->id);
        $category->status="Inactive";
        $category->deleted="Yes";
        $category->deleted_by=Auth::id();
        $category->deleted_date=date('d-m-Y');
        $category->save();
        $message="Category deleted successfully";
        return $message;
    }

}
