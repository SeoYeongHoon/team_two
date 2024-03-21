<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<body>
    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
            <div class="amado-navbar-brand">
                <a href="index.html"><img src="img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Navbar Toggler -->
            <div class="amado-navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>

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
                                        <input type="text" class="form-control" id="name" value="${loginMember.name}" placeholder="고객이름" required>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <input type="text" class="form-control" id="memberId" value="${loginMember.id}" placeholder="고객ID" required>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control" id="memberType" placeholder="고객 유형" value="${loginMember.MemberType}" readonly>                              
                                        <!-- 이 select의 기본값은 세션에서 받아온 고객의 정보에서 받아와야 한다. 파라미터? -->
                                        <select class="w-100" id="country">
                                        <option value="Client">Client</option>
                                        <option value="Seller">Seller</option>
                                        <option value="Manager">Manager</option>
                                        </select>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="email" class="form-control" id="email" placeholder="Email" value="${loginMember.email}">
                                    </div>                                    
                                    <div class="col-md-6 mb-3">
                                        <input type="number" class="form-control" id="phone_number" min="0" placeholder="전화번호" value="">
                                    </div>
									<div class="cart-btn mt-100" id="editBtn">
                                		<a href="#" class="btn amado-btn w-100">저장</a>
                            		</div>
                            		<div class="cart-btn mt-100">
                                		<a href="#" class="btn amado-btn w-100">초기화</a>
                            		</div>
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
                            </div>

                            <div class="cart-btn mt-100">
                                <a href="/cart.do" class="btn amado-btn w-100">장바구니(내상품 관리 페이지는 로그인시 아래에 나옴)</a>
                            </div>    
							<div class="cart-btn mt-100" id="cartBtnDiv">
							        <a href="#" class="btn amado-btn w-100">내 상품 관리 페이지 (only for Seller)</a>
							</div>
						                  
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>
    <!-- ##### Main Content Wrapper End ##### -->
	<script>
    document.getElementById("editBtn").addEventListener("click", function() {
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
    });
</script>
	
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