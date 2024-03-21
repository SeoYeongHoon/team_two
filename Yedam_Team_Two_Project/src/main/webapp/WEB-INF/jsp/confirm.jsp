<%@page import="common.Goods" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../static/css/admin.css">
<link href="//cdn.datatables.net/2.0.2/css/dataTables.dataTables.min.css" rel="stylesheet" />
<script src="//cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="" style="margin-top: 100px; width: 600px;">
		<div class="row">
			<div class="col-12">
				<div class="card my-4 dashboard">
					<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
						<div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
							<h6 class="text-white text-capitalize dashboard_title">승인이 완료되었습니다.</h6>
						</div>
						<div style="margin-top: 50px; text-align: center; font-size: 12pt;"><a href="admin.do">어드민페이지로 돌아가기</a></div>
            		</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>