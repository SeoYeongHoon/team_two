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
			<h6 class="widget-title mb-30">Catagories</h6>

			<!--  Catagories  -->
			<div class="catagories-menu">
				<ul>
					<li class="active"><a href="#">카테고리1</a></li>
					<li><a href="#">카테고리2</a></li>
					<li><a href="#">카테고리3</a></li>
					<li><a href="#">카테고리4</a></li>
				</ul>
			</div>
		</div>

		<!-- ##### Single Widget ##### -->
		<div class="widget brands mb-50">
			<!-- Widget Title -->
			<h6 class="widget-title mb-30">Brands</h6>

			<div class="widget-desc">
				<!-- Single Form Check -->
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="" id="amado">
					<label class="form-check-label" for="amado">테마</label>
				</div>
				<!-- Single Form Check -->
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="" id="ikea">
					<label class="form-check-label" for="ikea">테마</label>
				</div>
				<!-- Single Form Check -->
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value=""
						id="furniture"> <label class="form-check-label"
						for="furniture">테마</label>
				</div>
			</div>
		</div>

		<!-- ##### Single Widget ##### -->
		<div class="widget color mb-50">
			<!-- Widget Title -->
			<h6 class="widget-title mb-30">Color</h6>

			<div class="widget-desc">
				<ul class="d-flex">
					<li><a href="#" class="color1"></a></li>
					<li><a href="#" class="color2"></a></li>
					<li><a href="#" class="color3"></a></li>
					<li><a href="#" class="color4"></a></li>
					<li><a href="#" class="color5"></a></li>
					<li><a href="#" class="color6"></a></li>
					<li><a href="#" class="color7"></a></li>
					<li><a href="#" class="color8"></a></li>
				</ul>
			</div>
		</div>

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
									<select name="select" id="sortBydate">
										<option value="value">Date</option>
										<option value="value">Newest</option>
										<option value="value">Popular</option>
									</select>
								</form>
							</div>
							<div class="view-product d-flex align-items-center">
								<p>View</p>
								<form action="#" method="get">
									<select name="select" id="viewProduct">
										<option value="value">12</option>
										<option value="value">24</option>
										<option value="value">48</option>
										<option value="value">96</option>
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

	<script>
      $.ajax({
	  url:'privateListControl.do',
	  method:'get',
	  success:function(result){
		  console.log(result)
		  result.forEach(prop =>{
			  console.log(prop.image)
			  let stars = [];
              for (let i = 0; i < prop.scoreId; i++) {
                 stars.push($("<i>", { class: 'fa fa-star', 'aria-hidden': 'true' }));
                     }
			      $("#productList").append(
					    $("<div>", { class: 'col-2 col-sm-4 col-md-6 col-xl-4' }).append(
					        $("<div>", { class: 'single-product-wrapper' }).append(
					            $("<div>", { class: 'single-products-catagory1 clearfix' }).append(
					                $("<a>", { href: 'shop.html' }).append(
					                    $("<img>", { src: "../../static/img/bg-img/"+prop.image+"", alt: '', class: 'product-image' }), // 제품 이미지
					                    $("<div>", { class: 'hover-content1' }).append(
					                        $("<div>", { class: 'line' }),
					                        $("<p>", { text: prop.name }), // 가격
					                        $("<p>", { text: prop.price+"원" }) // 제품명
					                    )
					                )
					            ),
					            $("<div>", { class: 'product-description d-flex align-items-center justify-content-between' }).append(
					                $("<div>", { class: 'product-meta-data' }).append(
					                    $("<a>", { class: 'product-price', href: 'product-details.html', text: prop.name }), // 가격
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
		  })
	  },
	  error: function(xhr, status, error) {
          console.error(error);
      }
})
	</script>

</body>
</html>