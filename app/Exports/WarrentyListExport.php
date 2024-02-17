<?php

namespace App\Exports;

use App\Models\Claim;
use Maatwebsite\Excel\Concerns\FromCollection;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use Carbon\Carbon;

class WarrentyListExport implements FromView,ShouldAutoSize,WithStyles
{
    /**
    * @return \Illuminate\Support\Collection
    */
    // public function collection()
    // {
    //     return Claim::all();
    // }
    
    public function __construct($warrenties)
    {
        $this->warrenties = $warrenties;
        
    }
     public function view(): View
    {
        
            return view('backend.exports.WarrentyListExport', [
            'warrenties' =>$this->warrenties,
        ]);
        
        
    }
    
    public function styles(Worksheet $sheet)
    {
        return [
            // Style the first row as bold text.
            7    => ['font' => ['bold' => true]],
        ];
    }
}