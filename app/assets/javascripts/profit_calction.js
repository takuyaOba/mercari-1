$(function() {
  $('#input__price').on("input",function(){
    var inputPrice = $(this).val();
    if (inputPrice >= 300 && inputPrice <= 9999999) {
      var commission = Math.floor(inputPrice * 0.1);
      var profit = Math.floor(inputPrice - commission);
      $('#output').text(commission);
      $('#output2').text(profit);
    }
  })
});
