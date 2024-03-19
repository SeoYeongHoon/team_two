<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
<div class="single-product-area section-padding-100 clearfix">
            <div class="container-fluid">
            <!-- 상단 화면 -->
                <div class="row">
                    <div class="col-12">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mt-50">
                            <!-- 상단 태그 -->
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Furniture</a></li>
                                <li class="breadcrumb-item"><a href="#">Chairs</a></li>
                                <li class="breadcrumb-item active" aria-current="page">white modern chair</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 col-lg-7">
                        <div class="single_product_thumb">
                            <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                           <!-- 작은화면  -->
                                <ol class="carousel-indicators">
                                    <li class="active" data-target="#product_details_slider" data-slide-to="0" style="background-image: url(../../static/img/product-img/pro-big-1.jpg);">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="1" style="background-image: url(../../static/img/product-img/pro-big-2.jpg);">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="2" style="background-image: url(../../static/img/product-img/pro-big-3.jpg);">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="3" style="background-image: url(../../static/img/product-img/pro-big-4.jpg);">
                                    </li>
                                </ol>
                                
                                <!-- 큰사진 -->
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <a class="gallery_img" href="../../static/img/product-img/pro-big-1.jpg">
                                            <!-- <img class=`"d-block w-100" src="#" alt="First slide"> -->
                                        </a>
                                    </div>
                                    
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="">
                                            <img class="d-block w-100" src="../../static/img/product-img/pro-big-2.jpg" alt="Second slide">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="../../static/img/product-img/pro-big-3.jpg">
                                            <img class="d-block w-100" src="../../static/img/product-img/pro-big-3.jpg" alt="Third slide">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="../../static/img/product-img/pro-big-4.jpg">
                                            <img class="d-block w-100" src="static/img/product-img/pro-big-4.jpg" alt="Fourth slide">
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
                                <p class="product-price">5000(가격)${Goods.price }</p>
                                <a>
                                    <h6>의자(상품명)</h6>
                                </a>
                                <!-- Ratings & Review -->
                                <!-- 별 갯수 -->
                                <div class="ratings-review mb-15 d-flex align-items-center justify-content-between">
                                    <div class="ratings">
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                    </div>
                                <!--     <div class="review">
                                        <a href="#">리뷰를 작성해주세요</a>
                                    </div> -->
                                </div>
                                <!-- Avaiable -->
                                <p class="avaibility" id="hashtag"><!-- <i class="fa fa-circle"></i> -->#의자 #책상 #혼밥 (해쉬태그)${Goods.hashtag }</p>
                            </div>

                            <div class="short_overview my-5">
                                <p>해쉬 태그:</p>
                                <p>파일 형식:</p>
                                <p>파일 크기:</p>
                                <p>슬라이드 사이즈:</p>
                                <p>슬라이드 구성:</p>
                            </div>

                            <!-- Add to Cart Form -->
                            <form class="cart clearfix" method="post">
                               <div class="cart-btn d-flex mb-50">
                                    <!-- <p>Qty</p>
                                    <div class="quantity">
                                        <span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i class="fa fa-caret-down" aria-hidden="true"></i></span>
                                        <input type="number" class="qty-text" id="qty" step="1" min="1" max="300" name="quantity" value="1">
                                        <span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-caret-up" aria-hidden="true"></i></span>
                                    </div> -->
                                    <input value="댓글창" size="40px" type="text">
                                    <input type="submit" name="addtocart" value="등록" id="button" size="20px"></button>
                                </div>
                                <div class="d-flex">
                                    <button type="submit" name="addtocart" value="5" class="btn amado-btn">찜하기</button>
                                    <button type="submit" name="addtocart" value="5" class="btn amado-btn">장바구니</button>
                                    <button type="submit" name="addtocart" value="5" class="btn amado-btn">바로 구매</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product Details Area End -->
    </div>
</body>