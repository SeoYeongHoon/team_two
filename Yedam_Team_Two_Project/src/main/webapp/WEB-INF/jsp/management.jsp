<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../static/css/admin.css">
</head>
<body>
	<%
		String name = request.getParameter("name_info");
	%>
	<h1><%=name %></h1>
	<div class="container-fluid py-4">
		<div class="row">
			<div class="col-12">
				<div class="card my-4 dashboard">
					<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
						<div class="bg-gradient-user shadow-primary border-radius-lg pt-4 pb-3">
							<h6 class="text-white text-capitalize dashboard_title">상품 관리</h6>
						</div>
            		</div>

					<div class="card-body px-0 pb-2">
						<div class="table-responsive p-0">
							<table class="table align-items-center mb-0">
								<thead>
									<tr>
										<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">이미지</th>
										<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">제목</th>
										<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">작성일자</th>
										<th></th>
										<th class="align-middle">
											<a href="request.do" class="confirm_btn bg-gradient-danger mb-0 toast-btn">등록</a>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<div>
												<img src="../../static/img/user/dog.jpg" class="avatar avatar-sm me-3 border-radius-lg" alt="user1">
											</div>
										</td>
										<td class="align-middle">
											<span class="text-secondary text-xs font-weight-bold">서영훈의 템플릿</span>
										</td>
										<td class="align-middle text-center">
											<span class="text-secondary text-xs font-weight-bold">23/04/18</span>
										</td>
										<td class="align-middle text-center">
											<a href="#" class="badge badge-sm bg-gradient-success">수정</a>
										</td>
										<td class="align-middle">
											<a href="#" class="badge badge-sm bg-gradient-danger">삭제</a>
										</td>
									</tr>
									<tr>
										<td>
											<div>
												<img src="../../static/img/user/dog.jpg" class="avatar avatar-sm me-3 border-radius-lg" alt="user1">
											</div>
										</td>
										<td class="align-middle">
											<span class="text-secondary text-xs font-weight-bold">서영훈의 템플릿</span>
										</td>
										<td class="align-middle text-center">
											<span class="text-secondary text-xs font-weight-bold">11/01/19</span>
										</td>
										<td class="align-middle text-center">
											<a href="#" class="badge badge-sm bg-gradient-success">수정</a>
										</td>
										<td class="align-middle">
											<a href="#" class="badge badge-sm bg-gradient-danger">삭제</a>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="../../static/js/management.js"></script>
</body>
</html>