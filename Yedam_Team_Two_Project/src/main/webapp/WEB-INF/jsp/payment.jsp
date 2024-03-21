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
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-title">
                                <h2>Checkout</h2>
                            </div>
							
							<div class="box" style="width: 100%; height: 500px; background: white; color: black; overflow-y: scroll;">
								<div class="payment-goods">
									<div style="width: 100px; display:inline-block">
										<ul class="summary-table">
			                            	<li>
					                            <p>${상품이름}</p>
			                            	</li>
			                                <li>
			                                	<span>가격: </span> <span>${가격}</span>
			                                </li>
			                            </ul>
									</div>
										<span><img class="payment-goodsImg" src="../static/img/bg-img/${이미지}.jpg" alt=""></span>
	                        	</div>						
							</div>
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
			result.forEach(item => {
				
			});
		})
		.fail(function(error){
			console.log(error);
		})
	}
	
</script>