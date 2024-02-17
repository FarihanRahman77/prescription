<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ServiceWarrenty;
use Yajra\DataTables\Facades\DataTables;

//use Datatables;


class SearchController extends Controller
{

    public function fetSearchView(){
        return view('backend.warrenty.search.searchData');
    }


    public function getSearchDtat(Request $request)
    {
        if ($request->ajax()) {
            $data = ServiceWarrenty::latest()->get();
            return Datatables::of($data)
                ->addIndexColumn()
//                ->addColumn('action', function($row){
//                    $actionBtn = '<a href="javascript:void(0)" class="edit btn btn-success btn-sm" id="edit" value="2">Edit</a> <a href="javascript:void(0)" class="delete btn btn-danger btn-sm" id="delete" value="2">Delete</a>';
//                    return $actionBtn;
//                })

                ->addColumn('action', function($row){

                    // Update Button
                    $updateButton = "<button class='btn btn-sm btn-info updateUser' data-id='".$row->id."' data-bs-toggle='modal' data-bs-target='#updateModal' ><i class='fa-solid fa-pen-to-square'></i></button>";

                    // Delete Button
                    $deleteButton = "<button class='btn btn-sm btn-danger deleteUser' data-id='".$row->id."'><i class='fa-solid fa-trash'></i></button>";

                    return $updateButton." ".$deleteButton;

                })
                ->rawColumns(['action'])
                ->make(true);
        }
    }

    public function edit(Request $request){
        return $request;
    }


    // Read Employee record by ID
    public function getEmployeeData(Request $request){

        ## Read POST data
        $id = $request->post('id');

        $empdata = ServiceWarrenty::find($id);

        $response = array();
        if(!empty($empdata)){

            $response['emp_name'] = $empdata->emp_name;
            $response['email'] = $empdata->email;
            $response['city'] = $empdata->city;
            $response['gender'] = $empdata->gender;

            $response['success'] = 1;
        }else{
            $response['success'] = 0;
        }

        return response()->json($response);

    }

    // Update Employee record
    public function updateEmployee(Request $request){
        ## Read POST data
        $id = $request->post('id');

        $empdata = ServiceWarrenty::find($id);

        $response = array();
        if(!empty($empdata)){
            $updata['emp_name'] = $request->post('emp_name');
            $updata['email'] = $request->post('email');
            $updata['gender'] = $request->post('gender');
            $updata['city'] = $request->post('city');

            if($empdata->update($updata)){
                $response['success'] = 1;
                $response['msg'] = 'Update successfully';
            }else{
                $response['success'] = 0;
                $response['msg'] = 'Record not updated';
            }

        }else{
            $response['success'] = 0;
            $response['msg'] = 'Invalid ID.';
        }

        return response()->json($response);
    }

    // Delete Employee
    public function deleteEmployee(Request $request){

        ## Read POST data
        $id = $request->post('id');

        $empdata = ServiceWarrenty::find($id);

        if($empdata->delete()){
            $response['success'] = 1;
            $response['msg'] = 'Delete successfully';
        }else{
            $response['success'] = 0;
            $response['msg'] = 'Invalid ID.';
        }

        return response()->json($response);
    }


}
