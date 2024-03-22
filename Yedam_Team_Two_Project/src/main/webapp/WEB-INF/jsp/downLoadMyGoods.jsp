<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<link rel="stylesheet" href="../../static/css/downLoadMyGoods.css">
<body>
	 <div class="cart-table-area section-padding-100">
            <div class="container-fluid downLoadMyGoods-div">
                <div class="row">
                    <div class="col-lg-12">    
                   		<div class="cart-title">
                               <h2>Download Template</h2>
                       	</div>
                    	<div class="cart-table clearfix">
                            <table class="table table-responsive">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" id="checkAll" checked></th>
                                        <th>상품이름</th>
                                        <th>이미지</th>
                                        <th>다운로드</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<tr>
                                		<td><input type="checkbox" name="checkboxName"></td>
                                		<td class="cart_product_desc">상품이름</td>
                                		<td class="cart_product_img"><a href="#"><img class="downLoadMyGoods-img" src=""></a></td>
                                		<td class="cart_product_btn"><button class="downLoadMyGoods-btn">다운로드</button></td>
                                	</tr>
                                	<tr>
                                		<td><input type="checkbox" name="checkboxName"></td>
                                		<td class="cart_product_desc">상품이름</td>
                                		<td class="cart_product_img"><a href="#"><img class="downLoadMyGoods-img" src=""></a></td>
                                		<td class="cart_product_btn"><button class="downLoadMyGoods-btn">다운로드</button></td>
                                	</tr>
                                	<tr>
                                		<td><input type="checkbox" name="checkboxName"></td>
                                		<td class="cart_product_desc">상품이름</td>
                                		<td class="cart_product_img"><a href="#"><img class="downLoadMyGoods-img" src=""></a></td>
                                		<td class="cart_product_btn"><button class="downLoadMyGoods-btn">다운로드</button></td>
                                	</tr>
                                	<tr>
                                		<td><input type="checkbox" name="checkboxName"></td>
                                		<td class="cart_product_desc">상품이름</td>
                                		<td class="cart_product_img"><a href="#"><img class="downLoadMyGoods-img" src=""></a></td>
                                		<td class="cart_product_btn"><button class="downLoadMyGoods-btn">다운로드</button></td>
                                	</tr>
                                	<tr>
                                		<td><input type="checkbox" name="checkboxName"></td>
                                		<td class="cart_product_desc">상품이름</td>
                                		<td class="cart_product_img"><a href="#"><img class="downLoadMyGoods-img" src=""></a></td>
                                		<td class="cart_product_btn"><button class="downLoadMyGoods-btn">다운로드</button></td>
                                	</tr>
                                	<tr>
                                		<td><input type="checkbox" name="checkboxName"></td>
                                		<td class="cart_product_desc">상품이름</td>
                                		<td class="cart_product_img"><a href="#"><img class="downLoadMyGoods-img" src=""></a></td>
                                		<td class="cart_product_btn"><button class="downLoadMyGoods-btn">다운로드</button></td>
                                	</tr>
                                	<tr>
                                		<td><input type="checkbox" name="checkboxName"></td>
                                		<td class="cart_product_desc">상품이름</td>
                                		<td class="cart_product_img"><a href="#"><img class="downLoadMyGoods-img" src=""></a></td>
                                		<td class="cart_product_btn"><button class="downLoadMyGoods-btn">다운로드</button></td>
                                	</tr>
                                	<tr>
                                		<td><input type="checkbox" name="checkboxName"></td>
                                		<td class="cart_product_desc">상품이름</td>
                                		<td class="cart_product_img"><a href="#"><img class="downLoadMyGoods-img" src=""></a></td>
                                		<td class="cart_product_btn"><button class="downLoadMyGoods-btn">다운로드</button></td>
                                	</tr>
                                	<tr>
                                		<td><input type="checkbox" name="checkboxName"></td>
                                		<td class="cart_product_desc">상품이름</td>
                                		<td class="cart_product_img"><a href="#"><img class="downLoadMyGoods-img" src=""></a></td>
                                		<td class="cart_product_btn"><button class="downLoadMyGoods-btn">다운로드</button></td>
                                	</tr>
                                	<tr>
                                		<td><input type="checkbox" name="checkboxName"></td>
                                		<td class="cart_product_desc">상품이름</td>
                                		<td class="cart_product_img"><a href="#"><img class="downLoadMyGoods-img" src=""></a></td>
                                		<td class="cart_product_btn"><button class="downLoadMyGoods-btn">다운로드</button></td>
                                	</tr>
                                </tbody>
                            </table>
                        </div>					
					</div>
                 </div>
              </div>
		</div>
</body>
<script>
	//장바구니 내역 불러와서 td생성 및 기입
	
	//td와 체크박스 사이 상호작용
	
	//테이블 tr클릭 시 체크박스 활성화
	$(".table-responsive").on('click', 'tr', function(e){
		 e.stopPropagation();
		 
		if( $(e.target).is('input:checkbox') ) return;
		var chkbox = $(this).find('td:first-child :checkbox');
		chkbox.prop('checked', !chkbox.prop('checked'));
		
		var total = $("input[name=checkboxName]").length;
		var checked = $("input[name=checkboxName]:checked").length;

		if(total != checked) $("#checkAll").prop("checked", false);
		else $("#checkAll").prop("checked", true);
	});
	
	//th의 체크박스 선택 시 모든 항목 체크
	$(document).ready(function() {	
		$("#checkAll").click(checkAllEvent);
	});
	
	//체크박스(모두선택)눌렀을 때 각 체크박스 처리 이벤트
	function checkAllEvent(){
		if($("#checkAll").is(":checked")) $("input[name=checkboxName]").prop("checked", true);
		else $("input[name=checkboxName]").prop("checked", false);
	}
</script>