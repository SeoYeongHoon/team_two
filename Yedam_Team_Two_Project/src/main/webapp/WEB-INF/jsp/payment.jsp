<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<link rel="stylesheet" href="../../static/css/payment.css">
<body>
	 <div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">    
                   		<div class="cart-title">
                               <h2>Checkout</h2>
                       	</div>
                    	<div class="cart-table clearfix">
                            <table class="table table-responsive">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" id="checkAll" checked>상품번호</th>
                                        <th>상품이름</th>
                                        <th>이미지</th>
                                        <th>가격</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	
                                </tbody>
                            </table>
                        </div>					
					</div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary payment-cart-summary">
                            <h5>Payment Total</h5>
                            <ul class="summary-table">
                                <li><span>Total:</span> <span id="totalPrice"></span></li>
                            </ul>

                            <div class="cart-btn mt-100">
                                <a href="#" class="btn amado-btn w-100" id="paymentBtn">Purchase</a>
                            </div>
                        </div>
                    </div>
                 </div>
              </div>
		</div>
		
		<!-- 결제 완료 페이지 요청 -->
		<form id="paymentResult" action="paymentResult.do" method="post" >
		<input type="hidden" name="member">
		<input type="hidden" name="pId">
		<input type="hidden" name="price">
		<input type="hidden" name="purchasedGoodsList">
		</form>
</body>
<script>
	const memberId = '${memberId}';
	const goodsId = "${goodsId}";
	let list = []; //구매 할 상품(단일 상품 or 장바구니 내역)
	//장바구니 내역 구매
	if (goodsId == null || goodsId == ''){
		$.ajax({
			url: 'paymentAjax.do',
			method: 'post',
			data: {memberId},
			dataType: 'json'
		})
		.done(function(result){			
			let totalPrice = 0;
			list = result;
			$.each(result, function(idx, item){
				$('tbody').append(
						$('<tr />').append(
							$('<td class="cart_product_desc" />').append(
									$('<input type="checkbox" name="checkboxName">').val(item.price),
									$('<span />').text(item.goodsId)),
							$('<td class="cart_product_desc" />').append($('<span />').text(item.name)),
							$('<td class="cart_product_img" />').append($('<a href="#" />').append(
									$('<img class="magazineList-img" />').attr({'src': '../static/img/bg-img/' + item.image}))),
							$('<td class="cart_product_desc" />').append($('<span />').text(item.price))
						)
				);
			});
			checkAllEvent();			
		})
		.fail(function(error){
			console.log(error);
		})
	} else{ //단일 구매
		$.ajax({
			url: 'paymentAjax.do',
			method: 'post',
			data: {memberId, goodsId},
			dataType: 'json'
		})
		.done(function(result){			
			let totalPrice = 0;
			list = result;
			$.each(result, function(idx, item){
				$('tbody').append(
						$('<tr />').append(
							$('<td class="cart_product_desc" />').append(
									$('<input type="checkbox" name="checkboxName">').val(item.price),
									$('<span />').text(item.goodsId)),
							$('<td class="cart_product_desc" />').append($('<span />').text(item.name)),
							$('<td class="cart_product_img" />').append($('<a href="#" />').append(
									$('<img class="magazineList-img" />').attr({'src': '../static/img/bg-img/' + item.image}))),
							$('<td class="cart_product_desc" />').append($('<span />').text(item.price))
						)
				);
			});
			checkAllEvent();			
		})
		.fail(function(error){
			console.log(error);
		})
	}
	
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
		
		updateTotalPrice();
	});
	
	//th의 체크박스 선택 시 모든 항목 체크
	$(document).ready(function() {	
		$("#checkAll").click(checkAllEvent);
	});
	
	//체크박스(모두선택)눌렀을 때 각 체크박스 처리 이벤트
	function checkAllEvent(){
		if($("#checkAll").is(":checked")) $("input[name=checkboxName]").prop("checked", true);
		else $("input[name=checkboxName]").prop("checked", false);
		
		updateTotalPrice();
	}
	
	//체크 항목에 따라서 totalPrice 값 변경
	function updateTotalPrice(){
		let totalPrice = 0;
		let checkBoxes = $("input[name=checkboxName]");
		$.each(checkBoxes, function(idx, item){
			if ($(item).is(":checked")){
				totalPrice += parseInt(item.value);
			}
		})
		
		$('#totalPrice').text(totalPrice);
	}
	
	//결제버튼 이벤트
	$('#paymentBtn').on('click', function(e){
		let totalPrice = parseInt($('#totalPrice').text());
		
		if (totalPrice <= 0){
			alert("최소 1개 이상 선택 필수");
		} else{
			//새로운 주문번호 생성
			let newPHnum = createNewPurchaseHistoryNum();
			let foundMember = getMemberInfo();
			
			//결제 진행
			requestPay(totalPrice, newPHnum, foundMember);
		}
	});
	
	//결제함수
	function requestPay(totalPrice, newPHnum, memberInfo) {
		
		  newPid = 'ORDER-' + memberId + '-' + newPHnum;
		  
		  var IMP = window.IMP; // 생략가능
		  IMP.init('imp75601502'); 
		    IMP.request_pay({
		      pg: "tosstest",
		      pay_method: "card",
		      merchant_uid: newPid,   // 주문번호
		      name: newPid,
		      amount: totalPrice,                         // 숫자 타입
		      buyer_email: memberInfo.email,
		      buyer_name: memberInfo.name,
		      buyer_tel: memberInfo.tel,		    
		    },function (rsp) {
		        console.log(rsp);
		        if (rsp.success) {
			          var msg = '결제가 완료되었습니다.';
			          alert(msg);
			          //location.href = "paymentResult.do";
			          
			          //결제 완료 페이지로 넘기기
			          let subForm = $('#paymentResult');
					  subForm.find('input[name=member]').val(JSON.stringify(memberInfo));
			          subForm.find('input[name=pId]').val(JSON.stringify(newPid));
			          subForm.find('input[name=price]').val(JSON.stringify(totalPrice));
			          subForm.find('input[name=purchasedGoodsList]').val(JSON.stringify(list));
			          subForm.submit();
			         
		        } else {
			          var msg = '결제에 실패하였습니다.';
			          msg += '에러내용 : ' + rsp.error_msg;
			          alert(msg);
		        }
		      });
		    
	}
	//멤버 정보 가져오는 AJAX
	function getMemberInfo(){
		let a = null;
		$.ajax({
			url: 'paymentMemberInfoAjax.do',
			method: 'post',
			data: {memberId},
			async : false,
			dataType: 'json',
			success : function(result){
				a = result;
			},
			error : function(result){
				console.log("getMemberInfo() 오류");
			}
		});
		return a;
	}
	
	//새로운 주문번호 생성하는 AJAX
	function createNewPurchaseHistoryNum(){
		let date = new Date();
		let year = date.getFullYear();
		let month = ('0' + (date.getMonth() + 1)).slice(-2);
		let day = ('0' + date.getDate()).slice(-2);
		let hours = ('0' + date.getHours()).slice(-2);
		let min = ('0' + date.getMinutes()).slice(-2);
		let sec = ('0' + date.getSeconds()).slice(-2);
		let dateStr = year + month + day + hours + min + sec;
		return dateStr;
	}
</script>