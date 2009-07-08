$(document).ready(function() {
	$('tr.shipmentItem input').blur(function() {
		var grandparent = $(this).parent().parent();
		new_count = Number($(this).val());
		old_count = Number(grandparent.children('td.oldCount').text());
		grandparent.children('td.newTotal').empty();
		grandparent.children('td.newTotal').text(old_count + new_count);
	})
})