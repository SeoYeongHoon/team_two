<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="ko">

<body>
    <h1>임시용 Wish List 페이지</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Wish Goods ID</th>
                <th>Member ID</th>
                <th>Goods ID</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${wishGoodsList}" var="wishGoods">
                <tr>
                    <td>${wishGoods.wishGoodsId}</td>
                    <td>${wishGoods.memberId}</td>
                    <td>${wishGoods.goodsId}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>