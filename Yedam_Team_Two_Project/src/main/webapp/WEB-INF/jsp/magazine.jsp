<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../../static/css/magazineList.css">
    
        <div class="single-product-area section-padding-100 clearfix">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <nav aria-label="breadcrumb">
                            <h2>Magazine</h2>
                        </nav>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 col-lg-7">
                        <div class="single_product_thumb">
                            <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li class="active" data-target="#product_details_slider" data-slide-to="0" style="background-image: url(../static/img/bg-img/${magazine.image}.jpg);">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="1" style="background-image: url(../static/img/bg-img/${magazine.image}.jpg);">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="2" style="background-image: url(../static/img/bg-img/${magazine.image}.jpg);">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="3" style="background-image: url(../static/img/bg-img/${magazine.image}.jpg);">
                                    </li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <a class="gallery_img" href="../static/img/bg-img/${magazine.image}.jpg">
                                            <img class="d-block w-100" src="../static/img/bg-img/${magazine.image}.jpg" alt="First slide">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="../static/img/bg-img/${magazine.image}.jpg">
                                            <img class="d-block w-100" src="../static/img/bg-img/${magazine.image}.jpg" alt="Second slide">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="../static/img/bg-img/${magazine.image}.jpg">
                                            <img class="d-block w-100" src="../static/img/bg-img/${magazine.image}.jpg" alt="Third slide">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="../static/img/bg-img/${magazine.image}.jpg">
                                            <img class="d-block w-100" src="../static/img/bg-img/${magazine.image}.jpg" alt="Fourth slide">
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
                                <p class="product-price">2024-02-20</p>
                                <h3>${magazine.title}</h3>
                                
                                <div class="ratings-review mb-15 d-flex align-items-center justify-content-between">
                                    <div class="review magazine-writer">
                                        <a href="#" style="">${magazine.memberId}</a>
                                    </div>
                                </div>
                            </div>

                            <div class="short_overview my-5">
                                <p>${magazine.content}</p>
                            </div>

                            <form class="cart clearfix magazine-behindPageButton-parent" method="post">
                                <button type="submit" name="addtocart" value="2" class="magazine-behindPageButton">return to title.</button>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
