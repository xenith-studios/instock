$(document).ready(function() {
	$('#vendors').click(function() {
		var vendor = $(this).val();
		$('#productVariants').empty();
		$('#productVariants').load("/warehouse/vendor_products", {vendor_name: vendor});
	})
})