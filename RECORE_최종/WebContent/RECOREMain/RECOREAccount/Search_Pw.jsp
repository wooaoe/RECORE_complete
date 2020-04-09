<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% request.setCharacterEncoding("UTF-8"); %>
	<% response.setContentType("text/html; charset=UTF-8"); %>
	<%@ page import = "com.mvc.vo.Vo_Account" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="cssMain/magnific-popup.css">
    <link rel="stylesheet" href="cssMain/jquery-ui.css">
    <link rel="stylesheet" href="cssMain/owl.carousel.min.css">
    <link rel="stylesheet" href="cssMain/owl.theme.default.min.css">
    <link rel="stylesheet" href="cssMain/bootstrap-datepicker.css">
    
    
    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="cssMain/aos.css">
    <link rel="stylesheet" href="cssMain/style2.css">
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("input[name=search]").click(function(){
		var id = $("input[name=id]").val();
		var name = $("input[name=name]").val();
		var email = $("input[name=email]").val();
		$.ajax({
			url : "../../Account_Controller.do?command=searchpw",
			
			data : {
				"id" : id,
				"name" : name,
				"email" : email
			},
					
			dataType : "json",	
			
			success:function(data){	
				if(data.res!=null){					
				alert(name + " 회원님의 비밀번호는 "+data.res+"입니다.")
				} else{
				alert("해당하는 회원 정보가 없습니다.")
				}
			},
			error:function(){
				 alert("에러가 발생했습니다.");""
			}
		});

	});
	
});

</script>
<title>비밀번호 찾기</title>
<style type="text/css">
#wrap {
    position: relative;
    margin: 0 auto;
}
html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, th, td, img {
    margin: 0;
    padding: 0;
}
div {
    display: block;
}
body, code {
    font-family: 'Noto Sans KR',sans-serif;
    color: #353535;
    background: #fff;
    font-size: 13px;
}
html {
    color: -internal-root-color;
}
#container {
    margin: 0 auto;
    *zoom: 1;
    min-width: 1050px;
}
#container:after {
    content: "";
    display: block;
    clear: both;
}
#content {
    margin-top: 156px;
}
#content {
    width: 1050px;
    margin: 200px auto 100px;
}
.path {
    overflow: hidden;
    height: 30px;
    line-height: 30px;
    *zoom: 1;
}
.path span {
    overflow: hidden;
    position: absolute;
    width: 0;
    height: 0;
    white-space: nowrap;
    text-indent: 100%;
}
.path {
    overflow: hidden;
    height: 30px;
    line-height: 30px;
    *zoom: 1;
}
.path ol {
    float: right;
}
ol {
    display: block;
    list-style-type: decimal;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
.path li:first-child {
    background: none;
}
.path li {
    float: left;
    padding: 0 0 0 12px;
    margin: 0 0 0 8px;
    color: #757575;
    background: url(//img.echosting.cafe24.com/skin/base/layout/ico_path.gif) no-repeat 0 10px;
}
li {
    list-style: none;
}
.path li a {
    color: #757575;
}
a {
    text-decoration: none;
    color: #000;
}
a {
    text-decoration: none!important;
}
a:-webkit-any-link {
    cursor: pointer;
    text-decoration: underline;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
ol {
    list-style-type: decimal;
}
.path li strong, .path li strong a {
    color: #2e2e2e;
}
.titleArea {
    width: 1050px;
    min-height: 30px;
    margin: 30px auto 20px;
}
.titleArea h2 {
    display: inline-block;
    color: #2e2e2e;
    font-size: 25px;
    *display: inline;
}
.titleArea ul {
    padding: 5px 0;
    color: #939393;
    line-height: 18px;
}
ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
.titleArea ul li {
    position: relative;
    padding: 0 0 0 9px;
}
input, select, textarea {
    font-size: 100%;
    font-family: "돋움",Dotum;
    color: #353535;
    vertical-align: middle;
}
input[type="hidden" i] {
    display: none;
    -webkit-appearance: initial;
    background-color: initial;
    cursor: default;
    padding: initial;
    border: initial;
}
input {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark-color(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    -webkit-appearance: textfield;
    background-color: -internal-light-dark-color(white, black);
    -webkit-rtl-ordering: logical;
    cursor: text;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 0px;
    border-width: 2px;
    border-style: inset;
    border-color: initial;
    border-image: initial;
}
.ec-base-box.typeThin {
    border-width: 1px;
    border-color: #d7d5d5;
}
.xans-member-findid.ec-base-box {
    padding: 49px 0 39px;
}
.ec-base-box {
    padding: 20px;
    margin-left: auto;
    margin-right: auto;
    border: 1px solid #dfdfdf;
    color: #404040;
}
.xans-member-findid .findId {
    width: 375px;
    margin: 0 auto;
}
.ec-base-box.typeThin h3.boxTitle {
    margin: 0 0 20px;
    font-size: 20px;
    text-align: center;
}
h1, h3 {
    margin: 0;
}
h3 {
    display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
img, fieldset {
    border: none;
    vertical-align: top;
}
fieldset {
    display: block;
    margin-inline-start: 2px;
    margin-inline-end: 2px;
    padding-block-start: 0.35em;
    padding-inline-start: 0.75em;
    padding-inline-end: 0.75em;
    padding-block-end: 0.625em;
    min-inline-size: min-content;
}
legend {
    visibility: hidden;
    position: absolute;
    left: -9999px;
    top: -9999px;
    width: 0;
    height: 0;
    line-height: 0;
}
legend {
    display: block;
    padding-inline-start: 2px;
    padding-inline-end: 2px;
    border-width: initial;
    border-style: none;
    border-color: initial;
    border-image: initial;
}
.xans-member-findid .findId p {
    margin: 7px 0 0;
}
p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.xans-member-findid .findId strong {
    display: inline-block;
    margin: 0 0 5px;
    padding: 0 4px 0 4px;
    width: 125px;
    font-weight: normal;
}
.xans-member-findid .findId .member select {
    width: 236px;
    height: 34px;
    padding: 0 4px;
}
select {
    height: 27px;
    border: 1px solid #d5d5d5;
}
select:not(:-internal-list-box) {
    overflow: visible !important;
}
select {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark-color(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    -webkit-appearance: menulist;
    box-sizing: border-box;
    align-items: center;
    white-space: pre;
    -webkit-rtl-ordering: logical;
    background-color: -internal-light-dark-color(white, black);
    cursor: default;
    margin: 0em;
    font: 400 13.3333px Arial;
    border-radius: 0px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(169, 169, 169);
    border-image: initial;
}
option {
    font-weight: normal;
    display: block;
    white-space: pre;
    min-height: 1.2em;
    padding: 0px 2px 1px;
}
.xans-member-findid .findId .check {
    margin-bottom: 20px;
    color: #353535;
}
input[type=radio], input[type=checkbox] {
    width: 13px;
    height: 13px;
    border: 0;
}
input[type="radio" i] {
    background-color: initial;
    cursor: default;
    -webkit-appearance: radio;
    box-sizing: border-box;
    margin: 3px 3px 0px 5px;
    padding: initial;
    border: initial;
}
.xans-member-findid .findId input[type=radio] + label, .xans-member-findid .findId input[type=checkbox] + label {
    margin: 0 15px 0 2px;
}
input[type=radio] + label, input[type=checkbox] + label {
    margin: 0 4px 0 2px;
}
label {
    cursor: default;
}
.xans-member-findid .findId #name, .xans-member-findid .findId #email, .xans-member-findid .findId #id {
    width: 226px;
}
.xans-member-findid .findId input[type=text], .xans-member-findid .findId input[type=password] {
    height: 28px;
    line-height: 28px;
}
input[type=text], input[type=password] {
    height: 22px;
    line-height: 22px;
    padding: 2px 4px;
    border: 1px solid #d5d5d5;
    color: #353535;
    font-size: 12px;
}
.xans-member-findid .findId #ssn1, .xans-member-findid .findId #ssn2 {
    width: 101px;
}
.xans-member-findid .findId #mobile1 {
    width: 59px;
}
.xans-member-findid .findId #mobile2, .xans-member-findid .findId #mobile3 {
    width: 60px;
}
.xans-member-findid .findId #mobile_auth_view {
    height: 90px;
}
.xans-member-findid .findId .ipin strong, .xans-member-findid .findId .mobileauth strong {
    width: 125px;
    vertical-align: top;
}
.xans-member-findid .findId .ipin span, .xans-member-findid .findId .mobileauth span {
    display: inline-block;
    width: 236px;
    margin: 0 0 5px;
    line-height: 18px;
    color: #757575;
}
.xans-member-findid .findId .ipin a, .xans-member-findid .findId .mobileauth a {
    position: absolute;
    bottom: 0;
    left: 137px;
}
[class^='btn'] img {
    margin: -2px 1px 0;
    vertical-align: middle;
}
[class^='btnNormal'], a[class^='btnNormal'] {
    display: inline-block;
    box-sizing: border-box;
    padding: 2px 8px;
    border: 1px solid #d1d1d1;
    border-radius: 2px;
    font-family: "굴림",Gulim;
    font-size: 12px;
    line-height: 22px;
    font-weight: normal;
    text-decoration: none;
    vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
    color: #222;
    background-color: #fff;
}
.ec-base-button[class*="gColumn"] {
    margin: 0 auto;
    display: -webkit-flex;
    display: -moz-flex;
    display: -ms-flex;
    display: flex;
    -webkit-justify-content: center;
    -moz-justify-content: center;
    -ms-justify-content: center;
    justify-content: center;
}
.ec-base-button {
    padding: 10px 0;
    text-align: center;
}
.ec-base-button[class*="gColumn"] [class^='btn'] {
    margin: 0 2px;
    padding-left: 8px;
    padding-right: 8px;
    word-break: keep-all;
    word-wrap: break-word;
    white-space: normal;
    -webkit-flex: 1;
    -moz-flex: 1;
    -ms-flex: 1;
    flex: 1;
    display: -webkit-flex;
    display: -moz-flex;
    display: -ms-flex;
    display: flex;
    -webkit-align-items: center;
    -moz-align-items: center;
    -ms-align-items: center;
    align-items: center;
    -webkit-justify-content: center;
    -moz-justify-content: center;
    -ms-justify-content: center;
    justify-content: center;
}
[class^='btn'].sizeM {
    padding: 10px 16px;
}
[class^='btnSubmit'], a[class^='btnSubmit'] {
    display: inline-block;
    box-sizing: border-box;
    padding: 2px 8px;
    border: 1px solid transparent;
    border-radius: 2px;
    font-family: "굴림",Gulim;
    font-size: 12px;
    line-height: 18px;
    font-weight: normal;
    text-decoration: none;
    vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
    color: #fff;
    background-color: #05ce7c;
}
[class^='btnClose'], a[class^='btnClose'] {
    display: inline-block;
    box-sizing: border-box;
    padding: 2px 8px;
    border-radius: 2px;
    font-family: "굴림",Gulim;
    font-size: 12px;
    line-height: 18px;
    font-weight: normal;
    text-decoration: none;
    vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
    color: #555;
    background-color: #fff;
    border: solid 1px #aaa;
}
</style>
</head>
<body id="body">

<!-- header -->
<%@ include file="header.jsp" %>


	<div id="wrap">

		<div id="container">
			<div id="content">

				<div class="path">
					<span>현재 위치</span>
					<ol>
						<li><a href="../index.html">홈</a></li>
						<li title="현재 위치"><strong>비밀번호 찾기</strong></li>
					</ol>
				</div>

				<div class="titleArea">
					<h2>비밀번호 찾기</h2>
				</div>

				<form id="findIdForm" name="findIdForm" action="" method="post" target="_self"
					enctype="multipart/form-data">
					<input id="returnUrl" name="returnUrl" value="/member/id/find_id_result.html" type="hidden" />
					<div class="xans-element- xans-member xans-member-findid ec-base-box typeThin ">
						<div class="findId">
							<h3 class="boxTitle">비밀번호 찾기</h3>
							<fieldset>
								<legend>비밀번호 찾기</legend>

								<p id="id_view" class="id" style="position:relative; left:60px">
									<strong id="id_lable">아이디</strong> 
									<input id="id" name="id" class="lostInput" placeholder="" value="" type="text" />
								</p>

								<p id="name_view" class="name" style="position:relative; left:60px">
									<strong id="name_lable">이름</strong> 
									<input id="name" name="name" class="lostInput" placeholder="" value="" type="text" />
								</p>
								
								<p id="email_view" class="email" style="position:relative; left:60px">
									<strong>이메일</strong> 
									<input id="email" name="email" class="lostInput" placeholder="" value="" type="text" />
								</p>
								
								<div class="ec-base-button gColumn" style="padding: 40px 0px 10px;">
<!-- 									<input type="submit" class="btnSubmit sizeM" name="search" value="확인"> -->
									<input type="button" class="btnSubmit sizeM" name="search" 
									style="background-color:#A0D9D9; cursor: pointer;" value="확인">
									<a href="../../Account_Controller.do?command=loginpage" class="btnClose sizeM">취소</a>
								</div>
							</fieldset>
						</div>
					</div>
				</form>
			</div>
	<!-- footer -->   
   <%@ include file="/footer.jsp" %>
		</div>
	</div>
</body>
</html>