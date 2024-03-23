<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" src="../../static/css/Review.css">	
<body>
	<div class="single-product-area section-padding-100 clearfix">
		<div class="container-fluid">
			<!-- 상단 화면 -->
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<!-- 상단 태그 -->
						<!-- 	<ol class="breadcrumb mt-50">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item"><a href="#">Furniture</a></li>
							<li class="breadcrumb-item"><a href="#">Chairs</a></li>
							<li class="breadcrumb-item active" aria-current="page">white
								modern chair</li>
						</ol> -->
					</nav>
				</div>
			</div>

			<div class="row">
				<div class="col-12 col-lg-7">
					<div class="single_product_thumb">
						<div id="product_details_slider" class="carousel slide"
							data-ride="carousel">

							<!-- 큰사진 -->
							<div class="carousel-inner">
								<div class="carousel-item active">
									<a class="gallery_img"
										href="../../static/img/product-img/pro-big-1.jpg"> <img
										class=` "d-block1
										w-100" src="../../static/img/product-img/pro-big-1.jpg"
										alt="First slide">
									</a>
								</div>
								<!-- 사진이 두개라서 두개만... -->
								<!-- 	<div class="carousel-item">
									<a class="gallery_img" href=""> <img class="d-block w-100"
										src="../../static/img/product-img/pro-big-2.jpg"
										alt="Second slide">
									</a>
								</div>
								<div class="carousel-item">
									<a class="gallery_img"
										href="../../static/img/product-img/pro-big-3.jpg"> <img
										class="d-block w-100"
										src="../../static/img/product-img/pro-big-3.jpg"
										alt="Third slide">
									</a>
								</div> -->
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
				<div class="col-12 col-lg-5">
					<div class="single_product_desc">
						<!-- Product Meta Data -->
						<div class="product-meta-data">
							<div class="line"></div>
							<a>
								<h6>${goods.name}</h6>
							</a>
							<div class="line"></div>
							<p class="product-price" id="price">${goods.price}원</p>
							<!-- Ratings & Review -->
							<!-- 별 갯수 -->
							<div
								class="ratings-review mb-15 d-flex align-items-center justify-content-between">
								<!-- <div class="ratings">
									<i class="fa fa-star" aria-hidden="true"></i>  <i
										class="fa fa-star" aria-hidden="true"></i> <i
										class="fa fa-star" aria-hidden="true"></i> <i
										class="fa fa-star" aria-hidden="true"></i> <i
										class="fa fa-star" aria-hidden="true"></i>
								</div> -->
							</div>
							<!-- Avaiable -->
							<p class="avaibility" id="hashtag">
								<!-- <i class="fa fa-circle"></i> -->
								${goods.hashtag }
							</p>
						</div>

						<div class="short_overview my-5">

							<p>${goods.description }</p>
						</div>
						</div>
						<!-- Add to Cart Form -->
						<form class="cart clearfix" method="post">
							
							<!-- 	 <p>Qty</p>
                                    <div class="quantity">
                                        <span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i class="fa fa-caret-down" aria-hidden="true"></i></span>
                                        <input type="number" class="qty-text" id="qty" step="1" min="1" max="300" name="quantity" value="1">
                                        <span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-caret-up" aria-hidden="true"></i></span>
                                    </div>  -->
							<div class="d-flex">
								<button type="submit" name="addtocart" value="5"
									class="btn amado-btn">찜하기</button>
								<button type="submit" name="addtocart" value="5"
									class="btn amado-btn">장바구니</button>
								<button type="submit" name="addtocart" value="5"
									class="btn amado-btn">바로 구매</button>
							</div>
							
								<div id=""><input id="reviewtext" type="text" placeholder="리뷰">
								<input id="reviewBtn" type="submit" value="등록"></div>
								<hr />
								<div class="reviewbox">
								<ul>
									<li><span class="reviewId">아이디</span>
										<span class="reviewscore">점수</span>
										<span class="reviewtitle">제목</span>
										<span class="reviewtime">게시날짜</span>
										<span class="reviewcontent">내용</span>
									</li>
								</ul>
									<hr />
								</div>
							<!-- 	<div class="reviewtable">
								<table rowspan="3">
									<tr>
										<th>아이디</td>
										<th>제목</td>
										<th>내용</td>
										<th>게시날짜</td>
										<th>점수</td>
									</tr>
									<tr>
										<td>youhwan</td>
										<td>제목</td>
										<td>내용</td>
										<td>24-03-22</td>
										<td>4점</td>
									</tr>
								</table>
								</div> -->
						</form>
					
				</div>
			</div>
		</div>
	</div>
	<!-- Product Details Area End -->
	</div>
	<script>
		$('.reviewBtn').on('click', function(e) {
			let val = $('')
		})
		
		
	 	fetch('../review.do')
		.then(result => result.json())
		.then(result => {
			
			console.log(result);
			result.forEach(prop => {
				//document.getElementById('')
				//console.log(prop.reviewId, prop.content,)
		const review = ["reviewId", "title", "content", "createDate", "memberId", "goodsId", "scoreId"]
		console.log(review);
				
			})
			
		}) 
		
		fetch('../reviewcount.do')
		.then(result => result.json())
		.then(count => {
			//console.log(count);
		})
		// 

		
		
	</script>
</body>