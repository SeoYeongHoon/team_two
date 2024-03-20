<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
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
                                        <th>상품번호</th>
                                        <th>상품이름</th>
                                        <th>이미지</th>
                                        <th>가격</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<tr>
                                		<td class="cart_product_desc">
											<h5>상품번호</h5>
                                       	</td>
                                		<td class="cart_product_desc">
											<h5>상품이름</h5>
                                       	</td>
                                       	<td class="cart_product_img">
                                           	<a href="#"><img class="magazineList-img" src="../static/img/bg-img/건설 건축 템플릿 뒷면.png" alt="Product"></a>
                                       	</td>                                	
                                		<td class="cart_product_desc">
											<h5>가격</h5>
                                       	</td>
                                	</tr>
                                	<tr>
                                		<td class="cart_product_desc">
											<h5>상품번호</h5>
                                       	</td>
                                		<td class="cart_product_desc">
											<h5>상품이름</h5>
                                       	</td>
                                       	<td class="cart_product_img">
                                           	<a href="#"><img class="magazineList-img" src="../static/img/bg-img/건설 건축 템플릿 뒷면.png" alt="Product"></a>
                                       	</td>                                	
                                		<td class="cart_product_desc">
											<h5>가격</h5>
                                       	</td>
                                	</tr>
                                	<tr>
                                		<td class="cart_product_desc">
											<h5>상품번호</h5>
                                       	</td>
                                		<td class="cart_product_desc">
											<h5>상품이름</h5>
                                       	</td>
                                       	<td class="cart_product_img">
                                           	<a href="#"><img class="magazineList-img" src="../static/img/bg-img/건설 건축 템플릿 뒷면.png" alt="Product"></a>
                                       	</td>                                	
                                		<td class="cart_product_desc">
											<h5>가격</h5>
                                       	</td>
                                	</tr>
                                	<tr>
                                		<td class="cart_product_desc">
											<h5>상품번호</h5>
                                       	</td>
                                		<td class="cart_product_desc">
											<h5>상품이름</h5>
                                       	</td>
                                       	<td class="cart_product_img">
                                           	<a href="#"><img class="magazineList-img" src="../static/img/bg-img/건설 건축 템플릿 뒷면.png" alt="Product"></a>
                                       	</td>                                	
                                		<td class="cart_product_desc">
											<h5>가격</h5>
                                       	</td>
                                	</tr>
                                	<tr>
                                		<td class="cart_product_desc">
											<h5>상품번호</h5>
                                       	</td>
                                		<td class="cart_product_desc">
											<h5>상품이름</h5>
                                       	</td>
                                       	<td class="cart_product_img">
                                           	<a href="#"><img class="magazineList-img" src="../static/img/bg-img/건설 건축 템플릿 뒷면.png" alt="Product"></a>
                                       	</td>                                	
                                		<td class="cart_product_desc">
											<h5>가격</h5>
                                       	</td>
                                	</tr>
                                	<tr>
                                		<td class="cart_product_desc">
											<h5>상품번호</h5>
                                       	</td>
                                		<td class="cart_product_desc">
											<h5>상품이름</h5>
                                       	</td>
                                       	<td class="cart_product_img">
                                           	<a href="#"><img class="magazineList-img" src="../static/img/bg-img/건설 건축 템플릿 뒷면.png" alt="Product"></a>
                                       	</td>                                	
                                		<td class="cart_product_desc">
											<h5>가격</h5>
                                       	</td>
                                	</tr>
                                </tbody>
                            </table>
                        </div>					
					</div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary payment-cart-summary">
                            <h5>Cart Total</h5>
                            <ul class="summary-table">
                                <li><span>subtotal:</span> <span>$140.00</span></li>
                                <li><span>delivery:</span> <span>Free</span></li>
                                <li><span>total:</span> <span>$140.00</span></li>
                            </ul>

                            <div class="cart-btn mt-100">
                                <a href="#" class="btn amado-btn w-100">Checkout</a>
                            </div>
                        </div>
                    </div>
                 </div>
              </div>
		</div>
</body>
<script>
	const memberId = '${memberId}';
	const goodsId = "${goodsId}";
	
	//장바구니 내역 구매
	if (goodsId == null || goodsId == ''){
		$.ajax({
			url: 'paymentAjax.do',
			method: 'post',
			data: {memberId},
			dataType: 'json'
		})
		.done(function(result){
			console.log(result);
			
			$.each(result, function(idx, item){
				$('.box').append(
					$('<div class="payment-goods" />').append(
						$('<div style="width: 100px; display:inline-block" />').append(
							$('<ul class="summary-table" />').append(
								$('<li />').append($('<p />').text(item.name)),
								$('<li />').append($('<p />').text("가격: "), $('<p />').text(item.price))
							)	
						),
						$('<span />').append($('<img class="payment-goodsImg" />').attr({'src': '../static/img/bg-img/' + item.image + '.jpg'}))
					)		
				)
			});
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
			console.log(result);
			
			$.each(result, function(idx, item){
				$('.box').append(
					$('<div class="payment-goods" />').append(
						$('<div style="width: 100px; display:inline-block" />').append(
							$('<ul class="summary-table" />').append(
								$('<li />').append($('<p />').text(item.name)),
								$('<li />').append($('<p />').text("가격: "), $('<p />').text(item.price))
							)	
						),
						$('<span />').append($('<img class="payment-goodsImg" />').attr({'src': '../static/img/bg-img/' + item.image + '.jpg'}))
					)		
				)
			});
		})
		.fail(function(error){
			console.log(error);
		})
	}
	
</script>