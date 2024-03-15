<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="cart-table-area section-padding-100">
	<div class="container-fluid">

		<div class="col-12 col-lg-8">
			<div class="checkout_details_area mt-50 clearfix">

				<div class="cart-title">
					<h2>회원가입</h2>
				</div>

				<form action="addMember.do" method="post">
					<div class="row">
						<div class="col-12 ml-15 mb-3">
							<input type="text" class="form-control" id="id" value=""
								placeholder="아이디" required>
						</div>

						<div class="col-12 ml-15 mb-3">
							<input type="password" class="form-control" id="pw"
								placeholder="비밀번호" value="" required>
						</div>
						<div class="col-12 ml-15 mb-3">
							<input type="password" class="form-control" id="pw"
								placeholder="비밀번호 확인" value="" required>
						</div>
						<div class="col-12 ml-15 mb-3">
							<input type="text" class="form-control" id="name"
								placeholder="이름" value="" required>
						</div>

						<div class="col-12 ml-15 mb-3">
							<input type="email" class="form-control" id="email"
								placeholder="이메일" value="" required>
						</div>

						<div class="col-12 ml-15 mb-3">
							<input type="text" class="form-control" id="tel"
								placeholder="전화번호" value="" required>
						</div>
					</div>
					<div class="col-12 ml-15 mb-3">
						<label><input type="radio" name="auth" value="CLIENT"
							checked>일반고객</label> <label><input type="radio"
							name="auth" value="SELLER">개인사업자</label>
					</div>

					<div class="cart-btn mt-100">
						<button type="submit" class="btn amado-btn w-20">완료</button>
					</div>

				</form>
			</div>


		</div>
	</div>
</div>