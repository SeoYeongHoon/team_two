<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="utf-8">
<!-- Global site tag (gtag.js) - Google Analytics -->
<title>PAPATA LABS</title>


<!-- Bootstrap CSS -->
<link href="https://papatalabs.com/css/bootstrap.min.css" rel="stylesheet">

<!-- Slick -->
<link rel="stylesheet" type="text/css" href="https://papatalabs.com/slick/slick.css"/>

<!-- My CSS -->
<link href="https://papatalabs.com/css/main.css" rel="stylesheet">

<!-- js -->
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="/common/js/jquery.form.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/slick/slick.min.js"></script>
<script src="/common/js/userCommon.js"></script>


<style type='text/css'>
	#_hidden_layer_Y{position: absolute;z-index:910; width: 100%;top: 0px; left: 0px;}
	#pop-layer1-10{position:absolute;z-index:910;display:none;width:600px;height:630px;top:85px;left:20px;}
	#pop-layer1-10-body{height:595px;overflow-x:hidden;overflow-y:hidden;border:#ededed solid 1px;background:#ffffff;}
	#pop-layer1-10-close{height:35px;background:#343434;text-align:right;color:#ffffff;font-weight: 300; font-size: 12px;}
	#pop-layer1-10-ckd{}
	#pop-layer1-10-btn{position:relative;left:0px; margin-left: 15px; margin-right: 10px; }
</style>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-174581344-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-174581344-1');
</script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">

<div id="custom">
			<h2>고객센터</h2>
			<p>고객센터 - 자주하는 질문</p>
			<nav class="tab">
				<ul>
					<li class="on">FAQ</li>
					<c:choose>
					     <c:when test="${!empty logid }">
					         <li id ="goToQna"><a href="/qna.do">Q&A</a></li>
					      </c:when>
					      <c:otherwise>
					      <script>
					     // document.getElementById('btnSave').addEventListener('click', function(e) {

					      //alert("로그인이 필요합니다.");
					      </script>
					        <li><a href="/loginForm.do">Q&A</a></li>
					      </c:otherwise>
	                </c:choose>			
				</ul>
			</nav>
			<div class="custom_phone">
				자주 묻는 질문들을 모아놓았습니다.<br/>
				보다 자세한 사항을 원하시면 아래 번호로 연락주시기 바랍니다.
				<a href="tel:0231443332">TEL | 02-3144-3332</a>
			</div>
			<div class="title_box">
				<table>
					<thead>
						<th>번호</th>
						<th>내용</th>
					</thead>
				</table>
			</div>
			<dl class="faq">
				<dt>	<a href='#faq01'>		<span class='faqSubtitle'>13</span>		<span class='faqQ'></span>템플릿의 사용범위가 어떻게 되나요?		<span class='arrow'></span>	</a></dt><dd>	<span class='faqA'></span>저희 파파타랩스에서 제공하는 모든 콘텐츠는 상업적, 비상업적 이용이 자유롭습니다.
다만 템플릿을 재가공하여 이윤을 위해 재판매하는 형식은 제한되고 있음을 알려드립니다.</dd><dt>	<a href='#faq01'>		<span class='faqSubtitle'>12</span>		<span class='faqQ'></span>템플릿 다운로드는 어떻게 받나요?
		<span class='arrow'></span>	</a></dt><dd>	<span class='faqA'></span>최초 템플릿 상세 페이지에서 “바로구매” 버튼을 누른 후 결제 완료 시 “PPT 다운로드” 버튼이 나타납니다.<br />
버튼을 클릭하면 마이페이지로 이동되는데, 마이페이지 >> 최근 주문내역에서 PPT 다운로드 버튼을 누르시면 템플릿을 다운로드 받을 수 있습니다.</dd><dt>	<a href='#faq01'>		<span class='faqSubtitle'>11</span>		<span class='faqQ'></span>한번 구매한 템플릿은 환불이 가능한가요?		<span class='arrow'></span>	</a></dt><dd>	<span class='faqA'></span>파파타랩스에서 판매하는 템플릿은 디지털 콘텐츠 저작물로 환불이 불가능합니다. <br />
하지만 템플릿의 오류를 발견하여 문제가 있다고 당사가 인정할 경우, 오류 부분을 개선하여 보내드리도록 하겠습니다. </dd><dt>	<a href='#faq01'>		<span class='faqSubtitle'>10</span>		<span class='faqQ'></span>컨설팅은 어떻게 받을 수 있나요?		<span class='arrow'></span>	</a></dt><dd>	<span class='faqA'></span>로그인 후 CONSULTING > 무료 컨설팅 글쓰기 버튼을 클릭하시면 컨설팅 글쓰기가 가능합니다.<br />
PPT 썸네일에는 이미지 파일을, PPT 파일첨부에는 PPT 파일을 첨부해 주시면 됩니다.
글을 다 작성하시면 파파타랩스의 PPT 디자이너들이 PPT 고민을 해결해 드립니다.</dd><dt>	<a href='#faq01'>		<span class='faqSubtitle'>9</span>		<span class='faqQ'></span>파파타스쿨은 어떻게 신청하나요?		<span class='arrow'></span>	</a></dt><dd>	<span class='faqA'></span>수강을 원하는 일정에 체크를 하신 후 바로구매 버튼을 클릭합니다.<br />
입금이 확인되면, 파파타랩스 측에서 등록하신 이메일로 교육 일정 관련 안내 메일을 보내드립니다.</dd><dt>	<a href='#faq01'>		<span class='faqSubtitle'>8</span>		<span class='faqQ'></span>파파타스쿨은 어떻게 환불하나요?		<span class='arrow'></span>	</a></dt><dd>	<span class='faqA'></span>고객센터 > Q&A 게시판, 또는 “02-3144-3332”로 문의 주시면 환불 진행 도와드리도록 하겠습니다.<br />
* 카드결제 시 카드결제 부분취소로 이루어집니다.<br />
* 무통장입금 시 환불 계좌로 입금됩니다.<br />
* 환불 신청 후 7일 이내 처리됩니다.<br />
강의 진행 일자 산정 시 환불 요청을 한 당일은 진행 일수에 포함됩니다.<br />
강의가 시작되는 당일은 강의를 듣지 않았더라도 수업개시일 이후 환불 요청사항에 해당합니다.<br />
환불 시 은행 수수료로 및 카드수수료를 제합니다.<br />
무통장 환불 시 입금자명과 환불계좌명이 같아야 환불 가능합니다.<br /></dd><dt>	<a href='#faq01'>		<span class='faqSubtitle'>7</span>		<span class='faqQ'></span>LABS MAGAZINE의 카테고리는 어떤 기준인가요?		<span class='arrow'></span>	</a></dt><dd>	<span class='faqA'></span>  · 꿀팁 : PPT 디자인에 도움이 되는 정보들이 담겨 있습니다.<br />
  · 트렌드 : 디자인 트렌드나 인사이트를 얻을 수 있는 정보들이 담겨 있습니다.<br />
  · 소식 : 파파타랩스의 새로운 소식을 전달해 드립니다.<br />
  · 이슈 : 파워포인트 관련 새로운 이슈를 소개해 드립니다.<br />
  · 기타 : 기타 정보와 소식을 전해 드립니다.</dd><dt>	<a href='#faq01'>		<span class='faqSubtitle'>6</span>		<span class='faqQ'></span>HOT CREATOR와 HOT KEYWORD의 선정 기준은 무엇인가요?		<span class='arrow'></span>	</a></dt><dd>	<span class='faqA'></span>HOT CREATOR는 조회수와 판매순을 기준으로 선정됩니다.<br />
HOT KEYWORD는 파파타랩스 내부에서 템플릿들의 태그와 최근 이슈ㆍ트렌드를 분석하여 선정합니다.</dd><dt>	<a href='#faq01'>		<span class='faqSubtitle'>5</span>		<span class='faqQ'></span>회원가입은 어떻게 하나요?		<span class='arrow'></span>	</a></dt><dd>	<span class='faqA'></span>화면 상단의 회원가입 버튼을 누른 후 휴대폰으로 본인인증을 하면 가입이 가능합니다.
</dd><dt>	<a href='#faq01'>		<span class='faqSubtitle'>4</span>		<span class='faqQ'></span>회원탈퇴는 어떻게 하나요?		<span class='arrow'></span>	</a></dt><dd>	<span class='faqA'></span>회원탈퇴는 02-3144-3332 또는 papata@papatalabs.com로 연락 주시면 처리해 드립니다.<br />
회원탈퇴를 할 경우 본 서비스에서 제공되었던 모든 서비스 혜택에서 제외되며,<br />
재가입을 할 경우 기존에 가지고 있던 모든 자료와 회원 정보는 부활하지 않습니다.</dd>			</dl>
						<div class="location">
				<li><a href='javascript:;' class='first_icon'><img src='/images/sub/first_icon.png' alt=''></a></li><li><a href='javascript:;' class='prev_icon'><img src='/images/sub/prev_icon.png' alt=''></a></li><li class="on"><a href="javascript:;">1</a></li><li><a href="javascript:goPage(2);">2</a></li><li><a href='javascript:;' class='next_icon'><img src='/images/sub/next_icon.png' alt=''></a></li><li><a href='javascript:goPage(2);' class='last_icon'><img src='/images/sub/last_icon.png' alt=''></a></li>			</div>
					</div>
		<!-- sns area -->
		<div id="sns">
	<div class="row">
		<div class='col-xs-4'>	<a href='https://www.youtube.com/channel/UC24VcwwJ64zmUt6fVvwkGyg?view_as=subscriber' class='box box1' target='_blank'>		<div class='box-center'>			<img src='/files/banner/fa0ed5b5c600145bdd9a299952b99651.jpg' alt=''>			<img class='hover_img' src='/files/banner/97f1dd66781eaf6bc93c8efa5731284d.jpg' alt=''>		</div>	</a></div><div class='col-xs-4'>	<a href='https://www.facebook.com/%ED%8C%8C%ED%8C%8C%ED%83%80%EB%9E%A9%EC%8A%A4-113567613763875/' class='box box2' target='_blank'>		<div class='box-center'>			<img src='/files/banner/35ce1d4eb0f666cd136987d34f64aedc.jpg' alt=''>			<img class='hover_img' src='/files/banner/5b53cf0c1bc2cd9b30c2abda1b6e1aaa.jpg' alt=''>		</div>	</a></div><div class='col-xs-4'>	<a href='https://www.instagram.com/papatalabs/' class='box box3' target='_blank'>		<div class='box-center'>			<img src='/files/banner/b7bd6536bf9b3071c642718c7a514eac.png' alt=''>			<img class='hover_img' src='/files/banner/0f9ff408fd37a30ad6af332b28f71165.png' alt=''>		</div>	</a></div>	</div>
</div>
<script>
$(document).ready(function(){
	$('.faq dd').slideUp(0);

	$('.faq dt').click(function(){
		$(this).find('.arrow').addClass('on');
		$(this).find('.faqQ').addClass('on');
		$(this).addClass('bgColor');
		var is = $(this).find('+dd').is(':hidden');

		if(is){
			$('.faq dd').slideUp('fast');
			$('.faq .faqQ').removeClass('on');
			$('.faq dt').removeClass('bgColor');
			$('.faq .arrow').removeClass('on');
			$(this).addClass('bgColor');
			$(this).find('.arrow').addClass('on');
			$(this).find('.faqQ').addClass('on');
			$(this).find('+dd').slideDown('fast');
		}else{
			$('.faq dd').slideUp('fast');
			$('.faq .arrow').removeClass('on');
			$('.faq dt').removeClass('bgColor');
			$('.faq .faqQ').removeClass('on');
		}
	});
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	$("#p_footer").load("/footer.php")
});
</script>
<div id="p_footer"></div>

<!-- NAVER SCRIPT -->
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script> 
<script type="text/javascript"> 
if (!wcs_add) var wcs_add={};
wcs_add["wa"] = "s_511752fa23f4";
if (!_nasa) var _nasa={};
wcs.inflow("papatalabs.com");
wcs_do(_nasa);
</script>
<!-- NAVER SCRIPT END -->

</body>
</html>
