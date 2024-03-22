<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<script src="//cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<html lang="utf-8">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Scrolling Nav - Start Bootstrap Template</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../../static/css/addClear.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
      
        <!-- Header-->
        <header class="bg-warning bg-gradient text-black">
            <div class="container px-4 text-center">
                <h1 class="fw-bolder">${addName }님 Amado에 오신걸 환영합니다.</h1>
                <h3 class="fw-bolder">다양한 컨텐츠를 경험해보세요</h3>
                <h4 class="lead"><br /></h4>
                <h4 class="lead">회원정보</h4>
                <p class="lead">아이디: ${addId }</p>
                <p class="lead">비밀번호: ${addPw }</p>
                <p class="lead">이름: ${addName }</p>
                <p class="lead">이메일: ${addEmail }</p>
                <p class="lead">전화번호: ${addTel }</p>
                <a class="btn btn-lg btn-light" href="main.do">메인페이지 이동</a>
                <a class="btn btn-lg btn-light" href="loginForm.do">로그인</a>
            </div>
        </header>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container px-4"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../../static/js/addClear.js"></script>
    </body>
</html>
