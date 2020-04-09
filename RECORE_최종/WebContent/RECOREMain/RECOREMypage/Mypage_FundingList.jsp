<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RECORE &mdash; FUNDING LIST</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/RECOREMain/RECOREMypage/cssMy/Mypage_OrderList_CSS.css"/>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900"> 
   <link rel="stylesheet" href="<%=request.getContextPath()%>/RECOREMain/fonts/icomoon/style.css">

   <link rel="stylesheet" href="<%=request.getContextPath()%>/RECOREMain/css/magnific-popup.css">
   <link rel="stylesheet" href="<%=request.getContextPath()%>/RECOREMain/css/jquery-ui.css">
   <link rel="stylesheet" href="<%=request.getContextPath()%>/RECOREMain/css/owl.carousel.min.css">
   <link rel="stylesheet" href="<%=request.getContextPath()%>/RECOREMain/css/owl.theme.default.min.css">
   <link rel="stylesheet" href="<%=request.getContextPath()%>/RECOREMain/css/bootstrap-datepicker.css">
    
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/RECOREMain/fonts/flaticon/font/flaticon.css">
  
    <link rel="stylesheet" href="<%=request.getContextPath()%>/RECOREMain/css/aos.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/RECOREMain/RECOREMypage/cssMain/styleMy.css">
	<!-- @@ RECORE favicon @@  -->
    <link rel="icon" href="<%=request.getContextPath()%>/images/recorefavi.png">

<style type="text/css">
  
  .testpadding{
  	padding: 40px;
  }
  
  .navtest{
  	text-align:center;
  	padding: 10px;
  }
  
  .footertest{
  	background-color: #333333;
  	text-align: center;
  	padding: 0.5em 0;
  }
  
  #productInfo{
  	text-align: center;
  	color: black;
  }
  
  #logResMy{
  	margin-left: 300px;
  	position: relative;
  	top: 50%;
  }
  
  thead{
  	text-align: center;
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
	.path ol {
	    float: right;
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
	.path li strong, .path li strong a {
	    color: #2e2e2e;
	}
  
  a:link { color: black; text-decoration: none;}
  a:visited { color: black; text-decoration: none;}
   html{
  	scroll-behavior : smooth;
  }
  
  </style>

<script type="text/javascript">
	function pageMove(pageNo){
		location.href = "mypage.do?command=fundinglist&pageno="+pageNo;
	}
</script>

</head>

<body id="body">


	<!-- header -->
	<%@ include file="/header.jsp" %>
	
	

	<div id="wrap">
	    <div id="container">
	    
	        <div id="content" style="margin-top: 100px;">
	        
	    		<div class="path">
				    <span>현재 위치</span>
				    <ol>
				    	<li><a href="issue.do?command=main">홈</a></li>
				        <li><a href="mypage.do?command=main">마이쇼핑</a></li>
				        <li title="현재 위치"><strong>펀딩내역 조회</strong></li>
				    </ol>
				</div>
				
				<div class="titleArea">
				    <h2>펀딩조회</h2>
				</div>
				
				<!-- 주문내역 or 취소환불내역 선택 -->
				<div class="xans-element- xans-myshop xans-myshop-orderhistorytab ec-base-tab ">
					<ul class="menu">
						<li class="selected">
							<a href="mypage.do?command=fundinglist&pageno=1">펀딩내역조회 (${list_fun_d.size()})</a>
						</li>
				    </ul>
				</div>
				
				<!-- 날짜 선택 -->
				<form method="GET" id="OrderHistoryForm" name="OrderHistoryForm">
					<div class="xans-element- xans-myshop xans-myshop-orderhistoryhead ">
						<!-- <fieldset class="ec-base-box">
							<legend>검색기간설정</legend>
							
							주문처리 상태
					        <div class="stateSelect ">
					            <select id="order_status" name="order_status" class="fSelect">
									<option value="all">전체 펀딩상태</option>
									<option value="shipped_before">펀딩성공</option>
									<option value="shipped_standby">펀딩실패</option>
								</select>        
							</div>
							기간 선택
					        <span class="period">
					            <a href="#none" class="btnNormal" days="00"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1.gif" offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1.gif" onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1_on.gif" alt="오늘"></a>
					            <a href="#none" class="btnNormal" days="07"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2.gif" offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2.gif" onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2_on.gif" alt="1주일"></a>
					            <a href="#none" class="btnNormal" days="30"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3.gif" offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3.gif" onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3_on.gif" alt="1개월"></a>
					            <a href="#none" class="btnNormal" days="90"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4.gif" offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4.gif" onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4_on.gif" alt="3개월"></a>
					            <a href="#none" class="btnNormal" days="180"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5.gif" offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5.gif" onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5_on.gif" alt="6개월"></a>
					        </span>
					        
					        달력 선택
					        <input id="history_start_date" name="history_start_date" class="fText hasDatepicker" readonly="readonly" size="10" value="2019-09-19" type="text">
					        <button type="button" class="ui-datepicker-trigger"><img src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif" alt="..." title="..."></button> ~ <input id="history_end_date" name="history_end_date" class="fText hasDatepicker" readonly="readonly" size="10" value="2019-12-18" type="text">
					        <button type="button" class="ui-datepicker-trigger">
					        <img src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif" alt="..." title="..."></button>        
					        <input alt="조회" id="order_search_btn" type="image" src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/btn_search.gif">    
				        </fieldset> -->
				        
						<ul>
							<!-- <li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 펀딩내역을 조회하실 수 있습니다.</li> -->
							<li>기본적으로 최근 3개월간의 자료가 조회되며, 3개월 이후 펀딩내역은 QnA게시판을 통해 문의하시기 바랍니다.</li>
					        <li>펀딩번호를 클릭하시면 해당 펀딩에 대한 상세내역을 확인하실 수 있습니다.</li>
					    </ul>
					</div>
					<input id="mode" name="mode" value="" type="hidden">
					<input id="term" name="term" value="" type="hidden">
				</form>
				
				<!-- 주문 상품 정보 -->
				<div class="xans-element- xans-myshop xans-myshop-orderhistorylistitem ec-base-table typeList">
					<div class="title">
				    	<h3>펀딩 참여 정보</h3>
				    </div>
				    
					<table border="1" summary="">
						<!-- <caption>펀딩 참여 정보</caption> -->
				        <colgroup>
							<col style="width:135px;">
							<col style="width:93px;">
							<col style="width:auto;">
							<col style="width:61px;">
							<col style="width:111px;">
							<col style="width:111px;">
							<!-- <col style="width:111px;"> -->
						</colgroup>
						<thead>
							<tr>
								<th scope="col">참여번호</th>
				                <th scope="col">이미지</th>
				                <th scope="col">펀딩정보</th>
				                <th scope="col">수량</th>
				                <th scope="col">펀딩참여금액</th>
				                <th scope="col">펀딩성공여부</th>
				                <!-- <th scope="col">취소/교환/반품</th> -->
				            </tr>
			            </thead>
						<tbody class="center">
						<c:if test="${null eq list_fun_d}"> <!-- 펀딩내역이 없을 때 -->
							<tr><td colspan="6"><p class="message" style="border:0px;">펀딩 내역이 없습니다.</p></td></tr>
						</c:if>
						<c:if test="${null ne list_fun_d}"> <!-- 펀딩내역이 있을 때 -->
						<c:set var="count" value="0"></c:set>
						<c:forEach var="fun" varStatus="status" items="${list_fun_d}" begin="${(page.rowContent * page.pageNo) - page.rowContent}" end="${(page.rowContent * page.pageNo) - 1}">
							<tr class="">
								<td class="number">
				                	<!-- <p></p> -->
						            <p>[${fun.fpm_no}]</p>
				                    <!-- <a href="#none" class="btnNormal displaynone" onclick="">펀딩취소</a> --> 
				                </td>
				                <td class="thumb">
				                	<a href="funding.do?command=selectOneFunding&fund_no=${fun.fund_no}&pageno=1">
				                	<img src="<%=request.getContextPath()%>/RECOREMain/RECOREFunding/images/${fun.fund_no}/f_img.png"></a>
			                	</td>
				                <td class="product left top">
				                    <strong class="name"><br>
				                    		<a href="funding.do?command=selectOneFunding&fund_no=${fun.fund_no}&pageno=1">
						                    	<c:if test="${fun.fund_no eq list_fun[status.index].fund_no}">
						                    		${list_fun[status.index].fund_title}
						                    	</c:if>
				                    		</a>
				                    </strong>
				                </td>
				                <td>1개</td>
				                <td class="right">
									<strong></strong>
									<fmt:formatNumber value="${fun.fpm_price}" groupingUsed="true"></fmt:formatNumber>원
								</td>
				                <td>
				                    <!-- <p class=""><a href="#none" class="btnNormal" onclick="">상세정보</a></p> -->
				                    <c:if test="${list_fun_d[status.index].fund_no eq list_fun[status.index].fund_no}">
				                    	<c:if test="${list_fun[status.index].fund_sof eq 'F'}">실패</c:if>
				                    	<c:if test="${list_fun[status.index].fund_sof eq 'S'}">성공</c:if>
				                    </c:if>
				                </td>
				                <c:set var="count" value="${count+1}"></c:set>
				            </tr>
				        </c:forEach>
				        </c:if>
						</tbody>
					</table>
				</div>
	
				<div class="xans-element- xans-myshop xans-myshop-orderhistorypaging ec-base-paginate">
					<a href="javascript:pageMove(${page.firstPageNo})" class="first">
						<img src="//img.echosting.cafe24.com/skin/base/common/btn_page_first.gif" alt="첫 페이지">
					</a>
					<a href="javascript:pageMove(${page.prevPageNo})">
						<img src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif" alt="이전 페이지">
					</a>
					<ol>
						<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
							<li class="xans-record-">
								<c:choose>
								<c:when test="${page.pageNo eq i}">
									<a href="javascript:pageMove(${i})" class="" style="padding-bottom: 6px; border-bottom: 3px solid #495164; color: #495164;">${i}</a>
								</c:when>
								<c:otherwise>
									<a href="javascript:pageMove(${i})" class="">${i}</a>
								</c:otherwise>
								</c:choose>
							</li>
						</c:forEach>
				    </ol>
					<a href="javascript:pageMove(${page.nextPageNo})">
						<img src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif" alt="다음 페이지">
					</a>
					<a href="javascript:pageMove(${page.lastPageNo})" class="last">
						<img src="//img.echosting.cafe24.com/skin/base/common/btn_page_last.gif" alt="마지막 페이지">
					</a>
				</div>
			</div>
        </div>
	</div>
	       <hr class="layout">
	        
	       <!-- footer -->
		<%@ include file="/footer.jsp" %>
		
	
</body>
</html>