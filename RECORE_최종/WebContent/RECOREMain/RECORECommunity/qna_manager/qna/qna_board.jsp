<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.mvc.vo.Vo_Account" %>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- UserSession --%>
<%Vo_Account vo = (Vo_Account) session.getAttribute("vo");%>
<%-- category --%>
<% String catd = request.getParameter("catd"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RECORE - QNA</title>

<%-- css --%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/RECOREMain/RECORECommunity/qna_manager/qna/css/qna.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<jsp:include page="/head.jsp"></jsp:include>

</head>
<body id="body">
	<header>
		<jsp:include page="/header.jsp"></jsp:include>
	</header>
	<section style="margin: 100px 0 100px 0px;">
		<section class="section-container">
			<div class="row" style="width:100%;">
				<div class="col-md-2 col-xs-0"></div>
				<div class="col-md-8 col-xs-12">
					<div class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002 ">
						<div class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 reviewTitlee ">
							<h2>
								<span>고객센터</span>
							</h2>
						</div>
						<%-- menu --%>
						<div class="review_menuCategory">
							<ul class="" style="cursor: pointer;">
							<c:set var="category" value="<%=catd %>" />
							<c:choose>
								<c:when test="${category eq 'all'}">
									<li id="all" value="all" class="selected"><a >전체<span class="bar"></span></a></li>
									<li id="product" value="product" class=""><a >상품문의<span class="bar"></span></a></li>
									<li id="delivery" value="delivery" class=""><a >배송문의<span class="bar"></span></a></li>
									<li value="etc" class=""><a >취소/교환/반품문의<span class="bar"></span></a></li>
								</c:when>
								<c:when test="${category eq 'product'}">
									<li id="all" value="all" class=""><a >전체<span class="bar"></span></a></li>
									<li id="product" value="product" class="selected"><a >상품문의<span class="bar"></span></a></li>
									<li id="delivery" value="delivery" class=""><a >배송문의<span class="bar"></span></a></li>
									<li id="etc" value="etc" class=""><a >취소/교환/반품문의<span class="bar"></span></a></li>
								</c:when>
								<c:when test="${category eq 'delivery'}">
									<li id="all" value="all" class=""><a >전체<span class="bar"></span></a></li>
									<li id="product" value="product" class=""><a >상품문의<span class="bar"></span></a></li>
									<li id="delivery" value="delivery" class="selected"><a >배송문의<span class="bar"></span></a></li>
									<li id= "etc" value="etc" class=""><a >취소/교환/반품문의<span class="bar"></span></a></li>
								</c:when>
								<c:otherwise>
									<li id="all" value="all" class=""><a >전체<span class="bar"></span></a></li>
									<li id="product" value="product" class=""><a >상품문의<span class="bar"></span></a></li>
									<li id="delivery" value="delivery" class=""><a >배송문의<span class="bar"></span></a></li>
									<li id="etc" value="etc" class="selected"><a >취소/교환/반품문의<span class="bar"></span></a></li>
								</c:otherwise>
							</c:choose>
								<%-- <li><a href="<%=request.getContextPath()%>/manager.do?command=manager_product&catd=all">Manager</a></li> --%>
							</ul>
						</div>
						<%-- board --%>
						<div class="ec-base-table typeList gBorder">
							<table id="content_table" border="1" summary="">
								<caption>게시판 목록</caption>
								<colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
									<col style="width: 70px;">
									<col style="width: 135px;" class="">
									<col style="width: auto;">
									<col style="width: 84px;">
									<col style="width: 77px;" class="">
									<col style="width: 55px;" class="">
									<col style="width: 55px;" class="displaynone">
									<col style="width: 80px;" class="displaynone">
								</colgroup>
								<thead class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 text-center">
									<tr style="">
										<th scope="col" class="">번호</th>
										<th scope="col" class="">카테고리</th>
										<th scope="col" class="">제목</th>
										<th scope="col" class="">작성자</th>
										<th scope="col" class="">작성일</th>
										<th scope="col" class="">조회</th>
										<th scope="col" class="displaynone">추천</th>
										<th scope="col" class="displaynone">평점</th>
									</tr>
								</thead>
								<%-- list --%>
								<tbody class="xans-element- xans-board xans-board-list-1002 xans-board-list xans-board-1002 center boardCursor">
									<c:choose>
										<c:when test="${empty list }">
											<tr>
												<td colspan="8">작성된 글이 존재하지 않습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="list" items="${list }" >
												<tr style="background-color: #FFFFFF; color: #555555;" class="xans-record-">
													<c:choose>
														<c:when test="${list.qna_re_yn eq 'Y'}">
															<td class="title">&nbsp;</td>
														</c:when>
														<c:otherwise>
															<td class="title">${list.qna_no}</td>
														</c:otherwise>
													</c:choose>
															
													<c:choose>
														<c:when test="${list.catd_no eq 14 && list.qna_re_yn eq 'N'}">
															<td  class="title">배송</td>
														</c:when>
														<c:when test="${list.catd_no eq 15 && list.qna_re_yn eq 'N'}">
															<td  class="title">취소/교환/환불</td>
														</c:when>
														<c:when test="${list.catd_no eq 16 && list.qna_re_yn eq 'N'}">
															<td  class="title">상품</td>
														</c:when>
														<c:otherwise>
															<td  class="title">&nbsp;</td>
														</c:otherwise>
													</c:choose>
													
													<c:choose>
														<c:when test="${list.qna_re_yn eq 'Y' }">
															<td class="title subject left txtBreak">
																<img src="RECOREMain/RECORECommunity/qna_manager/qna/images/board/neo_reply.gif">&nbsp;&nbsp;${list.qna_title }<span class="txtEm"></span></td>
														</c:when>
														<c:otherwise>
															<td class="title subject left txtBreak">${list.qna_title }<span class="txtEm"></span></td>
														</c:otherwise>
													</c:choose>
												  <c:choose>
			                                          <c:when test="${list.qna_re_yn eq 'Y' }">
			                                             <td class="title">관리자</td>
			                                          </c:when>
			                                          <c:otherwise>
			                                             <td class="title">${list.qna_acc_id }</td>
			                                          </c:otherwise>
			                                       </c:choose>
													<td class="title"><span class="txtNum">${list.qna_regdate }</span></td>
													<td class="title"><span class="txtNum" id="${list.qna_no}">${list.qna_view_count }</span></td>
													<td class="title displaynone"><span class="txtNum">0</span></td>
													<td class="title displaynone">
														<img src="https://img.echosting.cafe24.com/skin/base/board/ico_point0.gif" alt="0점">
													</td>
												</tr>
												<tr>
													<td colspan="6" class="conts" style="text-align: left; color: rgb(70, 70, 70); font-family: sand; font-size: 12px;">
														<div style="padding: 30px;">
																${list.qna_content}
														</div>
														<p style="padding-right: 20px; text-align: right;" >
															<c:choose>
																<c:when test="${vo.acc_id eq list.qna_acc_id && list.qna_re_yn eq 'N'}">
																	<input class="btnEmFix" type="button" value="수정" onclick="location.href='qna.do?command=qna_updateform&qna_no=${list.qna_no}'" style="cursor:pointer">
																	<input class="btnEmFix" type="button" value="삭제" onclick="location.href='qna.do?command=qna_delete&qna_no=${list.qna_no}&reply=y'" style="cursor:pointer" >
																</c:when>
															</c:choose>
															<c:choose>
																<c:when test="${vo.acc_id eq 'm1' && list.qna_re_yn eq 'Y'}">
																	<input class="btnEmFix" type="button" value="답글수정" onclick="location.href='qna.do?command=qna_answerupdateform&qna_no=${list.qna_no}'" style="cursor:pointer">
																	<input class="btnEmFix" type="button" value="삭제" onclick="location.href='qna.do?command=qna_delete&qna_no=${list.qna_no}&reply=n'" style="cursor:pointer">
																</c:when>
															</c:choose>
															
															<c:choose>
																<c:when test="${vo.acc_id eq 'm1' && list.qna_re_yn eq 'N'}">
																	<input class="btnEmFix" type="button" value="답글" onclick="location.href='qna.do?command=qna_answerwriteform&qna_pno=${list.qna_no}'" style="cursor:pointer">
																</c:when>
															</c:choose>
														</p>
													</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>
							
					<c:choose>
						<c:when test="${not empty vo}">
							<div style="text-align: right;">
								<input class="btnEmFix" type="button" value="글쓰기" onclick="location.href='qna.do?command=qna_writeform'" style="cursor:pointer">
							</div>
						</c:when>
					</c:choose> 
					
					<%-- paging --%>
					<jsp:include page="/RECOREMain/RECORECommunity/qna_manager/qna/qna_paging.jsp">
					    <jsp:param value="${paging.page}" name="page"/>
					    <jsp:param value="${paging.beginPage}" name="beginPage"/>
					    <jsp:param value="${paging.endPage}" name="endPage"/>
					    <jsp:param value="${paging.prev}" name="prev"/>
					    <jsp:param value="${paging.next}" name="next"/>
					</jsp:include>

					<%-- search --%>
					<div class="xans-element- xans-board xans-board-search-1002 xans-board-search xans-board-1002 ">
						<form action="qna.do" method="post" >
							<input type="hidden" name="command" value="qna_list">
							<input type="hidden" name="catd" value="<%=catd %>">
							<fieldset class="boardSearch">
								<legend>게시물 검색</legend>
								<p>
									<select name="searchsubject">
										<option value="QNA_TITLE" selected="selected">제목</option>
										<option value="ACC_ID">작성자</option>
									</select> 
									<input id="keyword" name="keyword" class="inputTypeText" placeholder="" value="" type="text"></input>
									<button id="searchbt" class="btnEmFix" type="submit" onclick="">찾기</button>
								</p>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-xs-0"></div>
		</section>
	</section>

	<%-- footer --%>
	<jsp:include page="/footer.jsp"></jsp:include>
	
	<%-- script --%>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js "></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/RECOREMain/RECORECommunity/qna_manager/qna/js/qna.js"></script>
	<script src="<%=request.getContextPath()%>/RECOREMain/js/jquery-3.3.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/RECOREMain/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/RECOREMain/js/jquery-ui.js"></script>
	<script src="<%=request.getContextPath()%>/RECOREMain/js/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/RECOREMain/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/RECOREMain/js/owl.carousel.min.js"></script>
	<script src="<%=request.getContextPath()%>/RECOREMain/js/jquery.stellar.min.js"></script>
	<script src="<%=request.getContextPath()%>/RECOREMain/js/jquery.countdown.min.js"></script>
	<script src="<%=request.getContextPath()%>/RECOREMain/js/jquery.magnific-popup.min.js"></script>
	<script src="<%=request.getContextPath()%>/RECOREMain/js/bootstrap-datepicker.min.js"></script>
	<script src="<%=request.getContextPath()%>/RECOREMain/js/aos.js"></script>
	<script src="<%=request.getContextPath()%>/RECOREMain/js/main.js"></script>
</body>
</html>