<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!DOCTYPE html>
<div class="cart-table-area section-padding-100">
	<div class="container-fluid">

		<div class="col-12 col-lg-8">
			<div class="checkout_details_area mt-50 clearfix">

				<div class="cart-title">
					<h2>회원가입</h2>
				</div>

				<form action="addMember.do" method="post" onsubmit="return add();">
					<div class="row">
						<div class="col-12 ml-15 mb-3" style="display: flex;">
							<input type="text" class="form-control" id="id" name="id"
								value="" placeholder="아이디" required autofocus>
						</div>
						<div class="col-12 ml-50 mb-3">
							<label id="sameId"></label>
                        </div>
						<div class="col-12 ml-15 mb-3">
							<input type="password" class="form-control" id="pw" name="pw"
								placeholder="비밀번호" value="" required>
						</div>

						<div class="col-12 ml-15 mb-3">
							<input type="password" class="form-control" id="pw1" name="pw1"
								placeholder="비밀번호 확인" value="" required>
						</div>

						<div class="col-12 ml-15 mb-3">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="이름" value="" required>
						</div>

						<div class="col-12 ml-15 mb-3">
							<input type="email" class="form-control" id="email" name="email"
								placeholder="이메일" value="" required>
						</div>
						<div class="col-12 ml-50 mb-3">
							<label id="sameEmail"></label>
                        </div>

						<div class="col-12 ml-15 mb-3">
							<input type="text" class="form-control" id="tel" name="tel"
								placeholder="전화번호" value="" required>
						</div>
						<div class="col-12 ml-50 mb-3">
							<label id="sameTel"></label>
                        </div>
					</div>
					<div class="col-12 ml-15 mb-3">
						<label><input type="radio" id="auth" name="auth"
							value="CLIENT" checked>일반고객</label> <label><input
							type="radio" id="auth" name="auth" value="SELLER">개인사업자</label>
					</div>

					<div class="cart-btn mt-100">
						<button type="submit" class="btn amado-btn w-20">완료</button>
					</div>

				</form>
			</div>


		</div>
	</div>
</div>
<script>
	function add() {
		
		let p1 = $('#pw').val();
		let p2 = $('#pw1').val();
		let sameId =$('#sameId').text()
		let sameEmail =$('#sameEmail').text()
		console.log(sameId);
		if (p1 != p2) {
			alert('비밀번호가 일치하지 않습니다')
		}else if($('#sameId:contains("이미")').length>0||$('#sameEmail:contains("이미")').length>0||
				 $('#sameTel:contains("이미")').length>0){
			alert('정보를 올바르게 기입하세요')
			return false;
		} else {
			return true;
		}
	}

	//아이디 중복확인
	$("#id").on("focusout", function() {
	    let id = $("#id").val();
	    
	    if (id == '' || id.length == 0) {
	        $("#sameId").css('color', 'red').text("ID를 입력해주세요");
	        return false;
	    }
	    
	    $.ajax({
	        url: 'sameId.do',
	        method: 'post',
	        data: {id: id}, 
	        success: function(result) {
	        	console.log(result);
	            if (result > 0) {
	                $("#sameId").css('color', 'red').text("이미 사용 중인 ID입니다");
	            } else {
	                $("#sameId").css('color', 'green').text("사용 가능한 ID입니다");
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error(error);
	        }
	    });
	});
	//이메일 중복확인
	$("#email").on("focusout", function() {
	    let email = $("#email").val();
	    
	    if (email == '' || email.length == 0) {
	        $("#sameEmail").css('color', 'red').text("이메일을 입력해주세요");
	        return false;
	    }
	    
	    $.ajax({
	        url: 'sameEmail.do',
	        method: 'post',
	        data: {email: email}, 
	        success: function(result) {
	        	console.log(result);
	            if (result > 0) {
	                $("#sameEmail").css('color', 'red').text("이미 가입한 정보가 있습니다");
	            } else {
	                $("#sameEmail").css('color', 'green').text("사용 가능한 이메일 입니다");
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error(error);
	        }
	    });
	});
	//전화번호 중복 확인
	$("#tel").on("focusout", function() {
	    let tel = $("#tel").val();
	    
	    if (tel == '' || tel.length == 0) {
	        $("#sameTel").css('color', 'red').text("전화번호를 입력해주세요");
	        return false;
	    }
	    
	    $.ajax({
	        url: 'sameTel.do',
	        method: 'post',
	        data: {tel: tel}, 
	        success: function(result) {
	        	console.log(result);
	            if (result > 0) {
	                $("#sameTel").css('color', 'red').text("이미 가입한 정보가 있습니다");
	            } else {
	                $("#sameTel").css('color', 'green').text("사용 가능한 번호 입니다");
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error(error);
	        }
	    });
	});

	
	
</script>