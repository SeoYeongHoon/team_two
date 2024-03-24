<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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
			<h1>비밀번호 조회</h1>
			<!-- 아이디, 비번, 버튼 박스 -->
			<form action="" method="post">
				<div id="inputBox">
					<c:if test="${!empty message }">
						<p style="color: red;">${message }</p>
					</c:if>
					<div class="input-form-box">
						<span>아이디 </span><input type="text" name="id" class="form-control">
					</div>
					<div class="input-form-box">
						<span>이메일 </span><input type="text" name="email"
							class="form-control">
					</div>

					<div class="button-login-box">
						<label class="findId"></label>
						<button type="button" class="btn btn-warning" style="width: 100%"
							id="searchBtn">비밀번호 조회</button>
					</div>
					<div class="button-login-box">
						<a href="loginForm.do" class="btn btn-primary" style="width: 100%">로그인</a>
					</div>
					<div class="button-login-box">
						<a href="main.do" class="btn btn-primary" style="width: 100%">메인페이지</a>
					</div>
				</div>
			</form>

		</div>
	</div>

	<!-- Bootstrap Bundle with Popper -->
	<script>
	 $('#searchBtn').click (function(){
	    	let id = $('input[name="id"]').val();
	        let email = $('input[name="email"]').val();
	    	$.ajax({
	    		url:'seachPwControl.do',
	    		method:'post',
	    		data:{
	    			id: id,
	    			email: email
	    		},
	    		success:function(result){
	    			 console.log(result.retCode)
	    		    
	    		    if(result.retCode =='OK'){ 
	    		    	$('.findId').css('color','black').text("이메일에 해당 임시비밀번호를 전송했습니다");
	    		    }else if(result.retCode =='NG'){
		        	    $('.findId').css('color','red').text("정보를 조회할 수 없습니다");
		    		}
	    		},
	    		error: function(xhr, status, error) {
		            console.error(error);
		        }
	    	})
	    })
	</script>

</body>
</html>
