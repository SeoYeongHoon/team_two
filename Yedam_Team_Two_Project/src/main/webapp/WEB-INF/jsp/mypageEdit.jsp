<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="common.Member"%>

<%
	Member member = (Member) request.getAttribute("common.Member");
%>

<div class="">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 col-lg-8">
				<div class="checkout_details_area mt-50 clearfix">

					<div class="cart-title">
						<h2>회원정보 변경</h2>
					</div>

					<form action="editConfirm.do" method="post" id="">
						<div class="row">
							<input type="hidden" name="memberId" value="${logid }">
							<div class="col-md-6 mb-3">
								<p style="margin-bottom: -4px; color:black; font-weight: bold">이름</p>
								<input type="text" class="form-control" id="name" name="name"
									value="${logName }" >
							</div>
							<div class="col-md-6 mb-3">
								<p style="margin-bottom: -4px; color:black; font-weight: bold">비밀번호</p>
								<input type="password" class="form-control" id="password" name="password"
									value="${logPw }" >
							</div>
							<div class="col-12 mb-3">
								<p style="margin-bottom: -4px; color:black; font-weight: bold;">이메일</p>
								<input type="text" class="form-control" id="email" name="email"
									value="${logEmail }" >
							</div>
							<div class="col-md-6 mb-3">
								<p style="margin-bottom: -4px; color:black; font-weight: bold;">전화번호</p>
								<input type="text" class="form-control" id="phone_number" name="phone"
									value="${logTel }" >
							</div>
						</div>
						<div class="cart-btn" id="editBtn" style="margin-top: 28px; width: 200px;">
							<button type="submit" id="submitBtn" class="btn amado-btn w-100">수정하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>