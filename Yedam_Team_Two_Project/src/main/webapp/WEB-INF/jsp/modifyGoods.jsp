<%@page import="common.Goods" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%
Goods goods = (Goods) request.getAttribute("goods");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../static/css/admin.css">
<link href="//cdn.datatables.net/2.0.2/css/dataTables.dataTables.min.css" rel="stylesheet" />
<script src="//cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
</head>
<body>
<%-- <form action="modifyGoods.do">
	<input type="hidden" value="<%=goods.getGoodsId() %>" name="goodsId">
	<table class="table">
		<tr>
			<th>글번호</th>
			<td><%=goods.getGoodsId() %></td>
		</tr>
		<tr>
			<th>글제목</th>
			<td colspan="3"><input class="form-control" type="text"
				name="title" value="<%=goods.getName() %>"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3"><textarea class="form-control" name="content"><%=goods.getDescription() %></textarea></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<button type="submit" class="btn btn-primary"
					${board.writer eq logid ? '' : 'disabled' }>저장</button>
				<button type="reset" class="btn btn-secondary"
					${board.writer eq logid ? '' : 'disabled' }>취소</button>
			</td>
		</tr>
	</table>
</form> --%>
<%
Goods goods = (Goods) request.getAttribute("goods");
%>
	<div class="container-fluid py-4">
		<div class="row">
			<div class="col-12">
				<table class="table">
					<tr>
						<th>글번호</th>
						<td></td>
					</tr>
					<tr>
						<th>글제목</th>
						<td colspan="3"><input class="form-control" type="text"
							name="title" value=""></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><textarea class="form-control" name="content"></textarea></td>
					</tr>
					<tr>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>