<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ShopSetting;

class HomeController extends Controller
{
    
    public function __construct()
    {
        $this->middleware('auth');
    }

    
    public function index()
    {
        return view('backend.warrenty.home');
    }
    
    public function shopSettingIndex(){
         $setting=ShopSetting::find(1);
        return view('backend.setting.shopSetting',['setting'=>$setting]);
    }
    
    public function updateSetting(Request $request){
       $setting=ShopSetting::find(1);
       $setting->name=$request->name;
       $setting->email=$request->email;
       $setting->phone=$request->phone;
       $setting->address=$request->address;
       $setting->fax=$request->fax;
       $setting->report_header=$request->company_report_header;
       $setting->report_footer=$request->company_report_footer;
       $setting->save();
       return redirect()->back()->with('success', 'Updated Successfully');
    }
    
    
    
    
    
    
}
