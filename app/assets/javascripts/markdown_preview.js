$(function() {
  $('#mdpreview').on('click', function() {
    var mdtext = $('#textarea3').val();

    if (mdtext == "") {
      return;

    }
    $.ajax({  
      url: '/api/articles',
      type: 'GET',
      dataType: 'json',
      data: { content: mdtext }
    })
    .done(function(html) {
      $('.hidden_area').css('display', 'none');
      $('#mdtarget').append(html.content);
      $('#md').removeClass('disabled');
      $('#mdpreview').addClass('disabled');
    })
    .fail(function() {
      alert('failed for markdown preview');
    })
  })

  $('#md').on('click', function() {
    $('.hidden_area').css('display', '');
    $('#mdtarget').empty();
    $('#mdpreview').removeClass('disabled');
    $(this).addClass('disabled');
  })
})