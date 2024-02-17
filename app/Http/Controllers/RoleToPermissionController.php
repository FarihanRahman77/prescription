<?php

namespace App\Http\Controllers;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\User;
use Illuminate\Http\Request;

class RoleToPermissionController extends Controller
{
    public function index(){
        $permissions = Permission::where('deleted', '=', 'No')->get();
        $roles = Role::where('deleted', '=', 'No')->get();
        $permission_groups = User::getPermissionGroups();
        return view('backend.rolesToPermission.rolesToPermission',['permissions' => $permissions, 'roles' => $roles, 'permission_groups' => $permission_groups]);
    }
    
    
    public function create(){
       $permissions = Permission::where('deleted', '=', 'No')->get();
        $roles = Role::where('deleted', '=', 'No')->get();
        $permission_groups = User::getPermissionGroups();
        return view('backend.rolesToPermission.rolesToPermissionCreate',['permissions' => $permissions, 'roles' => $roles, 'permission_groups' => $permission_groups]);
    }
    
    
    public function store(Request $request){
         $request->validate([
            'role_id' => 'required'
        ]);

        $role = Role::find($request->role_id);
        
        $permissions = $request->input('permissions');

        if (!empty($permissions)) {
            $role->syncPermissions($permissions);

            return  redirect('/role/permission/permissions_list')->with('message', 'Permission Assigned sucessfully');
        }
    }
    
    
    public function delete($id){
        return $id;
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
