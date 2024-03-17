<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../static/css/admin.css">
<title>Insert title here</title>
</head>
<body>
	<%-- <div id="container">
		<div class="dashboard">
			<div class="header_title">
				<h5 class="header_text">고객 요청 관리</h5>
			</div>
			<table class="board_table">
				<thead>
					<tr>
                      <th class="category text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">이름</th>
                      <th class="category text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">유형</th>
                      <th class="category text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">상태</th>
                      <th class="category text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">요청시간</th>
                      <th class="category text-secondary opacity-7">버튼</th>
                    </tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div class="d-flex px-2 py-1">
								<div>
									<img class="user_img" src="../../static/img/user/dog.jpg">
								</div>
								<div class="d-flex flex-column justify-content-center">
									<h5 class="mb-0 text-sm">서영훈</h5>
									<p class="text-xs text-secondary mb-0">tjdudgns96@google.com</p>
								</div>
							</div>
						</td>
						<td>
							<div class="d-flex px-2 py-1">고객 이름</div>
						</td>
						<td>
							<div class="d-flex px-2 py-1">고객 이름</div>
						</td>
						<td>
							<div class="d-flex px-2 py-1">고객 이름</div>
						</td>
						<td>
							<a href="#" class="confirm_btn btn bg-gradient-danger w-100 mb-0 toast-btn">확인하기</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div> --%>
	<div class="container-fluid py-4">
		<div class="row">
			<div class="col-12">
				<div class="card my-4 dashboard">
					<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
						<div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
							<h6 class="text-white text-capitalize dashboard_title">DashBoard</h6>
						</div>
            		</div>

					<div class="card-body px-0 pb-2">
						<div class="table-responsive p-0">
							<table class="table align-items-center mb-0">
								<thead>
									<tr>
									<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">고객정보</th>
									<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">이미지</th>
									<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">유형</th>
									<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">상태</th>
									<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">신청일자</th>
									<th class="text-secondary opacity-7">확인하기</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<div class="d-flex px-2 py-1">
												<div class="d-flex flex-column justify-content-center">
													<h6 class="mb-0 text-sm">홍길동</h6>
													<p class="text-xs text-secondary mb-0">hong@creative-tim.com</p>
												</div>
											</div>
										</td>
										<td>
											<div>
												<img src="../../static/img/user/dog.jpg" class="avatar avatar-sm me-3 border-radius-lg" alt="user1">
											</div>
										</td>
										<td class="req-type">
											<p class="req-type text-xs font-weight-bold mb-0">템플릿 등록</p>
											<%-- <p class="text-xs text-secondary mb-0">Organization</p> --%>
										</td>
										<td class="align-middle text-center text-sm">
											<span class="badge badge-sm bg-gradient-success">완료</span>
										</td>
										<td class="align-middle text-center">
											<span class="text-secondary text-xs font-weight-bold">23/04/18</span>
										</td>
										<td class="align-middle">
											<%-- <a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
											Edit
											</a> --%>
											<a href="#" class="confirm_btn bg-gradient-danger mb-0 toast-btn">확인</a>
										</td>
									</tr>
									<tr>
										<td>
											<div class="d-flex px-2 py-1">
												<div class="d-flex flex-column justify-content-center">
													<h6 class="mb-0 text-sm">김길동</h6>
													<p class="text-xs text-secondary mb-0">kim@creative-tim.com</p>
												</div>
											</div>
										</td>
										<td>
											<div>
												<img src="../../static/img/user/dog.jpg" class="avatar avatar-sm me-3 border-radius-lg" alt="user1">
											</div>
										</td>
										<td class="req-type">
											<p class="text-xs font-weight-bold mb-0">템플릿 삭제</p>
											<%-- <p class="text-xs text-secondary mb-0">Developer</p> --%>
										</td>
										<td class="align-middle text-center text-sm">
											<span class="badge badge-sm bg-gradient-secondary">대기</span>
										</td>
										<td class="align-middle text-center">
											<span class="text-secondary text-xs font-weight-bold">11/01/19</span>
										</td>
										<td class="align-middle">
											<%-- <a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
											Edit
											</a> --%>
											<a href="#" class="confirm_btn bg-gradient-danger mb-0 toast-btn">확인</a>
										</td>
									</tr>
									<%-- <tr>
										<td>
											<div class="d-flex px-2 py-1">
											<div>
												<img src="../../static/img/user/dog.jpg" class="avatar avatar-sm me-3 border-radius-lg" alt="user3">
											</div>
											<div class="d-flex flex-column justify-content-center">
												<h6 class="mb-0 text-sm">Laurent Perrier</h6>
												<p class="text-xs text-secondary mb-0">laurent@creative-tim.com</p>
											</div>
											</div>
										</td>
										<td>
											<p class="text-xs font-weight-bold mb-0">Executive</p>
											<p class="text-xs text-secondary mb-0">Projects</p>
										</td>
										<td class="align-middle text-center text-sm">
											<span class="badge badge-sm bg-gradient-success">Online</span>
										</td>
										<td class="align-middle text-center">
											<span class="text-secondary text-xs font-weight-bold">19/09/17</span>
										</td>
										<td class="align-middle">
											<a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
											Edit
											</a>
										</td>
									</tr>
									<tr>
										<td>
											<div class="d-flex px-2 py-1">
											<div>
												<img src="../../static/img/user/dog.jpg" class="avatar avatar-sm me-3 border-radius-lg" alt="user4">
											</div>
											<div class="d-flex flex-column justify-content-center">
												<h6 class="mb-0 text-sm">Michael Levi</h6>
												<p class="text-xs text-secondary mb-0">michael@creative-tim.com</p>
											</div>
											</div>
										</td>
										<td>
											<p class="text-xs font-weight-bold mb-0">Programator</p>
											<p class="text-xs text-secondary mb-0">Developer</p>
										</td>
										<td class="align-middle text-center text-sm">
											<span class="badge badge-sm bg-gradient-success">Online</span>
										</td>
										<td class="align-middle text-center">
											<span class="text-secondary text-xs font-weight-bold">24/12/08</span>
										</td>
										<td class="align-middle">
											<a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
											Edit
											</a>
										</td>
									</tr>
									<tr>
										<td>
											<div class="d-flex px-2 py-1">
											<div>
												<img src="../../static/img/user/dog.jpg" class="avatar avatar-sm me-3 border-radius-lg" alt="user5">
											</div>
											<div class="d-flex flex-column justify-content-center">
												<h6 class="mb-0 text-sm">Richard Gran</h6>
												<p class="text-xs text-secondary mb-0">richard@creative-tim.com</p>
											</div>
											</div>
										</td>
										<td>
											<p class="text-xs font-weight-bold mb-0">Manager</p>
											<p class="text-xs text-secondary mb-0">Executive</p>
										</td>
										<td class="align-middle text-center text-sm">
											<span class="badge badge-sm bg-gradient-secondary">Offline</span>
										</td>
										<td class="align-middle text-center">
											<span class="text-secondary text-xs font-weight-bold">04/10/21</span>
										</td>
										<td class="align-middle">
											<a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
											Edit
											</a>
										</td>
									</tr>
									<tr>
										<td>
											<div class="d-flex px-2 py-1">
											<div>
												<img src="../../static/img/user/dog.jpg" class="avatar avatar-sm me-3 border-radius-lg" alt="user6">
											</div>
											<div class="d-flex flex-column justify-content-center">
												<h6 class="mb-0 text-sm">Miriam Eric</h6>
												<p class="text-xs text-secondary mb-0">miriam@creative-tim.com</p>
											</div>
											</div>
										</td>
										<td>
											<p class="text-xs font-weight-bold mb-0">Programator</p>
											<p class="text-xs text-secondary mb-0">Developer</p>
										</td>
										<td class="align-middle text-center text-sm">
											<span class="badge badge-sm bg-gradient-secondary">Offline</span>
										</td>
										<td class="align-middle text-center">
											<span class="text-secondary text-xs font-weight-bold">14/09/20</span>
										</td>
										<td class="align-middle">
											<a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
											Edit
											</a>
										</td>
									</tr> --%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>