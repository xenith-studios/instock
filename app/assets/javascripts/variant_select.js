$(document).ready(function() {
  $("#method_select").change(function() {
    // make a POST call and replace the content
    $.post("/ajax/methods", {"method": $("#method").val()}, function(data) {
	  stop_spinner($('#selector'));
      $("#selector").html(data);
    });
    start_spinner($('#selector'));
  });

  $("#receiving_items").bind('ajax:success', function(evt, data, status, xhr){
    $('#stepThree').html(xhr.responseText);
  });
  $("#stock_adjustment_items").bind('ajax:success', function(evt, data, status, xhr){
    $('#stepThree').html(xhr.responseText);
  });
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
  $(element).html('Please wait...<img src="/assets/ajax-loader.gif" alt="Data Loading" />');
}

function stop_spinner(element)
{
  $(element).html('');
}

function update_all_totals()
{
  $('.newCount input').trigger('change');
}