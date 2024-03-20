<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<html>
<head>
<meta charset="UTF-8">
<title>개인 판매 리스트</title>
<link rel="stylesheet" href="../../static/css/privateGoods.css">
</head>
<body>
	<div class="shop_sidebar_area">

		<!-- ##### Single Widget ##### -->
		<div class="widget catagory mb-50">
			<!-- Widget Title -->

			<!--  Catagories  -->
			<div class="widget brands mb-50">
			<!-- Widget Title -->
			<h6 class="widget-title mb-30">category</h6>

			<div class="widget-desc">
				<!-- Single Form Check -->
				<div class="form-check">
					<input class="form-check-input" name="category" type="radio" id="category"value="">
					<label class="form-check-label" for="amado">전체</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" name="category" type="radio" id="category"value="카테고리1">
					<label class="form-check-label" for="amado">카테고리1</label>
				</div>
				<!-- Single Form Check -->
				<div class="form-check">
					<input class="form-check-input" name="category" type="radio" id="category" value="카테고리2">
					<label class="form-check-label" for="ikea">카테고리2</label>
				</div>
				<!-- Single Form Check -->
				<div class="form-check">
					<input class="form-check-input" name="category" type="radio" id="category" value="카테고리3"> 
					<label class="form-check-label" for="furniture">카테고리3</label>
						
				</div>
			</div>
		</div>
		</div>

		<!-- ##### Single Widget ##### -->

		<!-- ##### Single Widget ##### -->

		<!-- ##### Single Widget ##### -->
		<div class="widget price mb-50">
			<!-- Widget Title -->
			<h6 class="widget-title mb-30">Price</h6>

			<div class="widget-desc">
				<div class="slider-range">
					<div data-min="10" data-max="1000" data-unit="$"
						class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all"
						data-value-min="10" data-value-max="1000" data-label-result="">
						<div class="ui-slider-range ui-widget-header ui-corner-all"></div>
						<span class="ui-slider-handle ui-state-default ui-corner-all"
							tabindex="0"></span> <span
							class="ui-slider-handle ui-state-default ui-corner-all"
							tabindex="0"></span>
					</div>
					<div class="range-price">$10 - $1000</div>
				</div>
			</div>
		</div>
	</div>

	<div class="amado_product_area section-padding-100">
		<div class="container-fluid">

			<div class="row">
				<div class="col-12">
					<div
						class="product-topbar d-xl-flex align-items-end justify-content-between">
						<!-- Total Products -->

						<!-- Sorting -->
						<div class="product-sorting d-flex">
							<div class="sort-by-date d-flex align-items-center mr-15">
								<p>Sort by</p>
								<form action="#" method="get">
									<select name="order" id="order" >
										<option value="new">최근순</option>
										<option value="old">오래된순</option>
										<option value="popular">인기순</option>
									</select>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row" id=productList>

				<!-- 상품리스트 넣는곳 -->

			</div>

			<div class="row">
				<div class="col-12">
					<!-- Pagination -->
					<nav aria-label="navigation">
						<ul class="pagination justify-content-end mt-50">
							<li class="page-item active"><a class="page-link" href="#">01.</a></li>
							<li class="page-item"><a class="page-link" href="#">02.</a></li>
							<li class="page-item"><a class="page-link" href="#">03.</a></li>
							<li class="page-item"><a class="page-link" href="#">04.</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
<!-- 주석 -->
	<script>
	 function showList(category,order){
	  $('#productList').html('');
	  console.log('리절트'+category);
      $.ajax({
	  url:'privateListControl.do',
	  method:'post',
	  data : {category : category, order : order},
	  success:function(result){
		      console.log(result)
		      result.forEach(prop =>{
			  console.log(prop.image)
			  //별배열 담기
			  let stars = [];
              for (let i = 0; i < prop.scoreId; i++) {
                 stars.push($("<i>", { class: 'fa fa-star', 'aria-hidden': 'true' }));
                     }
              //해시태그 배열 만들기
              $('.inlineHash').text("");
              let hashTags = [];
              let hashTag = prop.hashtag;
              console.log(prop.hashtag);
              hashTags = hashTag.split("#");
              console.log(hashTags);
              //전체목록 표시
			      $("#productList").append(
					    $("<div>", { class: 'col-2 col-sm-4 col-md-6 col-xl-4' }).append(
					        $("<div>", { class: 'single-product-wrapper' }).append(
					            $("<div>", { class: 'single-products-catagory1 clearfix' }).append(
					                $("<a>", { href: 'shop.html' }).append(
					                    $("<img>", { src: "../../static/img/bg-img/"+prop.image+"", alt: '', class: 'product-image' }), // 제품 이미지
					                    $("<div>", { class: 'hover-content1' }).append(
					                        $("<div>", { class: 'line' }),
					                        $("<h4>", { text: prop.name }), // 가격
					                        $("<p> ------------------ </p>"),
					                        $("<p>", { text: prop.description }) // 제품명					                        	
					                    )
					                )
					            ),
					            $("<div>", { class: 'product-description d-flex align-items-center justify-content-between' }).append(
					                $("<div>", { class: 'product-meta-data1' }).append(
					                    $("<a>", { class: 'product-price', href: 'product-details.html', text:prop.name }), // 가격
					                    $("<a>", { href: 'product-details.html' }).append(
					                        $("<h6>", { text: prop.price+"원" }) // 제품명
					                    )
					                ),
					                $("<div>", { class: 'ratings-cart text-right' }).append(
					                    $("<div>", { class: 'ratings' }).append(stars),
					                    $("<div>", { class: 'cart' }).append(
					                        $("<a>", { href: 'cart.html', 'data-toggle': 'tooltip', 'data-placement': 'left', title: 'Add to Cart' }).append(
					                            $("<img>", { src: '../../static/img/core-img/cart.png', alt: '' }) // 장바구니 아이콘
					                        )
					                    )
					                )
					            )
					        )
					    )
					);
			      hashTags.forEach(item => {
			    	  $(".product-meta-data1").prepend($("<a>", {class:'inlineHash', href: 'product-details.html', text: "#"+ item })); // 해쉬테그	
			      	       
			      	})
               
		  })
	  },
	  error: function(xhr, status, error) {
          console.error(error);
      }
   })
} 
//카테고리
$('.form-check').on("change", function(){
	let category =$('input[name=category]:checked').val()
	let order = $(this).val();
	showList(category,order);
})
showList();
//정렬순
$(document).ready(function(){
    $('#order').on("change", function(){
    	let category = $('input[name=category]:checked').val();
        let order = $(this).val();
        showList(category, order);
    });
});
	</script>

</body>
</html>