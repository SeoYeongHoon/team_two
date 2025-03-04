<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>
<%@page import="common.Member"%>

<%
	Member member = (Member) request.getAttribute("common.Member");
%>

    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<body>

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

        <div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-title">
                                <h2>마이페이지</h2>
                            </div>

                            <form action="#" method="post">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <input type="text" class="form-control" id="first_name" value="" placeholder="고객이름" required>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <input type="text" class="form-control" id="last_name" value="" placeholder="고객ID" required>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control" id="company" placeholder="고객 유형을 선택하세요." value="" readonly>                              
                                        <select class="w-100" id="country">
                                        <option value="usa">Client</option>
                                        <option value="uk">Seller</option>
                                        <option value="ger">Manager</option>
                                        </select>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="email" class="form-control" id="email" placeholder="Email" value="">
                                    </div>
                                    <!-- <div class="col-12 mb-3">
                                        <select class="w-100" id="country">
                                        <option value="usa">United States</option>
                                        <option value="uk">United Kingdom</option>
                                        <option value="ger">Germany</option>
                                        <option value="fra">France</option>
                                        <option value="ind">India</option>
                                        <option value="aus">Australia</option>
                                        <option value="bra">Brazil</option>
                                        <option value="cana">Canada</option>
                                    </select>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control mb-3" id="street_address" placeholder="Address" value="">
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control" id="city" placeholder="Town" value="">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <input type="text" class="form-control" id="zipCode" placeholder="Zip Code" value="">
                                    </div> -->
                                    <div class="col-md-6 mb-3">
                                        <input type="number" class="form-control" id="phone_number" min="0" placeholder="전화번호" value="">
                                    </div>
									<div class="cart-btn mt-100">
                                		<a href="#" class="btn amado-btn w-100">저장</a>
                            		</div>
                            		<div class="cart-btn mt-100">
                                		<a href="#" class="btn amado-btn w-100">초기화</a>
                            		</div>
                                    <!-- <div class="col-12">
                                    <div class="col-12 mb-3">
                                        <textarea name="comment" class="form-control w-100" id="comment" cols="30" rows="10" placeholder="Leave a comment about your order"></textarea>
                                    </div>
                                        <div class="custom-control custom-checkbox d-block mb-2">
                                            <input type="checkbox" class="custom-control-input" id="customCheck2">
                                            <label class="custom-control-label" for="customCheck2">Create an accout</label>
                                        </div>
                                        <div class="custom-control custom-checkbox d-block">
                                            <input type="checkbox" class="custom-control-input" id="customCheck3">
                                            <label class="custom-control-label" for="customCheck3">Ship to a different address</label>
                                        </div>
                                    </div> -->
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary">
                            <h5>내 활동내역</h5>
                            <ul class="summary-table">
                                <li><span>관심 상품</span> <span>관심상품 DB에서 이름과 이미지 작게 가져오기</span></li>
                                <li><span>구매 히스토리</span> <span>이부분, DB가 하나 더 필요할 것 같음. 구현방법에 관해 팀원들과 상의해 보기</span></li>
                            </ul>

                            <!-- <div class="payment-method">
                                <div class="custom-control custom-checkbox mr-sm-2">
                                    <input type="checkbox" class="custom-control-input" id="cod" checked>
                                    <label class="custom-control-label" for="cod">Cash on Delivery</label>
                                </div>
                                <div class="custom-control custom-checkbox mr-sm-2">
                                    <input type="checkbox" class="custom-control-input" id="paypal">
                                    <label class="custom-control-label" for="paypal">Paypal <img class="ml-15" src="img/core-img/paypal.png" alt=""></label>
                                </div> -->
                            </div>

                            <div class="cart-btn mt-100">
                                <a href="#" class="btn amado-btn w-100">장바구니</a>
                            </div>
                            <div class="cart-btn mt-100">
                                <a href="#" class="btn amado-btn w-100">내 상품 관리 페이지 (only for Seller)</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
    <!-- ##### Main Content Wrapper End ##### -->

    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>

