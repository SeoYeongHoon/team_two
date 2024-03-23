<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="common.Member"%>

<%
	Member member = (Member) request.getAttribute("common.Member");
%>

<div class="">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="checkout_details_area mt-50 clearfix">

					<div class="cart-title">
						<h2>마이페이지</h2>
					</div>

					<form action="editForm.do" method="post">
						<div class="row">
							<div class="col-md-6 mb-3">
								<p style="margin-bottom: -4px; color:black; font-weight: bold">이름</p>
								<input type="text" class="form-control" id="name" name="name"
									value="${logName }" disabled>
							</div>
							<div class="col-md-6 mb-3">
								<p style="margin-bottom: -4px; color:black; font-weight: bold;">아이디</p>
								<input type="text" class="form-control" id="memberId" name="memberId"
									value="${logid }" disabled>
							</div>
							<div class="col-12 mb-3">
								<p style="margin-bottom: -4px; color:black; font-weight: bold;">고객유형</p>
								<input type="text" class="form-control" id="memberType" name="memberType"
									value="${logMemberType }" disabled>
							</div>
							<div class="col-12 mb-3">
								<p style="margin-bottom: -4px; color:black; font-weight: bold;">이메일</p>
								<input type="text" class="form-control" id="email"
									value="${logEmail }" disabled>
							</div>
							<div class="col-md-6 mb-3">
								<p style="margin-bottom: -4px; color:black; font-weight: bold;">전화번호</p>
								<input type="text" class="form-control" id="phone_number"
									value="${logTel }" disabled>
							</div>
						</div>
						<div class="cart-btn" id="editBtn" style="margin-top: 28px; width: 200px;">
							<a href="checkPass.do" class="btn amado-btn w-100">정보 수정</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ##### Main Content Wrapper End ##### -->
<script>
    /* document.getElementById("editBtn").addEventListener("click", function() {
        var xhr = new XMLHttpRequest(); // XMLHttpRequest 객체 생성

        // 요청을 보낼 URL 설정, ☆★☆★☆★잘못 작성했을 가능성 높음, 재확인 필수☆★☆★☆★
        var url = "/mypageEdit.do"; 

        // 요청할 데이터를 JSON 형식으로 설정
        var params = JSON.stringify({
            userId: document.getElementById("userId").value,
            memeberType: document.getElementById("memberType").value,
            name: document.getElementById("name").value,
            password: document.getElementById("password").value,
            email: document.getElementById("email").value
            tel: document.getElementById("tel").value
        });

        xhr.open("POST", url, true);
        
        xhr.setRequestHeader("Content-Type", "application/json");

        // 요청 완료 시 실행될 콜백 함수
        xhr.onload = function() {
            if (xhr.status >= 200 && xhr.status < 300) {
                var res = JSON.parse(xhr.responseText);
                alert(res.code);
            } else {
                alert("오류가 발생했습니다.");
            }
        };
        xhr.onerror = function() {
            alert("오류가 발생했습니다.");
        };

        xhr.send(params);
    }); */
</script>