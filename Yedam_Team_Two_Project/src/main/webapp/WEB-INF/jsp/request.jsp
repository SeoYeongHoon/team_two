<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../static/css/request.css">
</head>
<body>
	
	<div class="cart-table-area section-padding-100">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12 col-lg-8">
					<div class="checkout_details_area mt-50 clearfix">
						<div class="cart-title">
							<h2>타이틀</h2>
						</div>
						<form action="#" method="post">
						    <div class="row">
						        <div class="col-md-12 mb-3">
						            <input type="text" class="form-control name_info" id="name_info" value="" placeholder="이름" required="">
						        </div>
						        <div class="col-md-12 mb-3">
						            <input type="text" class="form-control title_info" id="title_info" placeholder="제목" value="">
						        </div>
						        <div class="col-md-12 mb-3">
						        	<p><textarea class="form-control content_info" id="content_info" placeholder="내용"  cols="50" rows="10"></textarea></p>
						        </div>
						        <div class="col-12 mb-3">
						            <select class="w-100" id="country" style="display: none;">
						            <option>템플릿 등록</option>
						            <option>템플릿 수정</option>
						            <option>템플릿 삭제</option>
						            <option>강의 등록</option>
						            <option>강의 수정</option>
						            <option>강의 삭제</option>
						        </select><div class="nice-select w-100" tabindex="0"><span class="current">United States</span><ul class="list"><li data-value="usa" class="option selected">United States</li><li data-value="uk" class="option">United Kingdom</li><li data-value="ger" class="option">Germany</li><li data-value="fra" class="option">France</li><li data-value="ind" class="option">India</li><li data-value="aus" class="option">Australia</li><li data-value="bra" class="option">Brazil</li><li data-value="cana" class="option">Canada</li></ul></div>
						        </div>
						        <div class="col-12">
						            <div class="custom-control custom-checkbox d-block mb-2">
						                <input type="checkbox" class="custom-control-input" id="customCheck2">
						                <label class="custom-control-label" for="customCheck2">Create an accout</label>
						            </div>
						            <div class="custom-control custom-checkbox d-block">
						                <input type="checkbox" class="custom-control-input" id="customCheck3">
						                <label class="custom-control-label" for="customCheck3">Ship to a different address</label>
						            </div>
						        </div>
						    </div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>