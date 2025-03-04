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
	<div class="cart-table-area" style="padding-bottom: 20px">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12 col-lg-8">
					<div class="checkout_details_area clearfix">
						<div class="cart-title">
							<h2>개인 판매자 신청페이지</h2>
						</div>
						<form action="request.do" method="post" enctype="multipart/form-data">
						    <div class="row">
						    	<input type="hidden" name="memberId" value="${logid }">
						        <div class="col-md-12 mb-3">
						            <input type="text" class="form-control title_info" name="title_info" id="title_info" placeholder="상품 이름" required>
						        </div>
						        
						        <div class="col-md-12">
							        <p>이미지 업로드</p>
								    <input type="file" id="chooseFile" name="image" onchange="loadFile(this)" required>
						        </div>
							    <div class="fileInput col-md-12">
				                    <p>파일이름: </p>
				                    <p id="fileName"></p>
				                </div>
							    <div class="col-md-12 mb-3">
							    	<div class="image-show" id="image-show"></div>
							    </div>
							    
						        <div class="col-md-12 mb-3">
						        	<p><textarea class="form-control content_info" name="content_info" id="content_info" placeholder="내용"  cols="50" rows="10" required></textarea></p>
						        </div>
	                            <div class="col-md-12 mb-3">
	                            	<input type="number" class="form-control" name="price" placeholder="가격" required>
	                            </div>
						        <div class="cart-btn ml-3">
                                	<input id="submitButton" type="submit" value="신청" class="btn amado-btn w-100">
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