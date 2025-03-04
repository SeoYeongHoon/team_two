<%@page import="common.Goods"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../static/css/admin.css">
<link
	href="//cdn.datatables.net/2.0.2/css/dataTables.dataTables.min.css"
	rel="stylesheet" />
<script src="//cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
<%
Goods goods = (Goods) request.getAttribute("goods");
%>
<div class="" style="margin-top: 100px; min-width: 600px;">
	<div class="row">
		<div class="col-12">
			<h3>컨텐츠 삭제</h3>
			<form action="removeGoods.do">
				<input type="hidden" value="<%=goods.getGoodsId()%>" name="goodsId">
				<table class="table">
					<tr>
						<th>글번호</th>
						<td><%=goods.getGoodsId()%></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><%=goods.getName()%></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><%=goods.getDescription()%></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button type="submit" class="btn btn-danger">삭제</button>
							<button type="reset" class="btn btn-secondary">취소</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>