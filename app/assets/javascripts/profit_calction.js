$(function() {
  $('#input__price').on("input",function(){
    var inputPrice = $(this).val();
    if (inputPrice >= 300 && inputPrice <= 9999999) {
      var clean_up_commission =  Math.floor(inputPrice * 0.1).toLocaleString();
      var commission =  Math.floor(inputPrice * 0.1);
      var profit = Math.floor(inputPrice - commission);
      var clean_up_profit = profit.toLocaleString();
      $('#output').text("¥ "+clean_up_commission);
      $('#output2').text("¥"+clean_up_profit);
    }
    else {
      $('#output').text("-");
      $('#output2').text("-");
    } 
  })
});



