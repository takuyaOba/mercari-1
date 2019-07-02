$(function() {
  function build_image(alt, src){
    var html = `<li class="item__image__change__field" id="item__image__change__field_${alt}">
                  <div class="item__image__change__field__image">
                    <img alt="${alt}" src="${src}" class="sell-upload-figure-image">
                  </div>
                  <div class="item__image__change__field__btn">
                    <a class="item__image__change__field__btn__fix">編集</a>
                    <a class="item__image__change__field__btn__delete" href="" data-count="${alt}" id="item__image__change__field__btn__delete_${alt}">削除</a>
                  </div>
               </li>`
  return html;
  }
  var files_array= []
  var count = 1;
  var image_tag;
  var input_area = ".sell-upload__drop-box-0-input"
  var inputBlock = ".sell-upload__drop-box-0-input"

  // プレビュー
  $(inputBlock).change( $('inputBlock').children('input[name="item_images[image][' + count + ']"]'), function (e) {
    // ファイルオブジェクト取得
    var files = $(this).prop('files');
    for (var i=0; i<files.length; i++) {
      var file = e.target.files[i];
      var file_reader = new FileReader();
      files_array.push(files[i]);
      // 選択画像プレビュー操作
      file_reader.onload = (function () {
        return function (e) {
          // imgタグ追加
          image_tag = build_image(count, e.target.result);
          $('.item__image__change').append(image_tag);
          // ファイル数カウント
          count += 1;

        };
      })(file);
    file_reader.readAsDataURL(file);
    }
    var new_image = `<input multiple=true name="item_images[image][]" class="sell-upload__drop-box-0-input" type="file">`
    $(input_area).prepend(new_image);
  });
  //削除機能
  $(document).on('click','.item__image__change__field__btn__delete', function(e){
    e.preventDefault();
    if ($(this).data('count') !== undefined){
      var num = $(this).data('count');
      var image_field = $(".sell-upload__drop-box-0-input").eq(num - 1);
      image_field.val("");
    }
    var parent2 = $(this).parents('.item__image__change__field').remove();
    if ($(this).data('id') !== undefined){ 
      var input = $(this).data('id');
      $.ajax({
        type: 'get',
        url: '/item_images',
        data: { id: input },
        dataType: 'json'
      })
    }
  })
});