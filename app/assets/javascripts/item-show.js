
$(function() {
  $('.slide-box').on("mouseover",function(){
    var image = $(this).attr("src");
    $('#main-box').attr('src',image);
    $(this).css('opacity', '1.0')
  })
  $('.slide-box').on('mouseout', function(){
        $(this).css('opacity', '0.5')
  });
});