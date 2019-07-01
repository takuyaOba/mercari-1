$(function() {
  function build_image(alt, src){
    var html = `<li class="item__image__change__field">
                  <div class="item__image__change__field__image">
                    <img alt="${alt}" src="${src}" class="sell-upload-figure-image">
                  </div>
                  <div class="item__image__change__field__btn">
                    <a class="item__image__change__field__btn__fix">編集</a>
                    <a class="item__image__change__field__btn__delete">削除</a>
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
    // console.log(files)
    for (var i=0; i<files.length; i++) {
      var file = e.target.files[i];
      var file_reader = new FileReader();
      //
      // console.log(file)
      // console.log(file_reader)

      files_array.push(files[i]);
      // console.log(files_array)

      // 選択画像プレビュー操作
      file_reader.onload = (function () {
        return function (e) {
          // imgタグ追加
          // console.log(e.target.result)
          image_tag = build_image(count, e.target.result);
          // console.log(image_tag)
          // console.log(count)
          $('.item__image__change').append(image_tag);
          // ファイル数カウント
          count += 1;

        };
      })(file);
    file_reader.readAsDataURL(file);
    console.log(file)
    }
    var new_image = `<input multiple=true name="item_images[image][]" class="sell-upload__drop-box-0-input" type="file">`
    $(input_area).prepend(new_image);
    console.log(new_image)
  });
  //削除機能
  $(document).on('click','.item__image__change__field__btn__delete', function(){
        // console.log(this)
    // index関数を利用して、クリックされたaタグが、div内で何番目のものか特定する。
    var index = $(".item__image__change__field__btn__delete").index(this);
    // クリックされたaタグの順番から、削除すべき画像を特定し、配列から削除する。
    files_array.splice(index - 1, 1);
    // クリックされたaタグが含まれるli要素をHTMLから削除する。
    $(this).parent().parent().remove();
  });
});