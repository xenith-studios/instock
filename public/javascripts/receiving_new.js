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
	new_count = Number($(item).val());
	old_count = Number(grandparent.children('td.oldCount').text());
	if(!isNaN(old_count + new_count)){
	  grandparent.children('td.newTotal').empty();
	  grandparent.children('td.newTotal').text(old_count + new_count);
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