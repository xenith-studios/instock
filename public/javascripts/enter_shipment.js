$(document).ready(function() {
	$('tr.shipmentItem input').change(function(){
	    new_total(this);
	})
	$('tr.shipmentItem input').load(function(){
	    new_total(this);
	})

})

function new_total(item)
{
    var grandparent = $(item).parent().parent();
	new_count = Number($(item).val());
	old_count = Number(grandparent.children('td.oldCount').text());
	if(!isNaN(old_count + new_count)){
	    grandparent.children('td.newTotal').empty();
		grandparent.children('td.newTotal').text(old_count + new_count);
	}
}