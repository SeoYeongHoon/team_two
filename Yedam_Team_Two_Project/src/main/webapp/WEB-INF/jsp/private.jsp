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
					<input class="form-check-input" name="category" type="radio" class="category"value="">
					<label class="form-check-label" for="amado">전체</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" name="category" type="radio" class="category"value="카테고리1">
					<label class="form-check-label" for="amado">카테고리1</label>
				</div>
				<!-- Single Form Check -->
				<div class="form-check">
					<input class="form-check-input" name="category" type="radio" class="category" value="카테고리2">
					<label class="form-check-label" for="ikea">카테고리2</label>
				</div>
				<!-- Single Form Check -->
				<div class="form-check">
					<input class="form-check-input" name="category" type="radio" class="category" value="카테고리3"> 
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
								<p>정렬</p>
									<select name="order" id="order" >
										<option value="new">최근순</option>
										<option value="old">오래된순</option>
										<option value="popular">인기순</option>
										<option value="lowPrice">낮은 가격순</option>
										<option value="highPrice">높은 가격순</option>
									</select>
							</div>
						</div>
					</div>
				</div>
			</div>
             <div class="search1">
                                 <input type="text" placeholder="검색어 입력" name="look" class="input1"value="">
                                 <a href="#"><img class="img1"src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"></a>
            </div>
			<div class="row" id=productList>

				<!-- 상품리스트 넣는곳 -->

			</div>

			<div class="row">
				<div class="col-12">
					<!-- Pagination -->
					<nav aria-label="navigation">
						<ul class="pagination justify-content-end mt-50">
						
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
<!-- 주석 -->
	<script>
	let id = '${logid}';
	console.log(id);
	let page= 1;
	 function showList(category,order,price1=10000,price2=50000,page =1,sl){
	  $('#productList').html('');
      $.ajax({
	  url:'privateListControl.do',
	  method:'post',
	  data : {category : category,
		      order : order,
		      price1 : price1,
		      price2 : price2,
		      page : page,
		      sl : sl},
	  success:function(result){
		      result.forEach(prop =>{
			  //별배열 담기
			  let stars = [];
              for (let i = 0; i < prop.scoreId; i++) {
                 stars.push($("<i>", { class: 'fa fa-star', 'aria-hidden': 'true' }));
                     }
              //해시태그 배열 만들기
              $('.inlineHash').remove();
              let hashTags = [];
              let hashTag = prop.hashtag;
              hashTags = hashTag.split("#");
              //전체목록 표시
			      $("#productList").append(
					    $("<div>", { class: 'col-2 col-sm-4 col-md-6 col-xl-4' }).append(
					       $("<a>", { href: 'product.do?pno='+prop.goodsId}).append(
					         $("<div>", { class: 'single-product-wrapper' }).append(
					            $("<div>", { class: 'single-products-catagory1 clearfix' }).append(
					                $("<a>", { href: 'product.do?pno='+prop.goodsId}).append(
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
					                    $("<p>", { class: 'product-price', href: 'product-details.html', text:prop.name}), // 이름
					                    $("<p>", { href: 'product-details.html' }).append(
					                        $("<h6>", { text: prop.price+"원" }) // 가격
					                    )
					                ),
					                $("<div>", { class: 'ratings-cart text-right' }).append(
					                    $("<div>", { class: 'ratings' }).append(stars),
					                    $("<div>", { class: 'cart' }).append(
					                    	    $("<a>", { href: '#', 'data-toggle': 'tooltip', 'data-placement': 'left', title: 'Add to Cart', 'data-product-id': prop.goodsId }).append(
					                    	        $("<img>", { src: '../../static/img/core-img/cart.png', alt: '' }) // 장바구니 아이콘
					                    	    )
					                    	)
					                )
					            )
					        )
					      )
					   )
					);
			      hashTags.forEach(item => {
			    	  $(".product-meta-data1").prepend($("<a>", {class:'inlineHash', href: 'product.do?pno='+prop.goodsId, text:"#"+item })); // 해쉬테그	
			      	       
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
	page=1
	let price = $('.range-price').text()
	console.log(price);
	let priceSlice1 = price.substring(0,6);
    let priceSlice2 = price.substring(7);
    let price1 = priceSlice1.trim();
    let price2 = priceSlice2.trim();
	let category =$('input[name=category]:checked').val()
	let order = $('select[name=order]').val();
	console.log('지금'+order+category+price1+price2)
	let sl = $('input[name=look]').val()
	showList(category,order,price1,price2,page,sl);  
	countButton(category,price1,price2,sl)
})

//정렬순
$(document).ready(function(){
	page =1;
    $('#order').on("change", function(){
    	page =1;
    	let category = $('input[name=category]:checked').val();
        let order = $(this).val();
        let price = $('.range-price').text()
        console.log(price);
    	let priceSlice1 = price.substring(0,6);
        let priceSlice2 = price.substring(7);
        let price1 = priceSlice1.trim();
        let price2 = priceSlice2.trim();
        console.log('now'+order+category+price1+price2);
        let sl = $('input[name=look]').val()
        showList(category,order,price1,price2,page,sl);  
        countButton(category,price1,price2,sl)
    });
});
//가격순
$('#rangeBtn').on("click", function(){
	page =1;
	let price = $('.range-price').text();
    $('#productList').html('');
    console.log(price);
    let priceSlice1 = price.substring(0,6);
    let priceSlice2 = price.substring(7);
    let price1 = priceSlice1.trim();
    let price2 = priceSlice2.trim();
    let order = $('select[name=order]').val();
    let category =$('input[name=category]:checked').val();
    let sl = $('input[name=look]').val()
    showList(category,order,price1,price2,page,sl);  
    countButton(category,price1,price2,sl);
});
//검색클릭
$('.img1').on("click", function(){
	let sl = $('input[name=look]').val()
	let price = $('.range-price').text();
	let priceSlice1 = price.substring(0,6);
    let priceSlice2 = price.substring(7);
    let price1 = priceSlice1.trim();
    let price2 = priceSlice2.trim();
    let order = $('select[name=order]').val();
    let category =$('input[name=category]:checked').val();
    showList(category,order,price1,price2,page,sl);  
    countButton(category,price1,price2,sl);
})
//검색엔터
$('.input1').on("keyup", function(key){
	if(key.keyCode==13){
	let sl = $('input[name=look]').val()
	let price = $('.range-price').text();
	let priceSlice1 = price.substring(0,6);
    let priceSlice2 = price.substring(7);
    let price1 = priceSlice1.trim();
    let price2 = priceSlice2.trim();
    let order = $('select[name=order]').val();
    let category =$('input[name=category]:checked').val();
    showList(category,order,price1,price2,page,sl);  
    countButton(category,price1,price2,sl);
	}
})
//총페이지 갯수만들기
    function countButton(category='',price1=10000,price2=50000,sl) {
    let price = $('.range-price').text();
    $.ajax({
        url: 'privateCount.do',
        method: 'post',
        dataType: 'json',
        data: {
            category: category,
            price1: price1,
            price2: price2,
            sl : sl
        },
        success: function(result) {
            let pagination = $('.pagination.justify-content-end.mt-50');
            console.log('page', pagination)
            pagination.html('');
            let totalCnt = result.totalCount;
            let startPage, endPage; //1~5, 6~10
        	let next, prev;
        	let realEnd = Math.ceil(totalCnt / 6);
        	endPage = Math.ceil(page / 5) * 5;
        	startPage = endPage - 4;
        	endPage = endPage > realEnd ? realEnd : endPage;
        	next = endPage < realEnd ? true : false;
        	prev = startPage > 1;

        	if (prev) {
        		$('<li class="page-item"/>').append($('<a class="page-link"/>').attr('href', '#').attr('data-page',startPage - 1).html('&laquo;')).appendTo(pagination)
        	}

            
        	for (let p = startPage; p <= endPage; p++) {
        		let aTag = $('<li class="page-item"/>').append($('<a class="page-link"/>').attr('href', '#').attr('data-page', p).html(p)).appendTo(pagination)
        		if (p == page) {
        			aTag.addClass('active');
        		}
        	}

        	if (next) {
        		$('<li class="page-item"/>').append($('<a class="page-link"/>').attr('href', '#').attr('data-page', endPage + 1).
        			html('&raquo;')).appendTo(pagination)
        	}
        },
        error: function(xhr, status, error) {
            console.error(error);
        }
    });
}
//링크페이지 이동
$('.pagination').on('click', 'a', function(e){
	page=$(this).data('page')
    let price = $('.range-price').text()
	let priceSlice1 = price.substring(0,6);
    let priceSlice2 = price.substring(7);
    let price1 = priceSlice1.trim();
    let price2 = priceSlice2.trim();
    let order = $('select[name=order]').val();
    let category =$('input[name=category]:checked').val()
    let sl = $('input[name=look]').val()
    showList(category,order,price1,price2,page,sl);
    countButton(category,price1,price2,sl);
})
//장바구니 등록
$(document).on('mouseover', '.cart', function(e){
    e.preventDefault(); 
    e.stopPropagation(); // 이벤트 전파 중단
    $(this).css('backgroundColor', '#ffff00');
});
$(document).on('mouseout', '.cart', function(e){
    e.preventDefault(); 
    e.stopPropagation(); 
    $(this).css('backgroundColor', '#ffffff');
});
//장바구니 등록
$(document).on('click', 'a[data-product-id]', function(e){
    e.preventDefault(); 
    e.stopPropagation();
    let pno = $(this).data('product-id'); // ★★★★★★★★상품 값 가져오기★★★★★★★★★★★★
    console.log('pno: '+pno);
    $.ajax({
        url:'cartAdd.do',
        method:'post',
        data:{ pno: pno, id: id },
        success:function(result){
        	  if(result.retCode == 'SAME'){
        	     alert('이미 같은 상품을 장바구니에 등록하셨습니다')	  
        	  }
              else if(result.retCode == 'OK'){
                alert('장바구니에 등록되었습니다.');
             } else {
                alert('로그인 후 사용하세요');
                window.open('loginForm.do', '_blank');
            }
        },
        error: function(xhr, status, error) {
            console.error(error);
        }
    })
});

$(document).ready(function(){
showList();
countButton();

});
	</script>

</body>
</html>