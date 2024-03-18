/**
 * management.js
 */

// console.log("test");

/*$(document).ready(function() {
    // 관리 페이지에서 신청 버튼 클릭 시 이벤트 처리
    $('.confirm_btn').click(function(event) {
        event.preventDefault(); // 기본 이벤트 방지

        // AJAX를 통해 데이터 전송
        $.ajax({
            type: 'POST',
            url: 'management.do', // 데이터를 처리할 서버 측 URL
            data: {
                // 필요한 데이터 전달
                name_info: $('#name_info').val(),
                title_info: $('#title_info').val(),
                content_info: $('#content_info').val(),
                // 기타 필요한 데이터가 있다면 추가
            },
            success: function(response) {
                // 서버로부터의 응답 처리
                // 예를 들어, 성공적으로 처리되었다면 새로고침하거나 다른 동작을 수행
                location.reload();
            },
            error: function(xhr, status, error) {
                // 오류 발생 시 처리
                console.error(xhr.responseText);
            }
        });
    });
});*/
