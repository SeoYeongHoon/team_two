<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../static/css/core-style.css">
<link rel="stylesheet" href="../../static/scss/style.scss">
<style>

</style>
</head>
<body>
<div class="main-content-wrapper d-flex clearfix">
<tiles:insertAttribute name="header" />
<tiles:insertAttribute name="body" />
</div>
<tiles:insertAttribute name="footer" />
</body>

<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
<script src="../../static/js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="../../static/js/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="../../static/js/bootstrap.min.js"></script>
<!-- Plugins js -->
<script src="../../static/js/plugins.js"></script>
<!-- Active js -->
<script src="../../static/js/active.js"></script>
</html>