<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../static/css/request.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<div class="cart-table-area section-padding-100">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12 col-lg-8">
					<div class="checkout_details_area mt-50 clearfix">
						<div class="cart-title">
							<h2>개인 판매자 신청페이지</h2>
						</div>
						<form id="form" action="management.do" method="post">
						    <div class="row">
						        <div class="col-md-12 mb-3">
						            <input type="text" class="form-control name_info" name="name_info" id="name_info" value="" placeholder="이름" required="">
						        </div>
						        <div class="col-md-12 mb-3">
						            <input type="text" class="form-control title_info" name="title_info" id="title_info" placeholder="제목" value="">
						        </div>
						        <div class="col-md-12 mb-3">
						        	<p><textarea class="form-control content_info" name="content_info" id="content_info" placeholder="내용"  cols="50" rows="10"></textarea></p>
						        </div>
						        <div class="col-12 mb-3">
							        <div class="nice-select w-100" tabindex="0">
							        	<span class="current">템플릿 등록</span>
							        	<ul class="list">
							        		<li data-value="usa" class="option selected">템플릿 등록</li>
							        		<li data-value="uk" class="option">템플릿 수정</li>
							        		<li data-value="ger" class="option">템플릿 삭제</li>
							        		<li data-value="fra" class="option">강의 등록</li>
							        		<li data-value="ind" class="option">강의 수정</li>
							        		<li data-value="aus" class="option">강의 삭제</li>
							        	</ul>
							        </div>
						        </div>
						        <div class="cart-btn ml-3">
                                	<input type="submit" value="신청" class="btn amado-btn w-100">
                            	</div>
						    </div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="../../static/js/request.js"></script>
</body>
</html>