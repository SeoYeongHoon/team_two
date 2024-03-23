<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<link rel="stylesheet" href="../../static/css/myCart.css">
<body>
	 <div class="cart-table-area section-padding-100">
            <div class="container-fluid myCart-div">
                <div class="row">
                    <div class="col-lg-12">    
                   		<div class="cart-title">
                               <h2>My Cart</h2>
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
                        <div id="myCart-deletebtn-div">
                        	<a href="#" class="btn amado-btn mb-15 myCart-btn" id="myCart-deletebtn">Delete</a>
                        	<a href="payment.do" class="btn amado-btn mb-15 myCart-btn" id="myCart-purchasebtn">Purchase All</a>
                        </div>
					</div>
                 </div>
              </div>
		</div>
</body>
<script>
	
	//Session parameter의 memberId값 가져오기
	const memberId = '${memberId}';
	
	setCartGoodsList();
	//구입 내역 불러와서 td생성 및 기입
	function setCartGoodsList(){
		//이전 생성한 목록 있다면 초기화
		let tbody = $('tbody');
		tbody.empty();
		
		$.ajax({
			url: 'myCartListAjax.do',
			method: 'post',
			data: {memberId},
			dataType: 'json'
		})
		.done(function(result){
			$.each(result, function(idx, item){
				tbody.append($('<tr />').append(
					$('<td />').append($('<input type="checkbox" name="checkboxName" />').val(item.goodsId)),
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
	
	//장바구니 삭제 버튼 이벤트
	$('#myCart-deletebtn').on('click', function(e){
		let inputboxes = $("input[name=checkboxName]");
		
		//현재 선택되어있는 체크박스만 가져옴
		let checkedBoxes = [];
		$.each(inputboxes, function(idx, item){
			if ($(item).is(':checked')){
				checkedBoxes.push(item);
			}
		});
		
		//삭제 할 상품Id 배열에 담아주기
		let deleteGoodsAry = [];
		$.each(checkedBoxes, function(idx, item){
			deleteGoodsAry.push(item.value);
		});
		
		//ajax요청을 통한 삭제 작업 진행
		$.ajax({
			url: 'myCartRemoveAjax.do',
			traditional: true,
			method: 'post',
			data: {'memberId' : memberId,
				   'deleteGoodsAry' : deleteGoodsAry
			},
			success : function(result){
				console.log(result);
				
				//장바구니 내역 다시 불러오기
				setCartGoodsList();
			},
			error : function(error){  
				console.log(error);
			}			
		})
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