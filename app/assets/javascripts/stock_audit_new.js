function calculate_difference(item)
{
  var grandparent = $(item).parent().parent();
	actual = Number($(item).val());
	expected = Number(grandparent.children('td.expected').text());
	if(!isNaN(actual - expected)){
	  grandparent.children('td.difference').empty();
	  grandparent.children('td.difference').text(actual - expected);
	}
}