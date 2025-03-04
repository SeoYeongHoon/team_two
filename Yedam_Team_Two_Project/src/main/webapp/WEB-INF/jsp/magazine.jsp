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
                    <div class="magazine-image-parent">
                        <div class="magazine-image">
                            <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <a class="gallery_img" href="../static/img/bg-img/${magazine.image}">
                                            <img class="d-block w-100" src="../static/img/bg-img/${magazine.image}" alt="First slide">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="single_product_desc">
                            <!-- Product Meta Data -->
                            <div class="product-meta-data">
                                <div class="line"></div>
                                <p class="product-price">${magazine.mcName}</p>
                                <h3>${magazine.title}</h3>
                                
                                <div class="ratings-review mb-15 d-flex align-items-center justify-content-between">
                                    <div class="review magazine-writer">
                                        <a href="#" style="">${magazine.memberId}</a>
                                        <br>
                                        <a href="#" style="">${magazine.getDateToString()}</a>
                                    </div>
                                </div>
                            </div>

                            <div class="short_overview my-5">
                                <p>${magazine.content}</p>
                            </div>
							<div class="magazine-returnToTitleButton">
                                <button type="submit" class="magazine-behindPageButton" onclick="location.href='magazineList.do'">return to title.</button>							
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
