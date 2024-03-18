/**
 * request.js
 */


/*$(document).ready(function() {
    $('#form').submit(function(event) {
        
        event.preventDefault();
        
        
        var formData = {
            name_info: $('#name_info').val(),
            title_info: $('#title_info').val(),
            content_info: $('#content_info').val(),
            template_option: $('.nice-select .current').text()
        };
        
        // AJAX
        $.ajax({
            type: 'POST',
            url: 'management.do',
            data: formData,
            dataType: 'json',
            encode: true
        })
        .done(function(data) {
            
            console.log(data);
            
            // 데이터 전송 성공시 처리 코드
        })
        .fail(function(data) {
            
            console.error('전송 실패:', data);
            // 여기에 추가적인 실패 처리를 할 수 있습니다.
        });
    });
});*/
