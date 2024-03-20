<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../static/css/request.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<script>
		
	</script>
	<div class="cart-table-area section-padding-100">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12 col-lg-8">
					<div class="checkout_details_area mt-50 clearfix">
						<div class="cart-title">
							<h2>개인 판매자 신청페이지</h2>
						</div>
						<!-- <form id="form" action="management.do" method="post" enctype="multipart/form-data"> -->
						<form action="request.do" method="post">
						    <div class="row">
						        <div class="col-md-12 mb-3">
						            <input type="text" class="form-control title_info" name="title_info" id="title_info" placeholder="${name }" value="">
						        </div>
						        
						        <div>
							        <p>이미지 업로드</p>
								    <input class="col-md-12" type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)">
						        </div>
						        
							    <div class="fileInput col-md-12">
				                    <p>파일이름: </p>
				                    <p id="fileName"></p>
				                </div>
							    <div class="col-md-12 mb-3">
							    	<div class="image-show" id="image-show"></div>
							    </div>
						        <div class="col-md-12 mb-3">
						        	<p><textarea class="form-control content_info" name="content_info" id="content_info" placeholder="${description }"  cols="50" rows="10"></textarea></p>
						        </div>
						        <div class="col-12 mb-3">
	                                <select class="w-100" id="country" name="type_info">
	                                    <option value="템플릿 등록">템플릿 등록</option>
	                                    <option value="템플릿 수정">템플릿 수정</option>
	                                    <option value="템플릿 삭제">템플릿 삭제</option>
	                                    <option value="강의 등록">강의 등록</option>
	                                    <option value="강의 수정">강의 수정</option>
	                                    <option value="강의 삭제">강의 삭제</option>
	                                </select>
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
	<script>
		/* $("#submitButton").click(function() {
			$("#form").attr("action", "management.do");
			$("#form").submit();
		}); */
	</script>
</body>
</html>