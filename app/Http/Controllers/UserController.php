<?php

namespace App\Http\Controllers;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Image;

use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
        
        public function index(){
            $user=User::find(Auth::user()->id);
            $roles=Role::all();
            return view('backend.user.profile',['user'=>$user,'roles'=>$roles]);
        }



        public function save(Request $request){
            //return $request;
           $request->validate([
    		'name' => 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
    		'email' => 'required|email|regex:/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix',
    		'mobile_no' => 'required|unique:users,mobile|max:14|min:11|regex:/^(?:\+?88)?01[11-9]\d{8}$/u',
    		'address' => 'nullable|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
			'designation' => 'nullable|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u'
        ]);
        
        // $slug = preg_replace('/[^A-Za-z0-9-]+/', '-', $request->name);
        // $imageName = '';
	
            
        //     $userImage = $request->file('image'); 
        //     $name = $slug;
        //     $uploadPath = 'upload/user_images/';
        //     $imageName = time().$name;
        //     $imageUrl = $uploadPath.$imageName;
            
        //     Image::make($userImage)->resize(100,100)->save($imageUrl);
       
	    $users=User::where('deleted','=','No')->get();
    	$user= new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->address = $request->address;
        $user->designation = $request->designation;
        $user->mobile = $request->mobile_no;
       // $user->image = $imageName;
        $user->password = Hash::make($request->password);
        $user->role=$request->role;
        $user->created_by = auth()->user()->id;
        $user->created_date = date('Y-m-d H:i:s');
        $user->deleted = 'No';
        $user->status = 'Active';
        $user->save();
         $user->assignRole($request->role);
         
         return redirect()->route('user_list', ['message'=>'User saved successfully','users'=>$users]);
    	
        }


    public function user_list(){
         $users=User::where('deleted','=','No')->orderby('id','DESC')->get();
        return view('backend.user.list',['users'=>$users]);
    }



    public function userEdit($id){
         $user=User::find($id);
         $roles=Role::all();
            return view('backend.user.profileEdit',['user'=>$user,'roles'=>$roles]);
        
    }
    
    public function update(Request $request){
        $user=User::find($request->id);
        if($request->old_password == $request->new_password){
            if(Hash::check($request->old_password, $user->password)){
                $user->password = Hash::make($request->new_password);
                $user->name = $request->name;
                $user->email = $request->email;
                $user->address = $request->address;
                $user->designation = $request->designation;
                $user->mobile = $request->mobile_no;
                    if($request->role != '0'){
                        $user->role=$request->role;
                    }
                $user->save();
            }else{
                $user->name = $request->name;
                $user->email = $request->email;
                $user->address = $request->address;
                $user->designation = $request->designation;
                $user->mobile = $request->mobile_no;
                
                    if($request->role != '0'){
                        $user->role=$request->role;
                    }
                $user->save();
            }
            if($request->role != '0'){
                $user->assignRole($request->role);
            }
             
            return redirect()->route('user_list')->with('success', 'Updated Successfully');
        }else{
            return redirect()->route('user_list')->with('error', 'Old and new password mismatch.');
        }
        
        //return response()->json(['success'=>'User updated successfully']);
        
    }

    public function userDelete($id){
        $user=User::find($id);
        $user->deleted="Yes";
        $user->save();
        return redirect()->back()->with('success', 'Deleted Successfully');
        //return response()->json(['success'=>'User deleted successfully']);
    }












}
