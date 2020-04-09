<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.mvc.vo.Vo_Prod_option"%>
<%@ page import="com.mvc.vo.Vo_Product"%>
<%@ page import="com.mvc.vo.Vo_Account"%>
<%@ page import="com.mvc.vo.Vo_Order_Num"%>
<%@ page import="com.mvc.vo.Vo_Order"%>
<%@ page import="java.util.List"%>

	<% Vo_Product pvo = (Vo_Product) request.getAttribute("pvo");%>
	<% List<Vo_Prod_option> povo = (List)request.getAttribute("povo"); %>
	<% List<Vo_Product> plist = (List)request.getAttribute("plist"); %>
	<% Vo_Account acc = (Vo_Account) session.getAttribute("vo");%>
	<% String[] arr = acc.getAcc_phone().split("-");%>
	<% String[] color = request.getParameterValues("color");%>
	<% String[] size = request.getParameterValues("size");%>
	<% int amount = Integer.parseInt(request.getParameter("product-quantity"));	%>
	<% int totalPrice = Integer.parseInt(request.getParameter("total"));%>
	<%! int prod_id; %>
	<% for(int i = 0; i < povo.size(); i++){
		prod_id = povo.get(i).getProd_id();
		}
	%>

<!DOCTYPE html>
<html>
<head>
<title>RECORE-CHECKOUT</title>

<meta charset="utf-8">

<meta name="description" content="">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="format-detection" content="telephone=no">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<meta content="9e69513f-3466-4c49-a861-ec68fe0777c8" name="csrf-token">
<meta name="google-site-verification"
	content="BR5o5r7ViKMPI6vloq9TUj0OAZkmujygD-KXjxO2ABY" />

<link rel="apple-touch-icon-precomposed" href="">


<link rel="stylesheet"
	href="https://assets.kolonmall.com/_ui/css/kop/common-f380db13f2.css" />
<link rel="stylesheet"
	href="https://assets.kolonmall.com/_ui/css/kop/desktop/application-1b80a09c0c.css" />

<link rel="stylesheet"
	href="https://assets.kolonmall.com/_ui/css/series/desktop/application-9bf7fef9f4.css" />

<link rel="stylesheet"
	href="https://assets.kolonmall.com/_ui/css/build/kop/desktop-3fea64876b.bundle.css" />

<link rel="stylesheet"
	href="https://assets.kolonmall.com/_ui/css/kop/desktop/Order-a59824e1c6.css" />

 <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	
	<!-- @@ RECORE favicon @@  -->
	<link rel="icon" href="<%=request.getContextPath()%>/images/recorefavi.png">

<style type="text/css">
.has-children a{
   font-weight: 300;
}
.site-navbar-top{
   line-height: 1.5;
}
</style>
<%@ include file="/head.jsp"%>

<style type="text/css">

/* 전체적인 폼 위치 편경 */
#kolon-content {
	position: relative;
	margin: 0px 0 80px;
	overflow: hidden;
	padding-left: 50px;
	padding-right: 50px;
}

.way-info {
	float: left;
	width: 300px
}
</style>
	
	<script type="text/javascript">
		
	$(document).ready(function(){
			$("#kakaoV2").click(function(){
				if($("#info").css("display") == "none"){
					$("#info").show(); 
				}else {
					$("#info").hide();
				}
			});
		});
	
	</script>
	
	
	<script type="text/javascript">
	
		$(document).ready(function(){ //적립금 모두 사용 체크하면 발생하는 이벤트 함수 
			
				var point = <%=acc.getAcc_point()%>;
				var originprice = <%=totalPrice%>;
				var numformat_point = "<fmt:formatNumber>-${vo.acc_point}</fmt:formatNumber>원";	
				var res = originprice - point;
				
							
			$("#allDepositCheckboxV2").change(function(){
				
				if($("#allDepositCheckboxV2").is(":checked") == true){ //적립금 모두 사용하기 체크시 발생 
					
					if(originprice < point){
						$("#allDepositCheckboxV2").prop("checked", false);
							alert("적립금은 상품 금액을 초과할 수 없습니다.");
					
					}else if(originprice < 50000){
						$("#allDepositCheckboxV2").prop("checked", false);
						alert("주문 금액 5만원 이상 시 적립금 사용이 가능합니다.");
					
					}else if(point == 0){
						 alert("적립금이 존재하지 않습니다.");
						 $("#allDepositCheckboxV2").prop("checked", false);
						 $("#pointId").focus();
						 
					}else{  //포인트값보다 크고, 5만원 이상이면 발생 
						$("#point2").html(numformat_point); //결제 정보 적립금 부분에 html태그 뿌려줌 
						$("#totalPrice").text(res+ "원"); //포인트가 차감된 전체 금액 text태그 뿌려줌 
						$("#allDepositCheckboxV1").prop("disabled", true);
						$("#pointId").attr("readonly", true);
					}
				}else{ //모두사용 체크 해제하면 다시 원상태로 되돌아오는 이벤트
					$("#totalPrice").text(originprice + "원");
					$("#point2").empty();
					$("#allDepositCheckboxV1").prop("disabled", false);
					$("#pointId").attr("readonly", false);
				}
			});
			
		});
		
		function getpointValues(){
			
			 var pointById = $("#pointId").val(); //포인트 값 입력시 들어오는 value값 
			 var originprice2 = <%=totalPrice%>; //상품 전체 금액 value 값 	
			 var priceRes = originprice2 - pointById; //상품 전체 금액 - 사용할 포인트 값 
			 var acc_point2 = <%=acc.getAcc_point()%>; //원래 계정의 포인트 값
			 
			if($("#allDepositCheckboxV1").is(":checked") == true){
			
			    if(originprice2 < pointById){ //상품 총 금액(적립금 비포함)이 포인트 값보다 적으면 발생 
					$("#allDepositCheckboxV1").prop("checked", false); 
					alert("적립금은 상품 금액을 초과할 수 없습니다.");
				 }else if(originprice2 < 50000){
					 $("#allDepositCheckboxV1").prop("checked", false); 
				 	alert("주문 금액 5만원 이상 시 적립금 사용이 가능합니다.");
				 }else if(pointById == 0 || $("#pointById").val() == ""){
					alert("적립금이 입력되지 않았습니다.");
				 	$("#allDepositCheckboxV1").prop("checked", false);
				 	$("#pointId").focus();
				 }else if(pointById > acc_point2){
					alert("적립금을 초과하여 사용하실 수 없습니다.");
					$("#allDepositCheckboxV1").prop("checked", false);
				 }else{
				 	$("#point2").text("-" + pointById); //결제 정보 적립금 부분에 text태그 뿌려줌 
				 	$("#totalPrice").text(priceRes + "원"); //포인트가 차감된 전체 금액 text태그 뿌려줌 
				 	$("#pointId").attr("readonly", true);
				 	$("#allDepositCheckboxV2").prop("disabled", true);
				 }	 
			}else{
				$("#totalPrice").text(originprice2 + "원");
				$("#point2").empty();
				$("#pointId").val('');
				$("#pointId").attr("readonly", false);
				$("#pointId").focus();
				$("#allDepositCheckboxV2").prop("disabled", false);
			}
		 }
	</script>
	
	<script type="text/javascript">
    
	function goPopup(){
		
		var popupX = (document.body.offsetWidth / 2) - (570/2);
		var popupY= (document.body.offsetHeight / 2) - (420/2);
		
		 var pop = window.open("RECOREMain/RECOREProduct/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes," + "left=" + popupX + ", top=" + popupY);
	}
	 function payment(){
		
		 if($("input:checkbox[id='agreeV2']").is(":checked") == false){
				alert("동의란을 체크하세요.");
			}else if($("#kakaoV2").prop("checked")==false){
				alert("결제수단을 체크해주세요.");
			}else{
				var winHeight = document.body.clientHeight;	// 현재창의 높이
				var winWidth = document.body.clientWidth;	// 현재창의 너비
				var winX = window.screenLeft;	// 현재창의 x좌표
				var winY = window.screenTop;	// 현재창의 y좌표
				var width = 434;
				var height = 569;

				var popX = winX + (winWidth - 434)/2;
				var popY = winY + (winHeight - 569)/2;
				
				var zipcode1 = $("#zipNo").val();
				var addr1 = $("#roadAddrPart1").val();
				var addr2 = $("#addrDetail").val();
				var accinfo = new Array();
				accinfo = [zipcode1, addr1, addr2];
				//해당하는 계정의 주소를 배열에 담아줌 
				 
				var zeropoint = 0;
				var usingpoint = $("#point").val();
				var pointByClass = $(".pointClass").val();
			
				if($("#allDepositCheckboxV2").is(":checked") == false && $("#allDepositCheckboxV1").is(":checked") == false){
				//적립금 모두 사용 && 사용이 체크되어 있지 않다면 point = 0로 보내기
				
				var url = "Product.do?command=kakaopaycall&pseq="+<%=pvo.getProd_no()%> 
				+ "&acc_no=" + <%=acc.getAcc_no()%> + "&amount=" + <%=amount%> 
				+ "&totalPrice=" + <%=totalPrice%> + "&prod_id=" + <%=prod_id%> + "&acc_addrs=" + accinfo
				+ "&acc_point=" + zeropoint;
				
				window.open(url,"poppay","width="+width+"px,height="+height+"px,top="+popY+",left="+popX+",scrollbars=no");
		
			}else if($("#allDepositCheckboxV2").is(":checked") == true && $("#allDepositCheckboxV1").is(":checked") == false){
				//모두 사용이 체크되어 있고, 사용이 체크되어 있지 않을 때 계정의 포인트 값 보내주기
				
				var url = "Product.do?command=kakaopaycall&pseq="+<%=pvo.getProd_no()%> 
				+ "&acc_no=" + <%=acc.getAcc_no()%> + "&amount=" + <%=amount%> 
				+ "&totalPrice=" + <%=totalPrice%> + "&prod_id=" + <%=prod_id%> + "&acc_addrs=" + accinfo + 
				"&acc_point=" + pointUsing;
				
				window.open(url,"poppay","width="+width+"px,height="+height+"px,top="+popY+",left="+popX+",scrollbars=no");
				
			}else{
				//모두 사용이 체크되어 있지 않고, 사용이 체크되어 있을 때 입력한 포인트 값 보내주기 
				
				var url = "Product.do?command=kakaopaycall&pseq="+<%=pvo.getProd_no()%> 
				+ "&acc_no=" + <%=acc.getAcc_no()%> + "&amount=" + <%=amount%> 
				+ "&totalPrice=" + <%=totalPrice%> + "&prod_id=" + <%=prod_id%> + "&acc_addrs=" + accinfo + 
				"&acc_point=" + pointByClass;
				
				window.open(url,"poppay","width="+width+"px,height="+height+"px,top="+popY+",left="+popX+",scrollbars=no");
				
			}
						
		}
		
	} 
	
	/** API 서비스 제공항목 확대 (2017.02) **/
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
			, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.addrDetail.value = addrDetail;
		document.form.zipNo.value = zipNo;
	}
   
	</script>
		
	
</head>


<body class="series-site V2 layout-width-1000">

	

	<!-- header -->
	<%@ include file="/header.jsp"%>

	<section id="kolon-content">
		<article class="cart-wrap">
			<h3>주문서 작성</h3>
			<ul class="cart-step">
				<span>장바구니</span>
				<span class="active">주문서작성</span>
				<span class="last">주문완료</span>
			</ul>
			
			<div>
				<div class="order-lists">
					<p class="all-select">주문상품(1)</p>
					<table class="table table-order-desktop">
						<colgroup>
							<col width="100px">
							<col>
							<col width="214px">
							<col width="126px">
							<col width="235px">
						</colgroup>
						<thead>
							<tr>
								<th class="text-left">상품정보</th>
								<th>&nbsp;</th>
								<th>판매금액</th>
								<th>수량</th>
								<th>배송방법</th>
							</tr>
						</thead>

						<!-- 장바구니에 담았던 상품 정보 들어감 -->
						
						<tbody>
							<tr>
								<td class="thumb" style=""><a
									href="Product.do?command=ProdDetail&pseq=${pvo.prod_no}&catdno=${pvo.prod_catd}"><img
										src="<%=request.getContextPath()%>/RECOREMain/RECOREProduct/product/${pvo.prod_no}/f_img.png"
										alt=""></a></td>

								<td class="product text-left">
									<!-- @@ 상품 브랜드 @@ -->
									<h4 style="position: relative; top: 20px;">
										${pvo.prod_brand}&nbsp;</h4>
									<p style="width: 600px; position: relative; top: 20px;">
										<a
											href="Product.do?command=ProdDetail&pseq=${pvo.prod_no}&catdno=${pvo.prod_catd}">${pvo.prod_name}</a>
									</p>

									<ul class="meta" style="position: relative; top: 20px;">
										<li><em>수량</em><span id = "amountval"><%=amount%></span></li>
										<li><em>옵션</em>&nbsp; 
										<span id = "optval"> 
										<% for (String c : color) {
										 	out.println(c);
										 	}
										 %>, 
										 <%	for (String s : size) {
										 	out.println(s);
										 	}
										 %>
										 </span>
										 </li>
									</ul>
									<div class="options"></div>
								</td>
								
								<td class="price">
								<fmt:formatNumber><%=totalPrice%>
									</fmt:formatNumber>원</td>
								<!-- @@ 상품 수량 @@ -->
								<td class="range"><%=amount%></td>
								<td class="delivery division" rowspan="1"><div>택배배송</div>
									<div class="cost">배송비 무료</div></td>
							</tr>
						</tbody>
					</table>
				</div>


				<!-- 주문상품 금액 / 배송비 / 총 주문금액 -->
				<div class="billing-v2">
					<div class="default-pay">
						<div>
							<c:set var="sum" value="${pvo.prod_price}"></c:set>
							<strong>주문상품금액</strong>
							<span>
							<fmt:formatNumber><%=totalPrice%></fmt:formatNumber>원
							</span>
						</div>
					</div>
					
					<div class="delivery-cost">
						<div class="before">
							<div>
								<strong>총 배송비</strong><span>0</span>원
							</div>
						</div>
					</div>
					
					<div class="sale-pay">
						<div class="before">
							<div>
								<strong>총 할인금액</strong> <span id="totalDiscounts">0원</span>
							</div>
						</div>
					</div>
					
					<div class="total">
						<div>
							<strong>총 주문금액</strong>
							<span id="totalBasePriceV2">
							<em><fmt:formatNumber><%=totalPrice%>
							</fmt:formatNumber></em>원</span>
						</div>
					</div>
				</div>
			</div>


			<!-- 주문자 정보 입력 -->
			<form id="form" name="form">
			
				<div class="order-write">
					<h5>주문고객 / 배송지 정보</h5>
					<dl class="order-form">
						<dt>주문고객</dt>
						<dd class="user-info">
							<span id="customerNameArea"><%=acc.getAcc_name()%></span>
							<span id="customerMobileNumberArea"><%=acc.getAcc_phone()%></span>
							<span id="customerEmailArea"><%=acc.getAcc_email()%></span>
						</dd>
						<dt class="mb-22">
							받는분<em class="required" aria-required="true">필수</em>
						</dt>
						<dd class="mb-22">
							<div class="col-2">
								<input id = "requiredCus" name="firstName" type="text" placeholder="이름을 입력하세요."
									maxlength="10" value="<%=acc.getAcc_name()%>" readonly = "readonly">
							</div>
						</dd>
						<dt></dt>
						
						<dd class="min-height-auto">
							<div class="col-2 col-3 radio-wrap">
							</div>
						</dd>

						<div style="display: block;">
							<dt>
								우편번호<em class="required" aria-required="true">필수</em>
							</dt>
							<dd>
								<div class="row">
									<div class="col-2">
										<input type="hidden" id="confmKey" name="confmKey" value="">
										<input type="text" id="zipNo" name="zipNo" 
										value = "<%=acc.getAcc_zipcode() %>" placeholder="우편번호" readonly="readonly"/>
									</div>
									<div class="col-3">
										<button type="button" class="btn btn-line btn-small"
											style="background-color: #A0D9D9; color: white;"
											onclick="goPopup();">우편번호찾기</button>
									</div>
								</div>
								<div class="row">
									<input type="text" id="roadAddrPart1" name="roadAddrPart1"
										class="inputTypeText" placeholder="도로명주소" readonly="readonly"
										value="<%=acc.getAcc_addr() %>" />
								</div>
								<div class="row">
									<input type="text" id="addrDetail" name="addrDetail"
										placeholder="상세주소" value="<%=acc.getAcc_addr2() %>" readonly="readonly"/>
								</div>
							</dd>
						</div>
						<div class="addr-cvs" style="display: none;">
							<dt>
								주소<em class="required" aria-required="true">필수</em>
							</dt>
							<dd>
								<div class="row"></div>
							</dd>
						</div>


						<!-- 휴대폰/전화번호/배송메모 입력받는 폼 -->
						<dt>
							휴대폰<em class="required" aria-required="true">필수</em>
						</dt>
						<dd>
							<div class="col-phone">
								<input type="hidden" name="cellPhone"> 
								<select name="cellPhone1">
									<option value="010">010</option>
								</select> 
								<input name="cellPhone2" type="tel" maxlength="4" readonly="readonly"
								value="<%=arr[1] %>" onKeyup = "phone"> 
								<input name="cellPhone3" type="tel" maxlength="4" value="<%=arr[2]%>"
								readonly="readonly">
							</div>
						</dd>

					</dl>
				</div>
				</form>
			<!-- 포인트 사용 -->
				<form onsubmit="return false">
				<div class="order-write sale-select">
					<br>
					<dt>적립금</dt>
					<div>
						<input type="text" maxlength = "5" id = "pointId" class = "pointClass" 
						name = "pointName" style="text-align: right;" placeholder = "<%=acc.getAcc_point() %>" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						
						<span class="checkbox">
						<input name="allDepositCheckbox" type="checkbox" onclick = "getpointValues();" id="allDepositCheckboxV1"><i></i>
						</span>
						<label for="allDepositCheckboxV1">사용</label>
						
						
						<span class="checkbox">
						<input name="allDepositCheckbox" type="checkbox" id="allDepositCheckboxV2"><i></i>
						</span>
						<label for="allDepositCheckboxV2">모두사용</label>
						
					</div>
					<c:set var = "pointusing" value = "${vo.acc_point}"></c:set>
					<input type = "hidden" id = "point" name = "point" value = "${pointusing}"/>
					<input type = "hidden" id = "total" name = "total" value = "<%=totalPrice%>"/>
				
			</form>
 

			<!-- 결제수단 선택 폼 -->
			 <form>
				<div class="order-info" id="paymentMethodAreaV2">
					<div class="way">
						<h5>결제수단선택</h5>
						<ul id="paymentMethodListAreaV2">

							<li><input type="radio" id="kakaoV2" name="paymentMethod"
								value="KAKAOPAY"><label for="kakaoV2" class="kakao">카카오페이</label></li>
						</ul>
					
					<!-- 	<span class="checkbox keep-payment"> 
						<input name="keepPayment" type="checkbox" id="keepPayment" value="">
							<i></i>
						</span> 
						<label for="keepPayment">지금 선택한 결제수단을 다음에도 사용</label> -->
					</div>

					<div class="kakao" id="info" style="display: none;">
						<h5>카카오페이 안내</h5>
						<ul class="bul-list">
							<li>카카오페이 결제 시 공인인증서 없이 30만원 이상 결제 가능합니다.</li>
							<li>카카오톡 안에서 개인카드(신용/체크)를 등록하여 다양한 곳에서 결제 시 간단하게 비밀번호만으로<br>
								결제할 수 있는 모바일 결제서비스입니다.
							</li>
							<li>본인명의 핸드폰에서 본인명의 카드로만 등록 후 사용 가능합니다.</li>
						</ul>
					</div>


					<!-- 신용카드 이용안내 폼 -->

					<div class="way-info01">
						<br>
						<br>
						<div class="card01" style="display: block;">
							<br>
							<br>
							<br>
							<br>
							<h5 style="text-align: center;">신용카드 이용안내</h5>
							<br>
							<dl>
								<dt style="text-align: center;">무이자 할부</dt>
								<dd>
									<ul style="position: center;">
										<li><span class="thumb"><img
												src="//s3-ap-northeast-2.amazonaws.com/kop.images/Comm_Img/card/card41.gif"
												alt="신한카드"></span><span class="txt">5만원이상 2~6개월 무이자할부</span></li>
										<li><span class="thumb"><img
												src="//s3-ap-northeast-2.amazonaws.com/kop.images/Comm_Img/card/card51.gif"
												alt="삼성카드"></span><span class="txt">5만원이상 2~6개월 무이자할부</span></li>
										<li><span class="thumb"><img
												src="//s3-ap-northeast-2.amazonaws.com/kop.images/Comm_Img/card/card61.gif"
												alt="현대카드"></span><span class="txt">5만원이상 2~6개월 무이자할부</span></li>
										<li><span class="thumb"><img
												src="//s3-ap-northeast-2.amazonaws.com/kop.images/Comm_Img/card/card31.gif"
												alt="BC카드"></span><span class="txt">5만원이상 2~6개월 무이자할부</span></li>
										<li><span class="thumb"><img
												src="//s3-ap-northeast-2.amazonaws.com/kop.images/Comm_Img/card/card91.gif"
												alt="NH카드"></span><span class="txt">5만원이상 2~6개월 무이자할부</span></li>
										<li><span class="thumb"><img
												src="//s3-ap-northeast-2.amazonaws.com/kop.images/Comm_Img/card/card32.gif"
												alt="하나SK카드"></span><span class="txt">5만원이상 2~6개월
												무이자할부</span></li>
										<li><span class="thumb"><img
												src="//s3-ap-northeast-2.amazonaws.com/kop.images/Comm_Img/card/card11.gif"
												alt="국민카드"></span><span class="txt">5만원이상 2~5개월 무이자할부</span></li>
										<li><span class="thumb"><img
												src="//s3-ap-northeast-2.amazonaws.com/kop.images/Comm_Img/card/card35.gif"
												alt="전북카드"></span><span class="txt">5만원이상 2~3개월 무이자할부</span></li>
									</ul>
								</dd>
								<dt style="text-align: center;">즉시할인</dt>
								<dd>
									<ul>
										<li><span class="thumb"><img
												src="//s3-ap-northeast-2.amazonaws.com/kop.images/Comm_Img/card/card11.gif"
												alt="국민카드"></span><span class="txt">30만원 이상 결제 시
												20,000원 즉시 할인(선착순 1,500명 혜택 적용)</span></li>
									</ul>
								</dd>
							</dl>
						</div>
					</div>
				</div>
			</form>


			<!-- 오른쪽에 뜨는 결제 정보 폼 -->
			<form id="form2" name="form2">
				
				<div style="min-height: 771.063px;" id="paymentform">
					<div class="react-sticky" style="transform: translateZ(0px);">
						<article class="sticky-menu"
							style="position: relative; bottom: 800px; margin-top: 110px;">


							<div class="sticky-bill">

								<h1>결제정보</h1>
								<div class="default-pay">
									<div>
										<strong>주문상품금액</strong>
										<span>
										<fmt:formatNumber><%=totalPrice%>
										</fmt:formatNumber><em>원</em></span>
									</div>
								</div>
								<div class="sale-pay">

									<div>
										<strong>총 보유금 사용</strong>
										<span id = "point2"></span>
									</div>
								</div>
								
								<div class="delivery-cost">
									<div>
										<strong>총 배송비</strong><span>0<em>원</em></span>
									</div>
								</div>
								
								<div class="total">
									<div>
										<strong>총 결제예정금액</strong> 
										<span id="totalPrice">
										<fmt:formatNumber><%=totalPrice%></fmt:formatNumber>원
										</span>
									</div>
								</div>
							</div>

							<!-- 주문 동의 -->

							<div class="order-agree">
								<h5>주문동의</h5>
								<p>
									주문할 상품의 상품명, 상품가격, 배송정보를 확인하였으며, 구매에 동의하시겠습니까?<br>(전자상거래법
									제8조 제2항)
								</p>
								<p class="">주문제작상품의 경우, 교환/반품이 불가능 하다는 내용을 확인하였으며 이에 동의합니다.</p>
								<span class="checkbox"> 
								<input type="checkbox" id="agreeV2" value="" required="required"> 
								<i></i>
								</span> 
								<label for="agreeV2">동의합니다.</label>
								<div class="buttons end-row">
									<button type="button" value=""
										class="ladda-button btn btn-order btn-big" id="checkout"
										data-style="zoom-in" onclick="payment();">결제하기</button>
										
									<div class="ladda-progress" style="width: 0px;"></div>
								</div>
							</div>
						</article>
					</div>
				</div>
			</form>
		</article>
	</section>

</body>
</html>