<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>

<!-- Bootstrap CSS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<!-- 나의 스타일 추가 -->
<link rel="stylesheet" href="../../static/css/login.css">

</head>
<body class="text-center">

	<!--  html 전체 영역을 지정하는 container -->
	<div id="container">
		<!--  login 폼 영역을 : loginBox -->
		<div id="check"></div>
		<div id="loginBox">

			<!-- 로그인 페이지 타이틀 -->
			<div id="loginBoxTitle">Amado Login</div>
			<!-- 아이디, 비번, 버튼 박스 -->
			<form action="login.do" method="post">
				<div id="inputBox">
					<c:if test="${!empty message }">
						<p style="color: red;">${message }</p>
					</c:if>
					<div class="input-form-box">
						<span>아이디 </span><input type="text" name="id" class="form-control">
					</div>
					<div class="input-form-box">
						<span>비밀번호 </span><input type="password" name="pw"
							class="form-control">
					</div>

					<div class="button-login-box">
						<button type="submit" class="btn btn-primary btn-warning"
							style="width: 100%">로그인</button>
					</div>
					  <c:if test="${!empty message }">
					  <div class="button-login-box">
                              <button type="button" class="btn btn-primary btn-primary"
							style="width: 100%" id="searchId">아이디찾기</button>
					</div>
					<div class="button-login-box">
							<button type="button" class="btn btn-primary btn-primary"
							style="width: 100%" id="searchPw">비밀번호찾기</button>
					</div>
					  </c:if>
				</div>
			</form>

		</div>
	</div>

	<!-- Bootstrap Bundle with Popper -->
	<script>

	$('#searchId').click (function() {
		window.location = "searchIdForm.do";
	})
	$('#searchPw').click (function() {
		window.location = "searchPwForm.do";
	})
	</script>

</body>
</html>
