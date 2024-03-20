<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">   
<%
		if(session.getAttribute("member")==null)
		{
			response.sendRedirect("loginForm.do");
		}
	%>
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

</script>		<div id="custom" class="c_write">
			<h2>고객센터</h2>
			<p>파파타랩스의 모든 궁금증, 이곳에서 해결하세요!</p>
			<nav class="tab">
				<ul>
					<li><a href="/support.do">FAQ</a></li>
					<li class="on">Q&A</li>
				</ul>
			</nav>
			<form name='frm' id='frm' method="POST">
			<input type='HIDDEN' id='strMode' name='strMode' value="NEW">
			<input type='HIDDEN' name='returnUrl' id='returnUrl' value="/customer/qnaReg.php">			<input type='HIDDEN' name='memberSeq' id='memberSeq' value='40283'>
			<input type='HIDDEN' name='memberMail' id='memberMail' value='amado@amado.com'>
			<table>
				<tr>
					<th><label for="qnaTitle">제목</label></th>
					<td><input type="text" name='qnaTitle' id="qnaTitle" placeholder="제목을 입력하세요."></td>
				</tr>
				<tr>
					<th><label for="qnaContent">문의 내용</label></th>
					<td><textarea name='qnaContent' id="qnaContent" placeholder="문의 내용을 입력하세요."></textarea></td>
				</tr>
			</table>
			<div class="btn_wrap qna_btn">
			    <input type='button' name='btnSave' id='btnSave' value='문의 접수' class="write_btn">
	   		    <input type='button' name='btnList' id='btnList' value='내 문의 목록' class="write_btn">
			</div>
			
			</form>
			<!-- sns area -->
			<div id="sns">
	<div class="row">
		<div class='col-xs-4'>	<a href='https://www.youtube.com/channel/UC24VcwwJ64zmUt6fVvwkGyg?view_as=subscriber' class='box box1' target='_blank'>		<div class='box-center'>			<img src='/files/banner/fa0ed5b5c600145bdd9a299952b99651.jpg' alt=''>			<img class='hover_img' src='/files/banner/97f1dd66781eaf6bc93c8efa5731284d.jpg' alt=''>		</div>	</a></div><div class='col-xs-4'>	<a href='https://www.facebook.com/%ED%8C%8C%ED%8C%8C%ED%83%80%EB%9E%A9%EC%8A%A4-113567613763875/' class='box box2' target='_blank'>		<div class='box-center'>			<img src='/files/banner/35ce1d4eb0f666cd136987d34f64aedc.jpg' alt=''>			<img class='hover_img' src='/files/banner/5b53cf0c1bc2cd9b30c2abda1b6e1aaa.jpg' alt=''>		</div>	</a></div><div class='col-xs-4'>	<a href='https://www.instagram.com/papatalabs/' class='box box3' target='_blank'>		<div class='box-center'>			<img src='/files/banner/b7bd6536bf9b3071c642718c7a514eac.png' alt=''>			<img class='hover_img' src='/files/banner/0f9ff408fd37a30ad6af332b28f71165.png' alt=''>		</div>	</a></div>	</div>
</div>
</div>

<script type="text/javascript">
// 버튼 누르면 정보가 json 형식으로 전달하는?게 맞지 않나. 폼 형식으로?..잘모르겠지만 일단 제이슨.
document.getElementById('btnSave').addEventListener('click', function(e) {
    var qnaTitle = document.getElementById('qnaTitle').value;
    var qnaContent = document.getElementById('qnaContent').value;
    
    if(qnaTitle.trim() === '' || qnaContent.trim() === '') {
        alert("내용을 작성하세요.");
    } else {
        var xhr = new XMLHttpRequest();
        var url = '/qnaControl';
        var params = 'qnaTitle=' + encodeURIComponent(qnaTitle) + '&qnaContent=' + encodeURIComponent(qnaContent);
        
        xhr.open('POST', url, true);
        xhr.setRequestHeader('application/json', 'application/x-www-form-urlencoded');
        
        xhr.onreadystatechange = function() {
            if(xhr.readyState == 4 && xhr.status == 200) {
                alert("고객님의 문의가 접수되었습니다.");
            }
        };
        
        xhr.send(params);
    }
});


$(document).ready(function(){
	$("#p_footer").load("/footer.php")
});
</script>