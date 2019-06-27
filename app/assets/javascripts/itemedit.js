$(function(){
  $('.item__image__change__field__btn__delete').on("click", function(e){
    e.preventDefault();
    var input = $(this).data('id');
    $.ajax({
      type: 'get',
      url: '/item_images',
      data: { id: input },
      dataType: 'json'
    })
    .done(function(){
      var parent2 = $('.item__image__change__field__btn__delete').parents('.item__image__change__field').remove().attr('id');
    })
  })
})