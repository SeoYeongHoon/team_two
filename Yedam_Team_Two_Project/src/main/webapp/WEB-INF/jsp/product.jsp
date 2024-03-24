<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" src="../../static/css/Review.css">
<div class="single-product-area section-padding-100 clearfix">
	<div class="container-fluid">
		<div class="row" style="flex-wrap: nowrap">
			<div class="col-12 col-lg-7">
				<div class="single_product_thumb">
					<div id="product_details_slider" class="carousel slide"
						data-ride="carousel">

						<!-- 큰사진 -->
						<div class="carousel-inner">
							<div class="carousel-item active">
								<a class="gallery_img" href="../../static/img/product-img/pro-big-1.jpg"> 
									<img class= "d-block1 w-100" src="../../static/img/product-img/pro-big-1.jpg" alt="First slide">
								</a>
							</div>
							<div class="carousel-item">
								<a class="gallery_img"
									href="../../static/img/product-img/pro-big-4.jpg"> <img
									class="d-block w-100"
									src="static/img/product-img/pro-big-4.jpg" alt="Fourth slide">
								</a>
							</div>
						</div>

					</div>
				</div>
			</div>
			<form action="" method="post">
				<div class="col-12 col-lg-5">
					<div class="single_product_desc">
						<!-- Product Meta Data -->
						<div class="product-meta-data">
							<div class="line"></div>
							<input type="hidden" name="pno" value="${goods.goodsId }">
							<h3>${goods.name}</h3>
							<div class="line"></div>
							<p class="product-price" id="price">${goods.price}원</p>

							<p class="avaibility" id="hashtag">${goods.hashtag }</p>
						</div>
						<div class="short_overview my-5">
							<p>${goods.description }</p>
						</div>
					</div>
					<!-- Add to Cart Form -->
					<div class="d-flex">
						<button class="wish-btn btn amado-btn" type="submit" name="addtocart" value="5"
							data-goodsid="${goods.goodsId}" data-memberid="${logid }">찜하기</button>
						<button class="cart-btn btn amado-btn" type="submit" name="addtocart" value="5"
							data-goodsid="${goods.goodsId}" data-memberid="${logid }">장바구니</button>
						<a href="payment.do?goodsId=${goods.goodsId }" type="submit" name="addtocart" value="5"
							class="btn amado-btn">바로 구매</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
	<!-- Product Details Area End -->
	<script>
		$(document).ready(function() {
		    // 삭제 버튼 클릭 시
		    $('.wish-btn').click(function(e) {
		    	if (!confirm('찜 하시겠습니까?')) {
		    		return false;
		    	}
		    	
		        e.preventDefault();
		        
		        // 찜할 상품 ID, 멤버 ID 가져오기
		        var goodsId = $(this).data('goodsid');
		        var memberId = $(this).data('memberid');
		        console.log(memberId);
		        
		        // Ajax 요청
		        $.ajax({
		            url: 'wishGoods.do',
		            type: 'POST',
		            data: { goodsId: goodsId,
		            		memberId: memberId
		            		},
		            success: function(response) {
		                // 찜 성공 시 페이지 재로드
		                location.reload();
		                alert("찜 목록에 추가되었습니다.");
		            },
		            error: function(xhr, status, error) {
		                // 에러 처리
		                console.error(error);
		            }
		        });
		    });
		    
		    $('.cart-btn').click(function(e) {
		    	if (!confirm('장바구니에 추가하시겠습니까?')) {
		    		return false;
		    	}
		    	
		        e.preventDefault();
		        
		        // 장바구니에 넣을 상품 ID, 멤버 ID 가져오기
		        var goodsId = $(this).data('goodsid');
		        var memberId = $(this).data('memberid');
		        console.log(memberId);
		        
		        // Ajax 요청
		        $.ajax({
		            url: 'addCart.do',
		            type: 'POST',
		            data: { goodsId: goodsId,
		            		memberId: memberId
		            		},
		            success: function(response) {
		                // 찜 성공 시 페이지 재로드
		                location.reload();
		                alert("장바구니에 추가되었습니다.");
		            },
		            error: function(xhr, status, error) {
		                // 에러 처리
		                console.error(error);
		            }
		        });
		    });
		});
	</script>