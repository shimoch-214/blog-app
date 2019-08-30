$(window).on('load',function() {
  var noName = $("#preview").children().attr('src');
  $('form').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0];
    var reader = new FileReader();
    var $preview = $("#preview");

    if(file == null) {
      $preview.empty();
      $preview.append($('<img>').attr({
        src: noName,
        id: preview,
        style: "object-fit: contain;",
        title: "no image"
      }));
      return false;
    }

    if(file.type.indexOf('image') < 0) {
      return false;
    }
    
    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
                    src: e.target.result,
                    id: preview,
                    style: "object-fit: contain;",
                    title: file.name
        }));

      };
    })(file);

    reader.readAsDataURL(file);
  });
});