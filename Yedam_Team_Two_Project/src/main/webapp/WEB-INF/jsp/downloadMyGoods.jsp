<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<link rel="stylesheet" href="../../static/css/downloadMyGoods.css">
<body>
	 <div class="cart-table-area section-padding-100">
            <div class="container-fluid downLoadMyGoods-div">
                <div class="row">
                    <div class="col-lg-12">    
                   		<div class="cart-title">
                               <h2>Download Template</h2>
                       	</div>
                    	<div class="cart-table clearfix">
                            <table class="table table-responsive">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" id="checkAll" checked></th>
                                        <th>상품이름</th>
                                        <th>이미지</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                </tbody>
                            </table>
                        </div>				
                        <div id="downloadMyGoods-downloadbtn-div">
                        	<a href="#" class="btn amado-btn mb-15" id="downloadMyGoods-downloadbtn">다운로드</a>
                        </div>
					</div>
                 </div>
              </div>
		</div>
		
		<!-- 파일 다운로드 페이지 요청 -->
		<form id="downloadProcessForm" action="downloadProcess.do" method="post">
		
		</form>
</body>
<script>
	setPurchasedGoodsList();
	//구입 내역 불러와서 td생성 및 기입
	function setPurchasedGoodsList(){
		$.ajax({
			url: 'downloadAjax.do',
			method: 'post',
			data: {},
			dataType: 'json'
		})
		.done(function(result){
			let tbody = $('tbody');
			$.each(result, function(idx, item){
				tbody.append($('<tr />').append(
					$('<td />').append($('<input type="checkbox" name="checkboxName" />').val(item.name)),
					$('<td class="cart_product_desc" />').text(item.name),
					$('<td class="cart_product_img" />').append($('<a href="#" />').append($('<img class="downLoadMyGoods-img" />').attr({'src': '../static/img/bg-img/' + item.image})))
				));
			});
			checkAllEvent();
		})
		.fail(function(error){
			console.log(error);
		})
	}
	
	//다운로드 버튼 클릭 이벤트
	$('#downloadMyGoods-downloadbtn').on('click', function(e){
		let inputboxes = $("input[name=checkboxName]");
		
		//현재 선택되어있는 체크박스만 가져옴
		let checkedBoxes = [];
		$.each(inputboxes, function(idx, item){
			if ($(item).is(':checked')){
				checkedBoxes.push(item);
			}
		});
		
		//체크박스 생성 시 세팅했던 체크박스의 value 값 => goodsId
		
		
		//웹요청을 통한 방식
		let subForm = $('#downloadProcessForm');

		subForm.empty(); //이전에 생성한 input태그들은 초기화해주기

		$.each(checkedBoxes, function(idx, item){
			//파일 다운로드 폼 내용 채우기
			subForm.append($('<input type="hidden" name="goodsName" />').val(item.value))
		});
		
		//파일 다운로드 페이지로 보내기
		subForm.submit();
	});
	
	
	//td와 체크박스 사이 상호작용=======================================================================
	
	//테이블 tr클릭 시 체크박스 활성화
	$(".table-responsive").on('click', 'tr', function(e){
		 e.stopPropagation();
		 
		if( $(e.target).is('input:checkbox') ) return;
		var chkbox = $(this).find('td:first-child :checkbox');
		chkbox.prop('checked', !chkbox.prop('checked'));
		
		var total = $("input[name=checkboxName]").length;
		var checked = $("input[name=checkboxName]:checked").length;

		if(total != checked) $("#checkAll").prop("checked", false);
		else $("#checkAll").prop("checked", true);
	});
	
	//th의 체크박스 선택 시 모든 항목 체크
	$(document).ready(function() {	
		$("#checkAll").click(checkAllEvent);
	});
	
	//체크박스(모두선택)눌렀을 때 각 체크박스 처리 이벤트
	function checkAllEvent(){
		if($("#checkAll").is(":checked")) $("input[name=checkboxName]").prop("checked", true);
		else $("input[name=checkboxName]").prop("checked", false);
	}
</script>