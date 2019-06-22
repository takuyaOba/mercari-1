$(function(){
  var option = ``;
  var box2 = $('#select__wrap2')
  var box3 = $('#select__wrap3')
  // secondselectタグの生成
  function buildselectbox2(option){
    $('#item_second_category_id option').remove();
    var selectbox =  `<select id="item_second_category_id" name="item[second_category_id]">
                        ${option}
                      </select>`
    box2.append(selectbox)
    return selectbox;
  }
  // thirdselectタグの生成
  function buildselectbox3(option){
    $('#item_third_category_id option').remove();
    var selectbox =  `<select class="select-default"  name="item[third_category_id]" id="item_third_category_id">
                        ${option}
                      </select>`
    box3.append(selectbox)
    return selectbox;
  }
  // optionタグの生成
  function appendOption(id, name){
    var html = `<option value= ${id}>${name}</option>`
    option += html
  }
  // first_category選択時に発火
  $('#item_first_category_id').change(function(e){
    var r = $('#item_first_category_id').val();
    $.ajax({
      url: '/items/second',
      type: "GET",
      data: { id: r },
      dataType: 'json',
    })
    .done(function(second_categories){
      if ($('#item_second_category_id').length ){
        box2.empty()
        box3.empty()
        $("#item_second_category_id").remove();
      }
      if (Object.keys(second_categories).length === 0 ){
      }else{
        let html = appendOption("", "---")
        second_categories.forEach(function(second_category){
        appendOption(second_category.id, second_category.name)
        });
        buildselectbox2(option)
        option = ``;
      }
    })
  });
  // second_category選択時に発火
  $(document).on('change','#item_second_category_id', function() {
    var s = $('#item_second_category_id').val();
    $.ajax({
      url: '/items/third',
      type: "GET",
      data: { id: s },
      dataType: 'json',
    })
    .done(function(third_categories){
      if ($('#item_third_category_id').length){
        box3.empty()
        $("#item_third_category_id").remove();
      }
      if (Object.keys(third_categories).length === 0 ){
      }else{
        let html = appendOption("", "---")
        third_categories.forEach(function(third_category){
          appendOption(third_category.id, third_category.name)
        });
        buildselectbox3(option)
        option = ``;
      }
    })
  });
});