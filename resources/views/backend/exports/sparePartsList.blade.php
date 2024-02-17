<table style="table-layout: auto;width: 100%;">
	<thead>
	    	<tr><td colspan="13" style="text-align: center;"> {{@$setting->name}} </td></tr>
	    	<tr><td colspan="13" style="text-align: center;"> {{@$setting->address}} </td></tr>
	    	<tr><td colspan="13" style="text-align: center;"> Hotline: {{@$setting->phone}}</td></tr>
	    	<tr><td colspan="13" style="text-align: center;"> Email: {{@$setting->email}} </td></tr>
	    	<tr><td colspan="13" style="text-align: center;"> Fax: {{@$setting->fax}} </td></tr>
	    	<tr><td colspan="13" style="text-align: center;"> </td></tr>
		<tr>
            <th style="text-align:center;">Sl.</th>
            <th style="text-align:center;">Description</th>
            <th style="text-align:center;">Parts NO</th>
            <th style="text-align:center;">Category</th>
            <th style="text-align:center;">Model</th>
            <th style="text-align:center;">Purchase Price</th>
            <th style="text-align:center;">Sale Price</th>
            <th style="text-align:center;">Status</th>
        </tr>
	</thead>
    <tbody>
        @php 
            $i=1;
            $category='';
        @endphp
        @foreach($parts as $part)
            @php
                $category= App\Models\Category::where('id','=',$part->category_id)->first();
                $stock= App\Models\Stock::where('product_id','=',$part->id)->first();
            @endphp
        <tr>
            <td style="text-align:center;">{{$i++}}</td>
            
            <td style="text-align:center;">{{@$part->name}}</td>
            <td style="text-align:center;">{{@$part->product_code}}</td>
            <td style="text-align:center;">{{@$category->name}}</td>
            <td style="text-align:center;">{{@$part->model}}</td>
            <td style="text-align:center;">{{@$part->purchase_price}}</td>
            <td style="text-align:center;">{{@$part->sale_price}}</td>
            <td style="text-align:center;">{{@$part->status}}</td>
            
        </tr>
        @endforeach
    </tbody>
          
</table>