<%@page import="common.Goods" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>글 삭제</h3>
  <%
    Goods goods = (Goods) request.getAttribute("goods");
  %>
  <form action="removeGoods.do">
    <input type="hidden" value="<%=goods.getGoodsId() %>" name="goodsId">
    <table class="table">
      <tr>
        <th>글번호</th>
        <td><%=goods.getGoodsId() %></td>
      </tr>
      <tr>
        <th>제목</th>
        <td><%=goods.getName() %></td>
      </tr>
      <tr>
        <th>내용</th>
        <td><%=goods.getDescription() %></td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <button type="submit" class="btn btn-danger">삭제</button>
          <button type="reset" class="btn btn-secondary">취소</button>
        </td>
      </tr>
    </table>
  </form>