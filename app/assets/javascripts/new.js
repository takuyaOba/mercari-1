$(function(){
  var option = ``;
  var box2 = $('#select__wrap2')
  var box3 = $('#select__wrap3')
  var box4 = $('#select__wrap4')
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
  // sizeselectタグの生成
  function buildselectbox4(option){
    $('#item_size_id option').remove();
    var selectbox =  `<label class="size-label" >
                        サイズ
                        <span class="span form--require" >必須</span>
                      </label>
                      <select class="select-default"  name="item[size_id]" id="item_size_id">
                        ${option}
                      </select>`
    box4.append(selectbox)
    return selectbox;
  }
  // optionタグの生成
  function appendOption(id, name){
    var html = `<option value= ${id}>${name}</option>`
    option += html
  }
  // first_category選択時に発火
  $('#item_first_category_id').change(function(e){
    var first = $('#item_first_category_id').val();
    $.ajax({
      url: '/items/second',
      type: "GET",
      data: { id: first },
      dataType: 'json',
    })
    .done(function(second_categories){
      if ($('#item_second_category_id').length ){
        box2.empty()
        box3.empty()
        box4.empty()
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
    var second = $('#item_second_category_id').val();
    $.ajax({
      url: '/items/third',
      type: "GET",
      data: { id: second },
      dataType: 'json',
    })
    .done(function(third_categories){
      if ($('#item_third_category_id').length){
        box3.empty()
        box4.empty()
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
  $(document).on('change','#item_third_category_id', function(){
    var third = $('#item_third_category_id').val();
    $.ajax({
      url: '/items/size',
      type: "GET",
      data: { id: third },
      dataType: 'json'
    })
    .done(function(sizes){
      if ($('#item_size_id').length){
        box4.empty()
        $("#item_size_id").remove();
      }
      if (Object.keys(sizes).length === 0 ){
      }else{
        let html = appendOption("", "---")
        sizes.forEach(function(size){
          appendOption(size.id, size.name)
        });
        buildselectbox4(option)
        option = ``;
      }
    })
  })
});