<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<link rel="stylesheet" href="../../static/css/wishList.css">

<body>
    <div class="cart-table-area section-padding-100">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 col-lg-8">
                    <div class="cart-title mt-50">
                        <h2>Wish List</h2>
                    </div>

                    <div class="cart-table clearfix">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>price</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${wishGoodsList}" var="wishGoods">
                                    <tr>
                                        <td class="cart_product_img"><a href="#"><img src="../../static/img/product-img/product1.jpg" alt="Product"></a></td>
                                        <td class="cart_product_desc">
                                            <h5>${wishGoods.name}</h5>
                                        </td>                                       
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