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
					<div data-min="10000" data-max="50000" data-unit=""
						class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all"
						data-value-min="10000" data-value-max="50000" data-label-result="">
						<div class="ui-slider-range ui-widget-header ui-corner-all"></div>
						<span class="ui-slider-handle ui-state-default ui-corner-all"
							tabindex="0"></span> <span
							class="ui-slider-handle ui-state-default ui-corner-all"
							tabindex="0"></span>
					</div>
					<div class="range-price">10000  50000</div>
					<input type="button" value="가격검색" id="rangeBtn">
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
									<select name="order" id="order" >
										<option value="new">최근순</option>
										<option value="old">오래된순</option>
										<option value="popular">인기순</option>
									</select>
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
	 function showList(category,order,price1=10000,price2=50000){
	  $('#productList').html('');
      $.ajax({
	  url:'privateListControl.do',
	  method:'post',
	  data : {category : category, order : order, price1 : price1, price2 : price2},
	  success:function(result){
		      result.forEach(prop =>{
			  //별배열 담기
			  let stars = [];
              for (let i = 0; i < prop.scoreId; i++) {
                 stars.push($("<i>", { class: 'fa fa-star', 'aria-hidden': 'true' }));
                     }
              //해시태그 배열 만들기
              $('.inlineHash').text("");
              let hashTags = [];
              let hashTag = prop.hashtag;
              hashTags = hashTag.split("#");
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
					                    $("<a>", { class: 'product-price', href: 'product-details.html', text:prop.name}), // 이름
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
	let price = $('.range-price').text()
	console.log(price);
	let priceSlice1 = price.substring(0,6);
    let priceSlice2 = price.substring(7);
    let price1 = priceSlice1.trim();
    let price2 = priceSlice2.trim();
	let category =$('input[name=category]:checked').val()
	let order = $('select[name=order]').val();
	console.log('지금'+order+category+price1+price2)
	showList(category,order,price1,price2);  
})

//정렬순
$(document).ready(function(){
    $('#order').on("change", function(){
    	let category = $('input[name=category]:checked').val();
        let order = $(this).val();
        let price = $('.range-price').text()
        console.log(price);
    	let priceSlice1 = price.substring(0,6);
        let priceSlice2 = price.substring(7);
        let price1 = priceSlice1.trim();
        let price2 = priceSlice2.trim();
        console.log('now'+order+category+price1+price2)
        showList(category,order,price1,price2);  
    });
});
//가격순

$('#rangeBtn').on("click", function(){
	let price = $('.range-price').text();
    $('#productList').html('');
    console.log(price);
    let priceSlice1 = price.substring(0,6);
    let priceSlice2 = price.substring(7);
    let price1 = priceSlice1.trim();
    let price2 = priceSlice2.trim();
    let order = $('select[name=order]').val();
    let category =$('input[name=category]:checked').val()
    showList(category,order,price1,price2);  
});
//총페이지 갯수만들기
    function countButton() {
    let price = $('.range-price').text();
    let priceSlice1 = price.substring(0, 5);
    let priceSlice2 = price.substring(6);
    let price1 = priceSlice1.trim();
    let price2 = priceSlice2.trim();
    let category = $('input[name=category]:checked').val();
    $.ajax({
        url: 'privateCount.do',
        method: 'post',
        dataType: 'json',
        data: {
            category: category,
            price1: price1,
            price2: price2
        },
        success: function(result) {
            let pagination = $('.pagination');
            pagination.html('');
            let totalCnt = result.totalCount;
            let startPage, endPage;
            let next, prev;
            let realEnd = Math.ceil(totalCnt / 5); // 한 페이지 당 5개의 아이템이라 가정합니다.
            endPage = Math.ceil(totalCnt / 5); // 첫 페이지는 항상 1이므로 endPage를 totalCnt로 설정합니다.
            startPage = 1;
            next = false; // next 버튼을 비활성화합니다.
            prev = false; // prev 버튼을 비활성화합니다.

            // 페이지가 1보다 큰 경우에만 prev 버튼을 활성화합니다.
            if (endPage > 1) {
                prev = true;
            }

            // prev 버튼을 추가합니다.
            if (prev) {
                $('<a/>').attr('href', '#').attr('data-page', 1).html('&laquo;').appendTo(pagination);
            }

            // 페이지 번호를 추가합니다.
            for (let p = startPage; p <= endPage; p++) {
                $('<a/>').attr('href', '#').attr('data-page', p).html(p).appendTo(pagination);
            }

            // next 버튼을 추가합니다.
            if (next) {
                $('<a/>').attr('href', '#').attr('data-page', 2).html('&raquo;').appendTo(pagination);
            }
        },
        error: function(xhr, status, error) {
            console.error(error);
        }
    });
}

$(document).ready(function(){
showList();
countButton();
});
	</script>

</body>
</html>