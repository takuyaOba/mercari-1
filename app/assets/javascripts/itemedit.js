$(function(){
  $('.item__image__change__field__btn__delete').on("click", function(e){
    e.preventDefault();
    var input = $(this).data('id');
    var parent2 = $(this).parents('.item__image__change__field').remove().attr('id');
    console.log(parent2)
    console.log(input)
    $.ajax({
      type: 'get',
      url: '/item_images',
      data: { id: input },
      dataType: 'json'
    })
  })
})