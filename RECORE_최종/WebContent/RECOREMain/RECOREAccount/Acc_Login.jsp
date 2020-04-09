<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!doctype html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="AccountCss/AccountStyle.css">
<link rel="stylesheet" href="cssMain/style2.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	 
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");
    $("#id").val(key); 
     
    if($("#id").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#remember").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#remember").change(function(){ // 체크박스에 변화가 있다면,
        if($("#remember").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });
     
    $("#loginbtn").click(function(){ // 로그인 버튼을 클릭할 때,
        if($("#remember").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
        }
 });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

</script>
<style type="text/css">
body .container .half.bg img {
	background-color: #F56D3E;
}
.nivea{
font-family: "Nunito Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
font-size:12px;
color:#999999;
margin-top:20px;
text-ailgn:center;
animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
cursor:pointer;
}
html{
scroll-behavior: smooth;
}

</style>
</head>
<body>

  <%
    String clientId = "EM8u8oB6xvKkt1JJiT47";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8787/RECORE04/RECOREMain/index.html", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
	<!-- header 시작 -->

	<%-- <%@ include file="/RECOREMain/RECOREAccount/header.jsp" %> --%>
	<div id="header">
		<section class="menu">
			<nav class="navtest" style = "position: relative; top: 15px;">
				<a href="../index.html"><img src="<%=request.getContextPath()%>/images/logo2.png" /></a>
			</nav>
		</section>
	</div>

	<div>
		<section class="container">
			<article class="half">
				<h1>로그인</h1>
				<div class="tabs">
					<span class="tab signin active"><a href="Acc_Login.jsp">sign in</a></span>
				</div>

				<div class="content">
					<div class="signin-cont cont">
						<form action="../../Account_Controller.do?command=login" method="post" id="loginForm" name="loginForm" >
							<input type="text" name="acc_id" id="id" class="inpt" required="required" placeholder="아이디"><label for="id">아이디</label>
							<input type="password" name="acc_pw" id="password" class="inpt"required="required" placeholder="비밀번호" > <label for="password">비밀번호</label> 
							<div class="submit-wrap" style="position: relative;">
 							<input type="checkbox" id="remember" class="checkbox" checked>
						        <label for="remember" style="margin-top: -5px;">아이디 저장</label>
								<input type="submit" value="로그인" style="text-align: center; margin-top: 5px;" id = "loginbtn" class="submit" > 
								<span class="tab signup active">
								<%-- <a href="<%=apiURL%>" class="more" ><img width="200" style="margin-top: 0px;" src="<%=request.getContextPath()%>/RECOREMain/RECOREAccount/Accimages/login.PNG"/></a>
								 --%><a href="Acc_Signup.jsp" class="more" style="margin-top: 20px;">회원가입</a>
								 </span> 
								<div style="text-align: center; margin-top: 10px;">
								<span class="nivea" onclick="location.href='Search_Id.jsp'">아이디 찾기</span>
								<span class="nivea" style="font-size:12px; cursor:default;">|</span>
 								<span class="nivea" onclick="location.href='Search_Pw.jsp'">비밀번호 찾기</span>
								</div> 
 								
							</div>
						</form>
					</div>
				</div>
			</article>
			
			<div class="half" style="background-color: #A0D9D9;"></div>
		</section>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript">
		$('.tabs .tab').click(function() {
			if ($(this).hasClass('signin')) {
				$('.tabs .tab').removeClass('active');
				$(this).addClass('active');
				$('.cont').hide();
				$('.signin-cont').show();
			}
			if ($(this).hasClass('signup')) {
				$('.tabs .tab').removeClass('active');
				$(this).addClass('active');
				$('.cont').hide();
				$('.signup-cont').show();
			}
		});
	</script>
</body>
</html>
