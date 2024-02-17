<?php

namespace App\Http\Controllers;
use App\Models\Role;
use Illuminate\Http\Request;

class RolesController extends Controller
{
    public function roles_list(){
        return view('backend.roles.rolesList');
    }
    
    
    public function getRoles(){
        $data = "";
        $roles = Role::where('deleted', 'No')->orderBy('id', 'DESC')->get();
        $output = array('data' => array());
        $i = 1;
        foreach ($roles as $role) {
           
           
            $button = '<td style="width: 12%;">
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-cog"></i>
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                <li class="action" onclick="editCategory(' . $role->id . ')"  ><a  class="btn" ><i class="fas fa-edit"></i> Edit </a></li>
                                    
                                <li class="action"><a   class="btn"  onclick="confirmDelete(' . $role->id . ')" ><i class="fas fa-trash-alt"></i> Delete </a></li>
                                </ul>
                            </div>
                        </td>';

            $output['data'][] = array(
                $i++,
                $role->name,
                $role->status,
                $button
            );
        }

        return $output;
    }
    
    
    public function store(Request $request){
        
         $validated = $request->validate([
            'role_name' => 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u'
        ]);
        
        $roles= new Role();
        $roles->name=$request->role_name;
        $roles->guard_name='web';
        $roles->deleted='No';
        $roles->status='Active';
        $roles->save();
        return response()->json(['success' => 'Role Created Successfully.']);
    }
    
    
    public function edit(Request $request){
        $role=Role::find($request->id);
        return $role;
        
    }
    
    
    
    public function update(Request $request){
         $validated = $request->validate([
            'role_name' => 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u'
        ]);
        
        $roles= Role::find($request->id);
        $roles->name=$request->role_name;
        $roles->status=$request->status;
        $roles->save();
        return response()->json(['success' => 'Role updated Successfully.']);
    }
    
    
    public function delete(Request $request){
        $roles= Role::find($request->id);
        $roles->deleted="Yes";
        $roles->status="Inactive";
        $roles->save();
        return response()->json(['success' => 'Role deleted Successfully.']);
    }
    
    
    
}
