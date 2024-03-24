<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../static/css/admin.css">
<link href="//cdn.datatables.net/2.0.2/css/dataTables.dataTables.min.css" rel="stylesheet" />
<script src="//cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
<!-- <link rel="stylesheet" href="../../static/css/test.css"> -->

<header class="header-area clearfix">
	<!-- Close Icon -->
	<div class="nav-close">
		<i class="fa fa-close" aria-hidden="true"></i>
	</div>
	<!-- Logo -->
	<div class="logo" style="margin: -75px;">
		<a href="main.do"><img src="../../static/img/core-img/logo.jpg" style="margin-top:-50px; " alt=""></a>
	</div>
	<!-- Amado Nav -->
	<nav class="amado-nav">
		<ul>
			<li class="active"><a href="main.do">Home</a></li>
			<li><a href="privateListForm.do">Template By Seller</a></li>
			<li><a href="companyListForm.do">Template By Company</a></li>
			<li><a href="magazineList.do">Magazine</a></li>
			<li><a href="support.do">Support</a></li>
		</ul>
	</nav>
	<!-- Button Group -->
	<c:choose>
		<c:when test="${empty logid }">
			<div class="amado-btn-group mt-30 mb-100">
				<a href="loginForm.do" class="btn amado-btn mb-15">로그인</a> 
				<a href="addMemberForm.do" class="btn amado-btn active">회원가입</a>
			</div>
		</c:when>
		<c:otherwise>
		     <div class="amado-btn-group mt-30 mb-100">
				<a href="logout.do" class="btn amado-btn mb-15">로그아웃</a> 
			</div>
		</c:otherwise>
	</c:choose>
	<!-- Cart Menu -->
	<div class="cart-fav-search mb-100">
	    <c:choose>
	    	<c:when test="${!empty logName and logMemberType != 'MANAGER'}">
		    	<p>Welcome, ${logName}</p> 
			    <a href="mypage.do" class="cart-nav"><img src="../../static/img/core-img/mypage.png" alt="mypage"> My Page </a>
				<a href="myCart.do" class="fav-nav"><img src="../../static/img/core-img/cart.png" alt="cart"> My Cart </a>
				<a href="downloadMyGoods.do" class="fav-nav"><img src="../../static/img/core-img/mypage.png" alt="download"> Download </a>
				<a href="wishList.do" class="fav-nav"><img src="../../static/img/core-img/mypage.png" alt="download"> WishList </a>
	    	</c:when>
	    	<c:when test ="${logMemberType =='MANAGER'}">
	    		<p>Welcome, ${logName}</p> 
			    <a href="admin.do" class="cart-nav">
				<img src="../../static/img/core-img/mypage.png" alt="mypage"> Management <span></span></a>
			    <a href="#" class="fav-nav">
				<img src="../../static/img/core-img/favorites.png" alt="">Support</a> <a href="#" class="search-nav">
				<img src="../../static/img/core-img/search.png" alt=""> FAQ</a>
	    	</c:when>
		</c:choose>	
	</div>
	<!-- Social Button -->
	<div class="social-info d-flex justify-content-between">
		<a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a> <a
			href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a> <a
			href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a> <a
			href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
	</div>
</header>
