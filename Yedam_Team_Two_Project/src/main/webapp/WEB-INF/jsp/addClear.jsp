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
        <!-- About section-->
        <section id="about">
            <div class="container px-4">
                <div class="row gx-4 justify-content-center">
                    <div class="col-lg-8">
                        <h2>About this page</h2>
                        <p class="lead">This is a great place to talk about your webpage. This template is purposefully unstyled so you can use it as a boilerplate or starting point for you own landing page designs! This template features:</p>
                        <ul>
                            <li>Clickable nav links that smooth scroll to page sections</li>
                            <li>Responsive behavior when clicking nav links perfect for a one page website</li>
                            <li>Bootstrap's scrollspy feature which highlights which section of the page you're on in the navbar</li>
                            <li>Minimal custom CSS so you are free to explore your own unique design options</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- Services section-->
        <section class="bg-light" id="services">
            <div class="container px-4">
                <div class="row gx-4 justify-content-center">
                    <div class="col-lg-8">
                        <h2>Services we offer</h2>
                        <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut optio velit inventore, expedita quo laboriosam possimus ea consequatur vitae, doloribus consequuntur ex. Nemo assumenda laborum vel, labore ut velit dignissimos.</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Contact section-->
        <section id="contact">
            <div class="container px-4">
                <div class="row gx-4 justify-content-center">
                    <div class="col-lg-8">
                        <h2>Contact us</h2>
                        <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero odio fugiat voluptatem dolor, provident officiis, id iusto! Obcaecati incidunt, qui nihil beatae magnam et repudiandae ipsa exercitationem, in, quo totam.</p>
                    </div>
                </div>
            </div>
        </section>
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
