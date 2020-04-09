	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8");%>
	<%response.setContentType("text/html; charset=UTF-8");%>
	
	<%@ page import = "com.mvc.vo.Vo_Product" %>
	<%@ page import = "com.mvc.vo.Vo_Prod_option" %>
	<%@ page import = "com.mvc.vo.Vo_Account" %>
	<%@ page import = "java.util.List" %>
	
	<% Vo_Account acc = (Vo_Account)session.getAttribute("vo"); %>
	
	<% String amount = (String)request.getAttribute("amount"); %> 
	<% String totalPrice = (String)request.getAttribute("totalPrice");%>
	<% String prod_id = (String)request.getAttribute("prod_id");%>
	<% int point = Integer.parseInt(request.getParameter("acc_point")); %>
	<% String acc_addrs = (String)request.getAttribute("acc_addrs"); %> 

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KAKAOPAY - 결제</title>

<head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link rel="stylesheet" type="text/css" href="//t1.daumcdn.net/kakaopay/tesla/20191122/pg-web/css/common.min.css">
 
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
<script type="text/javascript">
	
function checkval(){
	
	var phone = $("#userPhone").val();
	var phonNumberCheck = RegExp(/^01[0179][0-9]{7,8}$/);
	
	if(phone.length == 11 && phonNumberCheck.test(phone)){
		$("#em").hide();
		$("#userBirth").focus();
		$("#em2").text("특수문자 없이 숫자만 입력해주세요.");
	}else if(phone.length == 0 || phone.length < 11 || !phonNumberCheck.test(phone) ){
		$("#em").show();
	}
	
}
function checkval2(){
	
	var birth = $("#userBirth").val();
	var phone = $("#userPhone").val();
	var regExp = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/;

	
	if(birth.length == 6 && regExp.test(birth)){
		$("#em2").hide();
	}else if(birth.length == 0 || birth.length < 6 || !regExp.test(birth)){
		$("#em2").show();
	}
	if(birth.length == 6 && phone.length == 11 && regExp.test(birth)){
		$("#request").css("background-color", "#ffe900").css("color", "black");
		$("#request").prop("disabled", false);
	}
	if(birth.length < 6 || phone.length < 11 || birth.length == 0 || phone.length == 0 || !regExp.test(birth)){
		$("#request").css("background-color", "#ddd").css("color", "#999");
		$("#request").prop("disabled", true);
	}
}
	
 	 $(document).ready(function(){
		
		$("#request").click(function(){ 
			
			var arr_amount = $("#amount").val();
			var arr_totalPrice = $("#totalPrice").val();
			var arr_prod_id = $("#prod_id").val();
			var test_point = <%=point%>;
			var tmp = $("#acc_addrs").val();
				
			var url = "Product.do?command=cartkakaocall2&amount=" + arr_amount + "&totalPrice=" + arr_totalPrice + 
							"&prod_id=" + arr_prod_id + "&acc_addrs=" + tmp + "&acc_point=" + test_point; 
							
				location.href = url; 
			
		});
	 }); 

	
</script>

</head>
<body>

	

<div class="kakaopay_layer">
		<!-- 팝업 시작 -->
		<div class="kakao_popup">
			<div class="popup_payask_type">
				<div class="popup_head">
					<h1 class="screen_out">카카오페이 결제요청</h1>
				</div>
				<div class="popup_body">
					<strong class="screen_out">결제수단 선택 탭 목록</strong>

					<ul class="list_gnb">
						<li class="_tab_talk on"><a href="#none" class="link_gnb">카톡 메시지로 결제</a></li>
					</ul>

					<div class="area_view _talk_area hide" style="display: block;">
						<h2 class="screen_out">카톡 메시지로 결제</h2>
						<strong class="logo_pay"><img src="//t1.daumcdn.net/kakaopay/tesla/20181010/pg_web/images/logo_pay.png" class="img_g" alt="카카오페이"></strong>
						<p class="desc_payask">결제요청 메시지 전송을 위해<br>아래 정보를 입력해주세요.</p>
						
						<form id="userPost" method="get" action="">
						 <input id ="amount" type = "hidden" name = "amount" value = "<%=amount%>"/> 
						 <input id ="totalPrice" type = "hidden" name = "totalPrice" value = "<%=totalPrice%>"/> 
						 <input id ="prod_id" type = "hidden" name = "prod_id" value = "<%=prod_id%>"/> 
						 <input type = "hidden" id = "acc_addrs" name = "acc_addrs" value = "<%=acc_addrs%>"/>
							<fieldset class="fld_payask">
								<legend class="screen_out">결제정보입력</legend>
								<ul class="list_payask">
									<li>
                                    <span class="txt_payask">
                                        <label for="userPhone" class="lab_payask">
                                        	휴대폰 번호 
                                        </label>
										 		<em id = "em" style = "font-size: 9pt; color: red;">특수문자 없이 숫자만 입력해주세요.</em>
                                    </span>
										<input type="text" id="userPhone" class="inp_payask" 
										placeholder="예) 01012345678" value="" autocomplete="off"
										maxlength="11" onkeyup="checkval();">
									
									</li>
									<li>
                                    <span class="txt_payask">
                                        <label for="userBirth" class="lab_payask">생년월일</label>
										 		<em id = "em2" style = "font-size: 9pt; color: red;"></em>
                                    </span>
										<input type="text" id="userBirth" class="inp_payask"  
										placeholder="예) 840301" value="" autocomplete="off"
										maxlength="6" onkeyup="checkval2();">
									</li>
								</ul>

								<button type="button" id = "request" class="btn_payask" 
								onclick = "request();">결제요청</button>
								
							</fieldset>
						</form>
					</div>
					<a href="#none" class="btn_close">
					<img src="//t1.daumcdn.net/kakaopay/tesla/20181010/pg_web/images/ico_close.png" 
					class="img_g" alt="닫기" onclick = "javascript:self.close();"></a>
				</div>
			</div>
		</div>
		<!-- 팝업 끝 -->

		<!-- <form id="actionPost" action="approval" method="post">
		</form> -->
	</div>

</body>
</html>