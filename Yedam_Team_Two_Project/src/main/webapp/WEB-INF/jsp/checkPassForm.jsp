<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../static/css/login.css">
<div id="container">
		<!--  login �� ������ : loginBox -->
		<div id="loginBox">
			<!-- �α��� ������ Ÿ��Ʋ -->
			<div id="loginBoxTitle">��й�ȣ Ȯ��</div>
			<!-- ���̵�, ���, ��ư �ڽ� -->
			<form action="editMyInfo.do" method="post">
				<div id="inputBox">
				<p style="color: red;">${message }</p>
					<div class="input-form-box">
						<span style="margin-right:20px;">��й�ȣ </span>
						<input type="password" name="pw" class="form-control">
						<input type="hidden" name="myPw" value="${logPw }">
					</div>

					<div class="button-login-box">
						<button type="submit" class="btn btn-primary btn-warning"
							style="width: 100%">Ȯ��</button>
					</div>
				</div>
			</form>

		</div>
	</div>