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
            <th style="text-align:center;">Reg Date</th>
            <th style="text-align:center;">Reg Serial</th>
            <th style="text-align:center;">Reg No</th>
            
            <th style="text-align:center;">Company Name</th>
            <th style="text-align:center;">Customer Mobile</th>
            <th style="text-align:center;">Customer Email</th>
            <th style="text-align:center;">Customer Address</th>
            <th style="text-align:center;">Customer City</th>
            <th style="text-align:center;">Customer Country</th>
            <th style="text-align:center;">Product Name</th>
            <th style="text-align:center;">Product Model</th>
            <th style="text-align:center;">Product Serial</th>
            <th style="text-align:center;">Registered By</th>
            <th style="text-align:center;">Warrenty Type</th>
            <th style="text-align:center;">Application Type</th>
        </tr>
	</thead>
    <tbody>
       @php 
            $i=1;
        @endphp
        @foreach($warrenties as $warrenty)
            @php 
               $product=App\Models\Product::find($warrenty->product_id);
               $warrenty_type=App\Models\WarrentyType::find($warrenty->warrenty_type);
               $customer=App\Models\Customer::find($warrenty->customer_id);
            @endphp
        <tr>
            <td style="text-align:center;">{{$i++}}</td>
            
            <td style="text-align:center;">{{$warrenty->instalation_date}}</td>
            <td style="text-align:center;">{{$warrenty->registration_number}}</td>
            <td style="text-align:center;">{{$warrenty->reg_id}}</td>
            <td style="text-align:center;">{{$customer->company_name}}</td>
            <td style="text-align:center;">{{$customer->phone}}</td>
            <td style="text-align:center;">{{$customer->email}}</td>
            <td style="text-align:center;">{{$customer->address}}</td>
            <td style="text-align:center;">{{$customer->city}}</td>
            <td style="text-align:center;">{{$customer->country}}</td>
            <td style="text-align:center;">{{$product->name}}</td>
            <td style="text-align:center;">{{$product->model}}</td>
            <td style="text-align:center;" >{{$product->serial_no}}</td>
            <td style="text-align:center;">{{$warrenty->registered_by}}</td>
            <td style="text-align:center;">{{$warrenty_type->type}}</td>
            <td style="text-align:center;">{{$warrenty->application_type}}</td>
            
        </tr>
        @endforeach
    </tbody>
          
</table>