<%@page import="common.Goods" %>
<%@page import="common.PageDTO" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<style>
.center {
  text-align: center;
  width: 60%;
  margin: auto;
}

.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  /*border: 1px solid #ddd;*/
  /*margin: 0 4px;*/
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>
<body>
	<div class="container-fluid py-4">
		<div class="row">
			<div class="col-12">
				<div class="card my-4 dashboard">
					<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
						<div
							class="bg-gradient-user shadow-primary border-radius-lg pt-4 pb-3">
							<h6 class="text-white text-capitalize dashboard_title">상품 관리</h6>
						</div>
					</div>

					<div class="card-body px-0 pb-2">
						<div class="table-responsive p-0">
							<form action="modifyForm.do" method="post">
								<table class="table align-items-center mb-0">
									<thead>
										<tr>
											<th class="font-weight-bolder">상품번호</th>
											<th class="font-weight-bolder">제목</th>
											<th class="font-weight-bolder">내용</th>
											<th class="font-weight-bold">신청일자</th>
											<th></th>
											<th class="align-middle"><a href="requestForm.do" class="confirm_btn bg-gradient-danger mb-0 toast-btn">등록</a></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="goods" items="${list }">
										<tr>
											<td><c:out value="${goods.goodsId }" /></td>
											<td>${goods.name }</td>
											<td>${goods.description }</td>
											<td><fmt:formatDate value="${goods.reqDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
											<!-- <td><a href="#" onclick="modifyGoods()" class="badge badge-sm bg-gradient-success">수정</a></td> -->
											<td><a href="modifyForm.do?goodsId=${goods.goodsId }" class="badge badge-sm bg-gradient-success">수정</a></td>
											<td><a href="removeForm.do?goodsId=${goods.goodsId }" class="badge badge-sm bg-gradient-danger" >삭제</a></td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</form>
								<div class="center">
								    <div class="pagination">
									    <c:if test="${page.prev }">
									      <a href="management.do?page=${page.starPage - 1 }"> &laquo; </a>
									    </c:if>
									    <c:forEach begin="${page.starPage }" end="${page.endPage }" var="p">
									      <c:choose>
									        <c:when test="${p eq page.page }">
									          <a href="management.do?page=${p }" class="active">${p }</a>
									        </c:when>
									        <c:otherwise>
									          <a href="management.do?page=${p }">${p }</a>
									        </c:otherwise>
									      </c:choose>
									    </c:forEach>
									    <c:if test="${page.next }">
									      <a href="management.do?page=${page.endPage + 1 }"> &raquo; </a>
									    </c:if>
								    </div>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="../../static/js/management.js"></script>
	<script src="../../static/js/request.js"></script>
</body>
</html>