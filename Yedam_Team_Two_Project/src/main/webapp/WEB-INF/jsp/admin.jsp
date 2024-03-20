
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../static/css/admin.css">
<title>Insert title here</title>
</head>
<body>
	<script>
		$.get('../manageForm.do', (result) => {
			result.forEach((item, idx, ary) => {
				
			});
			
			$(result).each((idx, item, ary) => {
				$('<tr />').append(
					$('<td />').text(item.memberId),
					$('<td />').text(item.name),
					/* $('<td />').text(item.description), */
					$('<td />').text(item.price),
					$('<td />').text(item.reqDate),
					$('<td class="align-middle" />')
						.append($('<a href="confirm.do" class="confirm_btn bg-gradient-danger mb-0 toast-btn" />').text('확인'))
				).appendTo($('table'));
			})
		})
	</script>
	<div class="container-fluid py-4">
		<div class="row">
			<div class="col-12">
				<div class="card my-4 dashboard">
					<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
						<div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
							<h6 class="text-white text-capitalize dashboard_title">어드민페이지</h6>
						</div>
            		</div>

					<div class="card-body px-0 pb-2">
						<div class="table-responsive p-0">
							<table class="table align-items-center" style="margin: 10px;">
								<thead>
									<tr>
									<th class="">고객정보</th>
									<th class="">상품이름</th>
									<!-- <th class="">상품설명</th> -->
									<th class="">가격</th>
									<th class="">신청일자</th>
									<th class="">확인하기</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function confirmRequest(name = "", description = "", successCall, errorCall) {
			$.ajax({
				url: '/confirmRequest.do',
				method: 'post',
				data: { name, description },
				dataType: 'json'
			})
				.done(successCall)
				.fail(errorCall)
		}
	</script>
</body>
</html>