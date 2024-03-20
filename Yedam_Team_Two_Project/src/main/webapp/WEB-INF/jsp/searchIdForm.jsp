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
			<h1>아이디조회</h1>
			<!-- 아이디, 비번, 버튼 박스 -->
			<form action="" method="post">
				<div id="inputBox">
					<c:if test="${!empty message }">
						<p style="color: red;">${message }</p>
					</c:if>
					<div class="input-form-box">
						<span>이름 </span><input type="text" name="name"
							class="form-control">
					</div>
					<div class="input-form-box">
						<span>이메일 </span><input type="email" name="email"
							class="form-control">
					</div>


					<div class="button-login-box">
						<label class="findId"></label>
						<button type="button" class="btn btn-warning" style="width: 100%"
							id="searchBtn">ID 조회</button>
					</div>
					<div class="button-login-box">
						<a href="loginForm.do" class="btn btn-primary" style="width: 100%">로그인</a>
					</div>
					<div class="button-login-box">
						<a href="searchPwForm.do" class="btn btn-primary"
							style="width: 100%">비밀번호찾기</a>
					</div>
				</div>
			</form>

		</div>
	</div>

	<!-- Bootstrap Bundle with Popper -->
	<script>
    $('#searchBtn').click (function(){
    	let name = $('input[name="name"]').val();
        let email = $('input[name="email"]').val();
    	$.ajax({
    		url:'seachIdControl.do',
    		method:'post',
    		data:{
    			name: name,
    			email: email
    		},
    		success:function(result){
    			console.log(result)
    		    if(result.length === 0){
        			$('.findId').css('color','black').text("조회할 아이디가 없습니다.");
    		    }
    		    else{ 
    			    result.forEach(prop =>{
    		        console.log(prop.memberId);
    		    	$('.findId').css('color','black').text("아이디: "+ prop.memberId);
    			   })
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
