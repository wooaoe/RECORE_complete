<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ page import="com.mvc.vo.Vo_QnA" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RECORE &mdash; BOARD LIST</title>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/RECOREMain/RECOREMypage/cssMy/Mypage_BoardList2_CSS.css"/>
	
	<meta charset="utf-8">
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
  
  ol{
    padding-inline-start: 0px;
  }
  thead {
  	text-align: center;
  }
  
  a:link { color: black; text-decoration: none;}
  a:visited { color: black; text-decoration: none;}
   html{
  	scroll-behavior : smooth;
  }
  </style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	
	function pageMove(pageNo){ //페이징
		location.href = "mypage.do?command=boardlist&pageno="+pageNo;
	}
	
	function searchBoard(){ //검색
		var catd = $("#search_key option:selected").val();
		var keyword = $("#searchval").val();
		location.href = "mypage.do?command=searchboard&catd="+catd+"&keyword="+keyword+"&pageno=1";
	}
	
	/* function selectList(){
		var catd = $("#board_sort option:selected").val();
		location.href = "mypage.do?command=boardselect&pageno=1&catd="+catd;
	} */
</script>

</head>
<body id="body">
<%
	Vo_Account acc = (Vo_Account)session.getAttribute("vo");
%>
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
				        <li title="현재 위치"><strong>게시물 관리</strong></li>
				    </ol>
				 </div>
	
				<div class="titleArea">
				    <h2>게시물 관리</h2>
				</div>
	
				<div class="xans-element- xans-myshop xans-myshop-boardpackage ">
					<!-- <div class="xans-element- xans-myshop xans-myshop-boardlisthead ">
						<p>분류 선택 
							<select id="board_sort" name="board_sort" fw-filter="" fw-label="" fw-msg="" onchange="selectList();">
								<option value="CATD_NO">분류별</option>
								<option value="QNA_REGDATE">작성 일자별</option>
							</select>
						</p>
					</div> -->
					<div class="xans-element- xans-myshop xans-myshop-boardlist ec-base-table typeList gBorder gBlank10">
						<table border="1" summary="">
							<%-- <caption>게시물 관리 목록</caption> --%>
	       				 	<colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
	       				 		<col style="width:70px;">
								<col style="width:135px;">
								<col style="width:auto;">
								<col style="width:84px;">
								<col style="width:80px;">
								<col style="width:55px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
					                <th scope="col">분류</th>
					                <th scope="col">제목</th>
					                <th scope="col">작성자</th>
					                <th scope="col">작성일</th>
					                <th scope="col">조회</th>
					            </tr>
					        </thead>
							<tbody class=" center">
							<c:if test="${null eq list_qna}">
								<tr><td colspan="6"><p class="message" style="border:0px">게시물이 없습니다.</p></td></tr>
							</c:if>
							<c:if test="${null ne list_qna}">
							<c:forEach var="qna" items="${list_qna}" begin="${(page.rowContent * page.pageNo) - page.rowContent}" end="${(page.rowContent * page.pageNo) - 1}">
								<tr class="xans-record-">
									<td>${qna.qna_no}</td>
					                <td>
					                	<a href="/board/상품문의/6/" class="txtEm">
					                		<c:if test="${14 eq qna.catd_no}">배송문의</c:if>
					                		<c:if test="${15 eq qna.catd_no}">취소/교환/환불문의</c:if>
					                		<c:if test="${16 eq qna.catd_no}">상품문의</c:if>
					                	</a>
					                </td>
					                <td class="left subject">
					                	<img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif" alt="비밀글" class="ec-common-rwd-image"> 
					                	<a href="mypage.do?command=boarddetail&qnano=${qna.qna_no}&catdno=${qna.catd_no}">${qna.qna_title}</a> 
					                </td>
					                <td><%=acc.getAcc_name()%></td>
					                <td><span class="txtNum">${qna.qna_regdate}</span></td>
					                <td><span class="txtNum">${qna.qna_view_count}</span></td>
					            </tr>
				            </c:forEach>
					        </c:if>
							</tbody>
						</table>
					</div>
				</div>
	
				<div class="xans-element- xans-myshop xans-myshop-boardlistpaging ec-base-paginate">
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
				
				<!-- 검색 -->
				<form id="boardSearchForm" name="" action="" method="get" target="" onsubmit="return false" enctype="multipart/form-data">
					<!-- <input type="hidden" value="00"> -->
					<div class="xans-element- xans-myshop xans-myshop-boardlistsearch ">
						<fieldset class="boardSearch">
							<legend>게시물 검색</legend>
	        					<p>
	        						<select id="search_key" name="search_key" fw-filter="" fw-label="" fw-msg="">
										<option value="QNA_TITLE">제목</option>
										<option value="QNA_CONTENT">내용</option>
									</select> 
									<input id="searchval" name="search" fw-filter="" fw-label="" fw-msg="" class="inputTypeText" placeholder="" type="text"> 
									<a href="#none" class="btnEmFix" onclick="searchBoard();">찾기</a>
								</p>
	    				</fieldset>
					</div>
				</form>    
			</div><!-- content 끝@@@@ -->
			<hr class="layout">
			
		<!-- footer -->
		<%@ include file="/footer.jsp" %>
		</div>
	</div>
</body>
</html>