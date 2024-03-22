<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../static/css/login.css">
<div id="container">
		<!--  login 폼 영역을 : loginBox -->
		<div id="loginBox">
			<!-- 로그인 페이지 타이틀 -->
			<div id="loginBoxTitle">비밀번호 확인</div>
			<!-- 아이디, 비번, 버튼 박스 -->
			<form action="editMyInfo.do" method="post">
				<div id="inputBox">
				<p style="color: red;">${message }</p>
					<div class="input-form-box">
						<span style="margin-right:20px;">비밀번호 </span>
						<input type="password" name="pw" class="form-control">
						<input type="hidden" name="myPw" value="${logPw }">
					</div>

					<div class="button-login-box">
						<button type="submit" class="btn btn-primary btn-warning"
							style="width: 100%">확인</button>
					</div>
				</div>
			</form>

		</div>
	</div>