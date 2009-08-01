$(document).ready(function() {
  /* Populate product variant checkboxes. */
  $('#vendors').click(function() {
		var vendor = $(this).val();
		$('#productVariants').empty();
		$('#productVariants').load("/ajax/vendor_products", {vendor_name: vendor}, null, stop_spinner($('#productVariants')));
		start_spinner($('#productVariants'));
	})
})

function new_total(item)
{
  var grandparent = $(item).parent().parent();
	var new_count = Number($(item).val());
	var old_count = Number(grandparent.children('td.oldCount').text());
	var reason = $("#stock_adjustment_reason").val();
	switch(reason)
	{
	  case "Defective":
	  case "Donation":
	    var total = old_count - new_count;
	    break;
	  default:
	    var total = old_count + new_count;
	    break;
	}
	if(!isNaN(total)){
	  grandparent.children('td.newTotal').empty();
	  grandparent.children('td.newTotal').text(total);
	}
}

function start_spinner(element)
{
  $(element).html('Please wait...<img src="/images/ajax-loader.gif" alt="Data Loading" />');
}

function stop_spinner(element)
{
  $(element).html('');
}

function update_all_totals()
{
  $('.newCount input').trigger('change');
}