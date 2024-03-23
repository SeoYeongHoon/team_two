<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="//cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<html lang="utf-8">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../static/css/core-style.css">

<title>Insert title here</title>
</head>
<body>
<div class="products-catagories-area clearfix">
            <div class="amado-pro-catagory clearfix">
                <!-- Single Catagory -->
               <c:forEach var="main" items="${list}">
                <div class="single-products-catagory clearfix">
                    <a href="product.do?pno=${main.goodsId}">
                        <img src="../../static/img/bg-img/${main.image}"  alt="">
                        <!-- Hover Content -->
                        <div class="hover-content">
                            <div class="line"></div>
                            <p>${main.price}원</p>
                            <h4>${main.name}</h4>
                        </div>
                    </a>
                </div>
               </c:forEach>
            </div>
        </div>
</body>
</html>