<?php

namespace App\Http\Controllers;
use App\Models\Permission;
use Illuminate\Http\Request;

class PermissionController extends Controller
{
    public function permissions_list(){
        return view('backend.permission.permission_list');
    }
    
     public function getPermission(){
        $data = "";
        $permissions = Permission::where('deleted', 'No')->orderBy('id', 'DESC')->get();
        $output = array('data' => array());
        $i = 1;
        foreach ($permissions as $permission) {
            $button = '<td style="width: 12%;">
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-cog"></i>
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                <li class="action" onclick="editCategory(' . $permission->id . ')"  ><a  class="btn" ><i class="fas fa-edit"></i> Edit </a></li>
                                    
                                <li class="action"><a   class="btn"  onclick="confirmDelete(' . $permission->id . ')" ><i class="fas fa-trash-alt"></i> Delete </a></li>
                                </ul>
                            </div>
                        </td>';
            $output['data'][] = array(
                $i++,
                $permission ->group_name,
                $permission ->name,
                $permission->status,
                $button
            );
        }

        return $output;
    }
    
    
    
    public function store(Request $request){
         $validated = $request->validate([
            'group_name' => 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
            'name' => 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u'
        ]);
        
        $permission= new Permission();
        $permission->name=$request->name;
        $permission->group_name=$request->group_name;
        $permission->guard_name='web';
        $permission->deleted='No';
        $permission->status='Active';
        $permission->save();
        return response()->json(['success' => 'Permission Created Successfully.']); 
    }
    
    public function edit(Request $request){
        $permission=Permission::find($request->id);
        return $permission;
        
    }
    
    
     public function update(Request $request){
         $validated = $request->validate([
            'name' => 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
            'group_name' => 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u'
        ]);
        
        $roles= Permission::find($request->id);
        $roles->name=$request->name;
        $roles->group_name=$request->group_name;
        $roles->status=$request->status;
        $roles->save();
        return response()->json(['success' => 'Permission updated Successfully.']);
    }
    
    
    public function delete(Request $request){
        $roles= Permission::find($request->id);
        $roles->deleted="Yes";
        $roles->status="Inactive";
        $roles->save();
        return response()->json(['success' => 'Permission deleted Successfully.']);
    }
    
    
    
    
}
