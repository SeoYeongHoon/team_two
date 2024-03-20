<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- <link rel="stylesheet" href="../../static/css/test.css"> -->

<header class="header-area clearfix">
	<!-- Close Icon -->
	<div class="nav-close">
		<i class="fa fa-close" aria-hidden="true"></i>
	</div>
	<!-- Logo -->
	<div class="logo" style="margin: -75px;">
		<a href="main.do"><img src="../../static/img/core-img/logo.jpg" alt=""></a>
	</div>
	<!-- Amado Nav -->
	<nav class="amado-nav">
		<ul>
			<li class="active"><a href="main.do">Home</a></li>
			<li><a href="privateListForm.do">개인 판매 템플릿</a></li>
			<li><a href="product-details.html">기업 판매</a></li>
			<li><a href="cart.html">Cart</a></li>
			<li><a href="checkout.html">Checkout</a></li>
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
	    	<c:when test="${!empty logName and logName != 'Admin'}">
		    	<p>${logName}님 환영합니다.</p> 
			    <a href="#" class="cart-nav"><img src="../../static/img/core-img/mypage.png" alt="mypage"> 마이페이지 <span></span></a>
				<a href="cart.html" class="fav-nav"><img src="../../static/img/core-img/cart.png" alt="cart"> 장바구니 <span></span></a>
				<a href="#" class="fav-nav"><img src="../../static/img/core-img/favorites.png" alt="">고객센터</a> <a href="#" class="search-nav">
				<img src="../../static/img/core-img/search.png" alt=""> FAQ</a>
	    	</c:when>
	    	<c:when test="${logName == 'Admin'}">
	    		<p>${logName}님 환영합니다.</p> 
			    <a href="admin.do" class="cart-nav">
				<img src="../../static/img/core-img/mypage.png" alt="mypage"> 관리자페이지 <span></span></a>
			    <a href="#" class="fav-nav">
				<img src="../../static/img/core-img/favorites.png" alt="">고객센터</a> <a href="#" class="search-nav">
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
