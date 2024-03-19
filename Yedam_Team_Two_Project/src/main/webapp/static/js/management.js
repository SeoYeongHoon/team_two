/**
 * management.js
 */

// console.log("test");
/*$.get('management.do', (result) => {
            // console.log(result);
            result.forEach((item, idx, ary) => {
                console.log(item, idx, ary);
            });

            $(result).each((idx, item, ary) => {
                console.log(item.name);
                $('<tr />').append(
                    $('<td />').text(item.name),
                    $('<td />').text(item.price),
                    $('<td />').text(item.id)  
                ).appendTo($('table:nth-of-type(2) tbody'));
            });
        })

        // DOM 요소 로딩 후에 반영
        $(document).ready(() => {

            // 버튼클릭 시 등록 이벤트
            $('#addBtn').on('click', () => {
                let bcode = $('#bcode').val();
                let bname = $('#bname').val();
                let bauth = $('#bauth').val();
                let bpress = $('#bpress').val();
                let bprice = $('#bprice').val();

                // Ajax 호출
                // $.post('../addBook.do', { bcode, bname, bauth, bpress, bprice }, (result) => {
                //     console.log(result);

                //     if (result.retCode == 'OK') {
                //         alert('등록 완료');

                //         // tr 생성 후 tbody에 append
                //         $('<tr />').append(
                //             $('<td />').text(item.bcode),    // 도서코드
                //             $('<td />').text(item.bname),    // 도서명
                //             $('<td />').text(item.bauth),    // 저자
                //         ).appendTo($('table:nth-of-type(2) tbody'));
                //     } else {
                //         alert('등록 실패!!');
                //     }
                // })

                // Ajax 호출2
                $.ajax({
                    url: '../addBook.do',
                    method: 'post',

                    // 위에 변수 선언 안했을 시
                    // data: {bcode: $('#bcode').val(), ...}
                    data: { bcode, bname, bauth, bpress, bprice },
                    dataType: 'json'
                })
                    .done((result) => {
                        console.log(result);    // OK 또는 NG

                        if (result.retCode == 'OK') {
                            alert('등록완료');

                            // tr 생성 후 tbody에 append
                            $('<tr />').append(
                                $('<td />').text(bcode),    // 도서코드
                                $('<td />').text(bname),    // 도서명
                                $('<td />').text(bauth),    // 저자
                            ).appendTo($('table:nth-of-type(2) tbody'));
                        } else {
                            alert('!!등록실패!!');
                        }
                    })
                    .fail((err) => {
                        console.log(err);
                    })
                    .always((result) => {
                        console.log('처리 완료');
                    })
            })
        })*/