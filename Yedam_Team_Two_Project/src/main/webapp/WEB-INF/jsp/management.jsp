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
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../static/css/admin.css">
<link href="//cdn.datatables.net/2.0.2/css/dataTables.dataTables.min.css" rel="stylesheet" />
<script src="//cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
</head>
<body>
	<script>
		/* $.get('../manageForm.do', (result) => {
			result.forEach((item, idx, ary) => {
				
			});
			
			$(result).each((idx, item, ary) => {
				$('<tr />').append(
					$('<td />').text(item.goodsId).append($('<input name="goodsId" />')),
					$('<td />').text(item.name),
					$('<td />').text(item.description),
					$('<td />').text(item.reqDate),
					$('<td class="align-middle text-center" />')
						// .append($('<a href="#" onclick="modifyGoods()" class="badge badge-sm bg-gradient-success" />').text('수정')),
						.append($('<button type="submit" class="badge badge-sm bg-gradient-success" />').text('수정')),
					$('<td class="align-middle" />')
						.append($('<a href="#" onclick="removeGoods()" class="badge badge-sm bg-gradient-danger" />').text('삭제'))
				).appendTo($('table'));
			})
		}) */
	</script>
		<%-- <input type="hidden" value="${goods.goodsId }" name="goodsId"> --%>
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
											<td><input type="hidden" name="goodsId"><c:out value="${goods.goodsId }" /></td>
											<td><input type="hidden" name="name">${goods.name }</td>
											<td><input type="hidden" name="description">${goods.description }</td>
											<td><input type="hidden" name="reqDate"><fmt:formatDate value="${goods.reqDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
											<!-- <td><a href="#" onclick="modifyGoods()" class="badge badge-sm bg-gradient-success">수정</a></td> -->
											<td><button type="submit" class="badge badge-sm bg-gradient-success">수정</button></td>
											<td><a href="#" onclick="removeGoods()" class="badge badge-sm bg-gradient-danger" >삭제</a></td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="../../static/js/management.js"></script>
	<script src="../../static/js/request.js"></script>
	<script>
		/* function modifyGoods() {
			let form = document.querySelector('form');
			console.log(form.action);
			form.action = 'modifyGoods.do';
			form.submit();
		} */
	
		function removeGoods() {
			let form = document.querySelector('form');
			console.log(form.action);
			form.action = 'removeForm.do';
			form.submit();
		}
	</script>
</body>
</html>