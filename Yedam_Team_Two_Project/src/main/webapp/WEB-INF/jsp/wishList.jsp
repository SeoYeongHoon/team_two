<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="../../static/css/wishList.css">

<body>
    <div class="cart-table-area section-padding-100">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 col-lg-8">
                    <div class="wL-title mt-50">
                        <h2>Wish List</h2>
                    </div>

                    <div class="wL-table clearfix">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th>Image</th>
                                    <th>GoodsId</th>                                    
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${wishGoodsList}" var="wishGoods">
                                    <tr>
                                        <td class="wL_product_img" onclick="location.href='product.do?pno=${wishGoods.goodsId}'">
                                        <img src="../../static/img/bg-img/${wishGoods.image}" alt="Product"></td>
                                        <td class="wL_product_goodsId"><h5>${wishGoods.goodsId}</h5></td>
                                        <td class="wL_product_name"><h5>${wishGoods.name}</h5></td>
                                        <td class="wL_product_description"><h5>${wishGoods.description}</h5></td>
                                        <td class="wL_product_price"><h5>${wishGoods.price}</h5></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>               
            </div>
        </div>
    </div>
	<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="js/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Plugins js -->
	<script src="js/plugins.js"></script>
	<!-- Active js -->
	<script src="js/active.js"></script>

</body>