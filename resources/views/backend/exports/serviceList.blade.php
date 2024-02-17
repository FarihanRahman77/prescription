<table style="table-layout: auto;width: 100%;">
	<thead>
	    	<tr><td colspan="13" style="text-align: center;"> {{@$setting->name}} </td></tr>
	    	<tr><td colspan="13" style="text-align: center;"> {{@$setting->address}} </td></tr>
	    	<tr><td colspan="13" style="text-align: center;"> Hotline: {{@$setting->phone}}</td></tr>
	    	<tr><td colspan="13" style="text-align: center;"> Email: {{@$setting->email}} </td></tr>
	    	<tr><td colspan="13" style="text-align: center;"> Fax: {{@$setting->fax}} </td></tr>
	    	<tr><td colspan="13" style="text-align: center;"> </td></tr>
		<tr>
            <th style="text-align:center;">Sl</th>
            <th style="text-align:center;">Date</th>
            <th style="text-align:center;">Service No</th>
            <th style="text-align:center;">Hours Run</th>
            <th style="text-align:center;">Comission Date</th>
            <th style="text-align:center;">Work Done Date</th>
            <th style="text-align:center;">Customer Company Name</th>
            <th style="text-align:center;">Customer Mobile</th>
            <th style="text-align:center;">Product Serial</th>
            <th style="text-align:center;">Product Category</th>
            <th style="text-align:center;">Product Name</th>
            <th style="text-align:center;">Product Model</th>
            <th style="text-align:center;">Serviced By</th>
        </tr>
	</thead>
    <tbody>
       @php 
            $i=1;
        @endphp
        @foreach($claims as $claim)
        <tr>
            <td style="text-align:center;">{{$i++}}</td>
            
            <td style="text-align:center;">{{$claim->created_at}}</td>
            <td style="text-align:center;">{{$claim->claim_serial}}</td>
            <td style="text-align:center;">{{$claim->run_hour}}</td>
            <td style="text-align:center;">{{$claim->comission_date}}</td>
            <td style="text-align:center;">{{$claim->work_done_date}}</td>
            <td style="text-align:center;" >{{$claim->company_name}} </td>
            <td style="text-align:center;">{{$claim->phone}}</td>
            <td style="text-align:center;">{{$claim->serial_no}}</td>
            <td style="text-align:center;">{{$claim->categoryName}}</td>
            <td style="text-align:center;">{{$claim->productName}}</td>
            <td style="text-align:center;">{{$claim->productModel}}</td>
            <td style="text-align:center;">{{$claim->serviceBy}}</td>
        </tr>
        @endforeach
    </tbody>
          
</table>