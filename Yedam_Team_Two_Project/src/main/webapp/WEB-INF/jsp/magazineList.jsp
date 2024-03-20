<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="../../static/css/magazineList.css">
    <div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8 magazineList-table">
                        <div class="cart-title mt-50">
                            <h2>Magazine</h2>
                        </div>

                        <div class="cart-table clearfix">
                            <table class="table table-responsive">
                                <thead>
                                    <tr>
                                        <th>뉴스번호</th>
                                        <th></th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="magazine" items="${list}">
	                                    <tr class="magazineList-tr" onclick="location.href='magazine.do?magazineId=${magazine.magazineId}'">
	                                     	<td class="cart_product_desc">
	                                            <h5><c:out value="${magazine.magazineId}"></c:out></h5>
	                                        </td>
	                                        <td class="cart_product_img">
	                                            <a href="#"><img class="magazineList-img" src="../static/img/bg-img/${magazine.thumbnail}.png" alt="Product"></a>
	                                        </td>
	                                        <td class="cart_product_desc">
	                                            <h5><c:out value="${magazine.title}"></c:out></h5>
	                                        </td>
	                                        <td class="cart_product_desc">
	                                            <span><c:out value="${magazine.memberId}"></c:out></span>
	                                        </td>
	                                    </tr>
                                	</c:forEach>
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="row">
		                    <div class="col-12">
		                        <!-- Pagination -->
		                        <nav aria-label="navigation">
		                            <ul class="pagination justify-content-end mt-50">
		                                <c:if test="${page.prev}">
		                                	<li class="page-item"><a class="page-link" href="magazineList.do?page=${page.starPage - 1}"> &laquo; </a></li>
		                                </c:if>
		                                
		                                <c:forEach begin="${page.starPage}" end="${page.endPage}" var="p">
		                                	<c:choose>
			                                	<c:when test="${p eq page.page }">
			                                		<li class="page-item active"><a class="page-link" href="magazineList.do?page=${p}">${p}.</a></li>
			                                	</c:when>
			                                	<c:otherwise>
			                                		<li class="page-item"><a class="page-link" href="magazineList.do?page=${p}">${p}.</a></li>
			                                	</c:otherwise>
		                                	</c:choose>
		                                </c:forEach>
		                                
		                                <c:if test="${page.next}">
		                                	<li class="page-item"><a class="page-link" href="magazineList.do?page=${page.endPage + 1}"> &raquo; </a></li>
		                                </c:if>
		                            </ul>
		                        </nav>
		                    </div>
		                </div>
                
                    </div>
                    </div>
                </div>
            </div>