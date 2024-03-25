<%@page import="common.Goods"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../static/css/admin.css">
<link
	href="//cdn.datatables.net/2.0.2/css/dataTables.dataTables.min.css"
	rel="stylesheet" />
<script src="//cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
</head>
<body>
	<%
	Goods goods = (Goods) request.getAttribute("goods");
	%>
	<div class="" style="margin-top: 100px; max-width: 100%;">
		<div class="row">
			<div class="col-12">
				<h3>컨텐츠 수정</h3>
				<form action="modifyGoods.do">
					<input type="hidden" value="<%=goods.getGoodsId() %>" name="goodsId">
					<table class="table">
						<tr>
							<th>글번호</th>
							<td><%=goods.getGoodsId()%></td>
						</tr>
						<tr>
							<th>글제목</th>
							<td colspan="3"><input class="form-control" type="text"
								name="title" value="<%=goods.getName()%>"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3"><textarea class="form-control" name="content" cols="50" rows="10"><%=goods.getDescription()%></textarea></td>
						</tr>
						<tr>
							<th>이미지</th>
							<td colspan="3">
								<img style="max-width: 300px; height: 50%;" src="../../static/img/bg-img/<%=goods.getImage() %>">
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<input class="col-md-12" type="file" id="chooseFile" name="chooseFile">
							</td>
						</tr>
						<tr>
							<th>가격</th>
							<td colspan="3">
								<input class="form-control" type="number" name="price" value="<%=goods.getPrice() %>">
							</td>
						</tr>
						<tr>
							<th>작성자</th><td><%=goods.getMemberId() %></td>
							<th>작성일자</th><td><%=goods.getReqDate() %></td>
						</tr>
						<tr>
							<td colspan="4" align="center">
								<button type="submit" class="btn btn-primary">저장</button>
								<a href="management.do" class="btn btn-secondary">취소</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script src="../../static/js/request.js"></script>
</body>
</html>