<?php

namespace App\Http\Controllers;
use App\Models\Employee;
use Illuminate\Http\Request;
use Auth;
use PDF;
use Illuminate\Support\Facades\DB;


class EmployeeController extends Controller
{
    
    public function index(){
       
        return view('backend.employee.employee_list');
    }
    
    
    public function getEmployees(){
        $data = "";
        $employees = Employee::where('deleted', 'No')->where('status','Active')->orderBy('id', 'DESC')->get();
        $output = array('data' => array());
        $i = 1;
        $category='';
        foreach ($employees as $employee) {
            $editDisplay='';
            if (Auth::guard('web')->user()->can('Employee Edit')){ 
                $editDisplay='d-block';
            }else{
                $editDisplay='d-none';
            }
           
                $deleteDisplay='';
            if (Auth::guard('web')->user()->can('Employee Delete')){
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
                                <li class="action '.$editDisplay.'" onclick="editemployee(' . $employee->id . ')"  ><a  class="btn" ><i class="fas fa-edit"></i> Edit </a></li>
                                <li class="action"><a   class="btn"  onclick="QRCode(' . $employee->id . ')" ><i class="fa-solid fa-qrcode"></i> QR Code </a></li>
                                <li class="action '.$deleteDisplay.'"><a   class="btn"  onclick="confirmDelete(' . $employee->id . ')" ><i class="fas fa-trash-alt"></i> Delete </a></li>
                                </ul>
                            </div>
                        </td>';

            $output['data'][] = array(
                $i++,
                $employee->name,
                $employee->serial_no,
                $employee->designation,
                $employee->status,
                $button
            );
        }

        return $output;
    }
    
    
    
    public function store(Request $request){
        $validated = $request->validate([
            'name' => 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
            'designation' => 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u'
        ]);

        $n = 13;
        $token = bin2hex(random_bytes($n));
        
        $Code = Employee::max('serial_no');
		$Code++;
		$Code=str_pad($Code, 6, '0', STR_PAD_LEFT);
		
        $employee=new Employee();
        $employee->name=$request->name;
        $employee->designation=$request->designation;
        $employee->serial_no=$Code;
        $employee->token='ENG'. $token;
        
        $employee->status='Active';
        $employee->deleted='No';
        $employee->created_by=Auth::id();
        $employee->created_date=date('d-m-Y');
        $employee->save();
        $message="Employee saved successfully";
        return $message;
    }
    
    
    
    public function editProduct(Request $request){
      return  $employees = Employee::find($request->id);
    }
    
    
    public function update(Request $request){
        $validated = $request->validate([
            'name' => 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u',
            'designation' => 'required|max:255|regex:/^([a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+\s)*[a-zA-Z0-9_ "\.\-\s\,\;\:\/\&\$\%\(\)]+$/u'
        ]);


        $employee=Employee::find($request->id);
        $employee->name=$request->name;
        $employee->designation=$request->designation;
        $employee->save();
        $message="Employee updated successfully";
        return $message;
    }
    
    
    public function delete(Request $request){
        $employee=Employee::find($request->id);
        $employee->status="Inactive";
        $employee->deleted="Yes";
        $employee->save();
         $message="Employee deleted successfully";
        return $message;
    }
    
    
    public function QRcode($id){
        $employee=Employee::find($id);
        if($employee){
            $pdf = PDF::loadView('backend.employee.employeeDetailsPdf',['employee' => $employee]);
    		return $pdf->stream('employee-QR-pdf.pdf', array("Attachment" => false));
        }else{
            abort(404);
        }
    }
    
    
    
}
