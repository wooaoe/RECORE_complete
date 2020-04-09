<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%	request.setCharacterEncoding("UTF-8");%>
<% 	response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import = "java.util.List" %>
<%@ page import = "com.mvc.vo.Vo_Product" %>
<%@ page import = "com.mvc.vo.Vo_Prod_option" %>
<%@ page import = "com.mvc.vo.Vo_Account" %>
<%@ page import = "com.mvc.vo.Vo_QnA" %> <!-- qna -->
<%@ page import="com.mvc.vo.Vo_Review"%> <!-- review -->
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>

	<% Vo_Product pvo = (Vo_Product)request.getAttribute("pvo"); %>
	<% List<Vo_Product> plist = (List)request.getAttribute("plist"); %>
	<% List<Vo_Product> toplist = (List)request.getAttribute("toplist"); %>
	<% List<Vo_Prod_option> povo = (List)request.getAttribute("povo"); %>
	<% Vo_Account acc = (Vo_Account)session.getAttribute("vo"); %> 
	
	<!-- qna 글 -->
   	<% List<Vo_QnA> qnalist = (List)request.getAttribute("qnalist"); %>
   	<!-- 리뷰글 -->
    <% List<Vo_Review> reviewlist = (List)request.getAttribute("reviewlist"); %>
	
	<%! String url; %>
	<%! int catdno;  %>
	<% if(pvo.getProd_catd() == 6 || pvo.getProd_catd() == 7 || pvo.getProd_catd() == 8 ||
		  pvo.getProd_catd() == 9 || pvo.getProd_catd() == 10 || pvo.getProd_catd() == 11 ||
		  pvo.getProd_catd() == 12){ %>
	<% url = "ChildSelectAll"; %>
	<% } %>
	
<!DOCTYPE html>
<html class="no-js">
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

	<!-- @@ RECORE favicon @@  -->
	<link rel="icon" href="<%=request.getContextPath()%>/images/recorefavi.png">

<%@ include file="/headP.jsp"%>


<!-- 임의로 스타일 적용하기 -->
<style type="text/css">
	
	.testpadding {
		padding: 80px;
	}
	
	#productInfo {
		text-align: center;
		color: black;
	}
	
	#frontimg {
		width: 445px;
		height: 100%;
	}
	
	@font-face {
		font-family: 'Noto Sans Kannada', sans-serif;
		src: url("//fonts.googleapis.com/earlyaccess/notosanskannada.css") format("truetype");
		font-style: normal;
		font-weight: normal;
	}
	
	ul{
		font-family: 'Noto Sans Kannada', sans-serif;
	    font-size: 18px; 
	}
	html{
		scroll-behavior: smooth;
	}
	#img-fluid{
    	max-width: 350px;
    	height: 250px;
    }   
</style>


	<script type="text/javascript">
	
		$(document).ready(function(){
			
			$("#minus").click(function(){
				var stat = $("#number").val();
				var num = parseInt(stat, 10);
				num--;
				
				var price = ${pvo.prod_price};
											
				if(num < 0){
					alert("최소 1개 이상 선택해주세요.");
					num = 1; 
				}
				
				$("#number").val(num);
				$("#price").val(price)
											
				var amount = parseInt($("#number").val());
				var total = amount * price;
				$("#price").val(total);
											
		});
		
		$("#plus").click(function(){
											
			var stat = $("#number").val();
			var num = parseInt(stat, 10);
			num++;
											
			var price = ${pvo.prod_price};
			
			if(num > 10){
				alert("최대 10개 이상 구매하실 수 없습니다.");
				num = 1;
			}
				$("#number").val(num);
				$("#price").val(price);
											
				var amount = parseInt($("#number").val());
				var total = amount * price;
				$("#price").val(total);
		});
										
		});
		
		
		function selectNum(){
			
			var selcolor = document.getElementById("selcolor");
			var colortext = selcolor.options[document.getElementById("selcolor").selectedIndex].text;
			var selsize = document.getElementById("selsize");
			var sizetext = selsize.options[document.getElementById("selsize").selectedIndex].text;
		}
	
							
	</script>

	<script type="text/javascript">
		$(function(){
							
		$("#selcolor").on('change',function(){
								
			var selcolor = $("#selcolor option:selected").text();
			var pseq = ${pvo.prod_no};
							
				console.log(selcolor);
								
				$.ajax({
								
					url:"<%=request.getContextPath()%>/Product.do?command=selsize",
					type : 'get',
					dataType:"json",
					data: {
							"pseq" : pseq,
							"selcolor" : selcolor
						 },
									
					success : function(data) {
					$("#selsize").html("<option value = '' selected = 'selected'>선택</option>");
						var sizelist = data.ressize;										
							for(var i = 0 ; i<data.sizecount ; i++){
								$("#selsize").append($("<option>").val(sizelist[i]).text(sizelist[i]))
								}
							},
							error : function() {
								 alert("해당 컬러의 사이즈를 가져오는데에 실패하였습니다.");
								    }
								})
							});
						});
						
						</script>
						
						<!-- 컬러가 여러개일경우 중복을 제거해주는 과정 from 성일 -->
						<%
						
						ArrayList<Vo_Prod_option> povolist = (ArrayList<Vo_Prod_option>)request.getAttribute("povo");
						HashSet colorset = new HashSet();
						for(int i = 0 ; i<povolist.size() ; i++){
							colorset.add(povolist.get(i).getProd_color());
						}
						
						List<String> colorlist = new ArrayList<String>();
						Iterator it = colorset.iterator();
						
						while(it.hasNext()){
							colorlist.add((String)it.next());
						}
						
						%>
	
	

</head>

<body id="body">
<!-- 전용 맞춤 헤더(css 충돌로 인한 재배치)   -->
   <!-- 시작점 -->
   <div class="site-navbar-wrap" style="background-color: #a0d9d9; position: relative;font-weight: 300;">
      <div class="site-navbar-top">
        <div class="container py-3">
       
        <!--@@ 로고 위치 @@-->
        <br>
        <div style = "text-align: center;"><a href = "<%=request.getContextPath()%>/RECOREMain/index.html">
        <img alt="" src = "<%=request.getContextPath()%>/images/logo2.png"></a></div>
        
          <div class="row align-items-center">
            <div class="col-6">
            </div>
            <div class="col-6">
              <div class="d-flex ml-auto" style = "position:relative;left: 100px;font-size: 1.3rem;" >
               <form id="search" method="get" action="#" class="d-flex align-items-center ml-auto mr-4">
                   <!-- <input type="text" name="query" placeholder="Search" />
                    <a href="#search"> &nbsp; Search</a>  -->
                 </form>
                 
                 <!-- 로그인 안되어있을 때 -->
                 <c:if test="${empty vo }">
                <a href="<%=request.getContextPath()%>/RECOREMain/RECOREAccount/Acc_Login.jsp" class="d-flex align-items-center">
                 <span class="d-none d-md-inline-block" style="color:black;">로그인 &nbsp;&nbsp;</span>
                 </a>
                  <a href="<%=request.getContextPath()%>/RECOREMain/RECOREAccount/Acc_Signup.jsp" class="d-flex align-items-center">
                  <span class="d-none d-md-inline-block" style="color:black;">회원가입 &nbsp;&nbsp;</span></a>
                  <br>
                  <a href="<%=request.getContextPath()%>/RECOREMain/RECOREAccount/Acc_Login.jsp" class="d-flex align-items-center">
                  <!-- <a href="RECOREMypage/Mypage_Main.jsp" class="d-flex align-items-center"> -->
                  <span class="d-none d-md-inline-block" style="color:black;">마이페이지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
                  <a href = "<%=request.getContextPath()%>/RECOREMain/RECOREAccount/Acc_Login.jsp">
                  <img class="d-none d-md-inline-block" src = "<%=request.getContextPath()%>/images/cart3.png"/>
                  </a>
                 </c:if>
                 
                 <!-- 로그인 되어있을 때 -->
                  <c:if test="${!empty vo }">
                <a href="<%=request.getContextPath()%>/Account_Controller.do?command=logout" class="d-flex align-items-center">
                <span class="d-none d-md-inline-block" style="color:black;">로그아웃&nbsp;&nbsp;</span></a>
                <a href="<%=request.getContextPath()%>/mypage.do?command=main" class="d-flex align-items-center">
                <span class="d-none d-md-inline-block" style="color:black;">마이페이지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
                <a href = "<%=request.getContextPath()%>/mypage.do?command=cartlist">
                  <img class="d-none d-md-inline-block" src = "<%=request.getContextPath()%>/images/cart3.png"/></a>
             </c:if>
                 
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="site-navbar">
        <div class="container py-1">
          <div class="row align-items-center">
            <div class="col-2">
            </div>
            <div class="col-10">
              <nav class="site-navigation text-right" role="navigation">
                <div class="container">
                  <div class="d-inline-block d-lg-none ml-md-0 mr-auto py-3"><a href="#" class="site-menu-toggle js-menu-toggle text-white"><span class="icon-menu h3"></span></a></div>

                  <ul class="site-menu js-clone-nav d-none d-lg-block" style = "position:relative; z-index: 1; left: -110px; font-family: 'Nunito Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'">
                    <li class="has-children">
                      <a href="<%=request.getContextPath()%>/funding.do?command=selectAllFunding&pageno=1" style="color:black;">Funding</a>
                      <ul class="dropdown arrow-top">
                        <li><a href="<%=request.getContextPath()%>/funding.do?command=selectAllFunding&pageno=1">조회</a></li>
                        <li><a href="<%=request.getContextPath()%>/funding.do?command=createfundingpage">등록</a></li>
                      </ul>
                    </li>
                    <li class="has-children">
                    
                      <a href= "<%=request.getContextPath()%>/Product.do?command=ProdSelectAll&pageno=1" style= "color:black;">Product</a>
                      <ul class="dropdown arrow-top">
                        <li><a href="<%=request.getContextPath()%>/Product.do?command=ChildSelectAll&catdno=6&pageno=1">Bag/Acc</a></li>
                        <li class = "has-children"><a href="<%=request.getContextPath()%>/Product.do?command=ParentSelectAll&catdid=4&pageno=1">Clothing</a>
                           <ul class = "dropdown arrow-down">
                        <li><a href = "<%=request.getContextPath()%>/Product.do?command=ChildSelectAll&catdno=7&pageno=1">Outer</a></li>                           
                        <li><a href = "<%=request.getContextPath()%>/Product.do?command=ChildSelectAll&catdno=8&pageno=1">Top</a></li>                           
                        <li><a href = "<%=request.getContextPath()%>/Product.do?command=ChildSelectAll&catdno=9&pageno=1">Bottom</a></li>                           
                           </ul>
                        </li>
                        <li><a href="<%=request.getContextPath()%>/Product.do?command=ChildSelectAll&catdno=10&pageno=1">Wallet</a></li>
                        <li class = "has-children"><a href="<%=request.getContextPath()%>/Product.do?command=ParentSelectAll&catdid=6&pageno=1">Life</a>
                           <ul class = "dropdown arrow-down">
                        <li><a href = "<%=request.getContextPath()%>/Product.do?command=ChildSelectAll&catdno=11&pageno=1">Supply</a></li>                           
                        <li><a href = "<%=request.getContextPath()%>/Product.do?command=ChildSelectAll&catdno=12&pageno=1">Home</a></li>                           
                           </ul>
                        </li>
                      </ul>
                    </li>
                    <li  class="has-children"><a href="<%=request.getContextPath()%>/issue.do?command=selectAllNews&pageno=1" style="color:black;">Issue</a>
                       <ul class="dropdown arrow-top">
                        <li><a href="<%=request.getContextPath()%>/issue.do?command=selectAllNews&pageno=1">News</a></li>
                        <li><a href="<%=request.getContextPath()%>/issue.do?command=selectAllExhibition&pageno=1">Exhibition</a></li>
                      </ul>
                    </li>
                    <li class="has-children"><a href="<%=request.getContextPath()%>/qna.do?command=qna_list&catd=all" style="color:black;">Community</a>
                   <ul class="dropdown arrow-top">
                   <li><a href="<%=request.getContextPath()%>/qna.do?command=qna_list&catd=all">QnA</a></li>
                   <li><a href="<%=request.getContextPath()%>/qna.do?command=review_list&catd=all">Review</a></li>
                   </ul>
               </li>
            
                  </ul>
                </div>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
   
   <!-- 전용헤서 끝점 -->
   
	<!--상품 상세 페이지 -->
	<section class="single-product">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
				
					<ol class="breadcrumb">
						<li><a
							href="<%=request.getContextPath()%>/RECOREMain/index.html">Home</a></li>
						<li><a href="Product.do?command=ProdSelectAll&pageno=1">Product</a></li>

						<!-- @@카테고리 타고 넘어오는 부분 종류 뭔지 써주기@@ -->
    			    	<li class="active"><a
							href="Product.do?command=<%=url%>&catdno=${pvo.prod_catd}&pageno=1">${cdvo.catd_name}</a></li>
					</ol>
				</div>
			</div>

			<div class="row mt-20">
				<div class="col-md-5">
					<div class="single-product-slider">
						<div id='carousel-custom' class='carousel slide' data-ride='carousel'>
							<div class='carousel-outer'>

								<!-- me art lab slider -->
								<div class='carousel-inner '>
									<div class='item active'>
										<img id="frontimg"
											src="<%=request.getContextPath()%>/RECOREMain/RECOREProduct/product/${pvo.prod_no}/f_img.png"
											alt='' data-zoom-image="<%=request.getContextPath()%>/RECOREMain/RECOREProduct/product/${pvo.prod_no}/f_img.png" />
									</div>
									<div class='item'>
									<img id="frontimg" src='<%=request.getContextPath()%>/RECOREMain/RECOREProduct/product/${pvo.prod_no}/f_img.png' alt='' 
									data-zoom-image="<%=request.getContextPath()%>/RECOREMain/RECOREProduct/product/${pvo.prod_no}/f_img.png" />
								</div>
								</div>
								<!-- sag sol -->
								<a class='left carousel-control' href='#carousel-custom'
									data-slide='prev'> <i class="tf-ion-ios-arrow-left"></i>
								</a> 
								<a class='right carousel-control' href='#carousel-custom'
									data-slide='next'> <i class="tf-ion-ios-arrow-right"></i>
								</a>
							</div>



							<!-- @@ 이미지 넘어가는 부분 @@ -->
							<ol class='carousel-indicators mCustomScrollbar meartlab'>
								<li data-target='#carousel-custom' data-slide-to='0'
									class='active'><img
									src='<%=request.getContextPath()%>/RECOREMain/RECOREProduct/product/${pvo.prod_no}/f_img.png'
									alt='' /></li>
								<li data-target='#carousel-custom' data-slide-to='1'><img
									src='<%=request.getContextPath()%>/RECOREMain/RECOREProduct/product/${pvo.prod_no}/f_img.png'
									alt='' /></li>
							</ol>
						</div>
					</div>
				</div>



				<!-- @@상품 이름, 가격 / 상세 정보글@@ -->
				<div class="col-md-7" style="position: relative; left: 50px;">
					<div class="single-product-details">
						<h2 style = "margin-top: 0px;">${pvo.prod_name}</h2>
						
						<p class="product-price">
							<fmt:formatNumber value="${pvo.prod_price}" groupingUsed="true">
							</fmt:formatNumber>원
						</p>

						<!-- @@상세 정보글@@ -->
						<p class="product-description mt-20">${pvo.prod_note}&nbsp;</p>
						<!-- <p>제품 정보 글 쓰는 곳</p>
						<br> -->
						
						<br>
						
						<!-- @@ 상품 옵션 값 보내주기 @@ -->
						
						<form action = "" method = "get" id = "form" name = "form">
						<input type = "hidden" name = "command" value = "Order" id = "val"/> 
						<input type = "hidden" name = "pseq" value = "${pvo.prod_no}" id = "val2"/>
						
						<div class="product-size">
							<span>색상:</span> 
							<select class="form-control" id = "selcolor" name = "color" onchange="selectNum();">
								<option value = "">선택</option>
								<c:forEach var = "color" items = "<%=colorlist %>">
								<option value = "${color}">${color}</option>
								</c:forEach>
							</select>
						</div>

						<!-- @@사이즈@@ -->
						<div class="product-size">
							<span>사이즈:</span> 
							<select class="form-control" id = "selsize" name = "size" onchange="selectNum();">
								<option value = "" selected = "selected">선택</option>
							</select>
						</div>
						

						<!-- @@상품 수량@@ -->
						<div class="product-quantity">
							<span>수량:</span>
							<div class="product-quantity-slider">
								<div class="input-group bootstrap-touchspin">
									<span class="input-group-btn">
										<button id="minus" class="btn btn-default bootstrap-touchspin-down"
											type="button"> -
										</button>
									</span> 
									
									<span class="input-group-addon bootstrap-touchspin-prefix"
										style="display: none;">
									</span> 
									
									<input id="number"
										type="text" value="0" name="product-quantity"
										class="form-control" readonly="readonly" style="display: block;"> 
										
									<span class="input-group-addon bootstrap-touchspin-postfix"
										style="display: none;">
									</span> 
									
									<span class="input-group-btn">
										<button id="plus"
											class="btn btn-default bootstrap-touchspin-up" 
											type="button"> +
										</button>
									</span>
									
								</div>
							</div>
						</div>

						<!-- @@장바구니 / 바로구매 / 관심상품@@ -->

						<!-- 최상위 폴더 / 해당파일이 존재하는 폴더 / 해당파일 -->
						<br>
						<div class = "color-swatches" id = "total">
							<span>총 금액 :</span>
							<input id = "price" type = "text" value = "" name = "total" 
							style="background-color:transparent; border:0 solid black; font-size: 1.5em;
							width: 100px;" readonly="readonly"/>원
							
						</div>
						
						<br><br>
						
						<c:if test="${empty vo}">
						<input type = "button" value = "바로구매" id = "pay" 
						class = "btn btn-main mt-20" onclick = "disabledbtn();"/>&nbsp;&nbsp; 
						
						<input type = "button" value = "장바구니" id = "cart" 
							class="btn btn-main mt-20" disabled="disabled">&nbsp;&nbsp;
						
						<input type = "button" value = "관심상품" id = "wish"
						   class="btn btn-main mt-20" disabled="disabled">
						</c:if>
						
						<c:if test="${!empty vo}">
						<input type = "button" value = "바로구매" id = "pay" 
                  		class = "btn btn-main mt-20" onclick="paypay();"/>&nbsp;&nbsp; 
						
						<input type = "button" value = "장바구니" id = "cart" 
							onclick="insertCart();" class="btn btn-main mt-20">&nbsp;&nbsp;
						
						<input type = "button" value = "관심상품" id = "wish"
						onclick="insertWish();" class="btn btn-main mt-20">
						</c:if>
						
						<script type="text/javascript">
						function disabledbtn()   {
							   var Del = confirm("해당 기능은 회원만 이용 가능합니다.\n로그인창으로 이동하시겠습니까?")
							    if (Del == true){
							        location.href='Account_Controller.do?command=loginpage';
							    } else {
							        alert("취소 되었습니다.")
							    }
							}
						</script>
						
						</form>
						
					 	<script type="text/javascript">
							

	                      function paypay(){
	                         
	                         var selco = $("#selcolor option:selected").text();
	                         var selsi = $("#selsize  option:selected").text();
	                         var selam = $("#number").val();
	                         
	                          if((selco == '선택') || (selsi == '선택') || (selam == 0)){
	                             
	                            alert("옵션을 바르게 설정해주세요.");
	                          }else{
	                             
	                             $("#form").submit();
	                             
	                          }
	                         
	                      }
	                   
	                      function insertCart(){
	                        
	                         
	                         var selco = $("#selcolor option:selected").text();
	                         var selsi = $("#selsize  option:selected").text();
	                         var selam = $("#number").val();
	                         
	                          if((selco == '선택') || (selsi == '선택') || (selam == 0)){
	                             
	                            alert("옵션을 바르게 설정해주세요.");
	                             
	                          }else{
	                             
	                            
	                            for(var i = 0; i < <%=povo.size()%>; i++){
	                              var prod_id = ${povo.get(i).getProd_id()};
	                           }
	                           var prod_amount = $("#number").val(); 
	                           var acc_no = ${vo.acc_no};
	                           var prod_no = ${pvo.prod_no};
	                           
	                           location.href = "Product.do?command=insertCart&prod_id=" + prod_id 
	                              + "&prod_amount=" + prod_amount + "&acc_no=" + acc_no + "&pseq=" + prod_no;
	                             
	                          }
	                         
	                         
	                         
	                        
	                     }
	                     function insertWish(){
	                        
	                        var prod_no = ${pvo.prod_no};
	                        
	                           location.href = "Product.do?command=insertWish&pseq=" + prod_no;
	                     } 
	                  
						
						</script>
					</div>
				</div>
			</div>


			<!-- @@ Detail / Q&A / Review @@ -->
			         <div class="row">
            <div class="col-xs-12">
               <div class="tabCommon mt-20">
                  <br><br><br><br>
                  <ul class="nav nav-tabs" style = "font-size: 11pt;">
                     <li class="active">
                     <a data-toggle="tab" href="#details"
                        aria-expanded="true">DETAIL</a></li>
                     <li class="">
                     <a data-toggle="tab" href="#reviews"
                        aria-expanded="false">REVIEW</a></li>
                     <li class="">
                     <a data-toggle="tab" href="#qna"
                        aria-expanded="false">Q&A</a></li>
                  </ul>
                  <div class="tab-content patternbg">
                     

                     <!-- @@ 상세 내용 이미지 들어가는 곳 @@ -->
                     <c:forEach begin="1" end="${pvo.prod_con_count}" step="1" var="i">
                        <div id="details" class="tab-pane fade active in">
                           <p>
                              <img style="width: 900px; position: relative; left: 80px;"
                                 src="<%=request.getContextPath()%>/RECOREMain/RECOREProduct/product/${pvo.prod_no}/con_img${i}.png">
                           </p>
                        </div>
                     </c:forEach>
               
               
                  <script type="text/javascript">
                     
                     $(function(){
                        console.log(<%=request.getAttribute("reviewlist") %>);
                     })
                     
                  
                  </script>

                     <!-- @@리뷰 상세@@ -->
                     <div id="reviews" class="tab-pane fade">
                        <div style="text-align: right;">
                              <button style="color:white; background-color:black; width: 100px; height: 42px; border:0px;" onclick="location.href='<%=request.getContextPath()%>/qna.do?command=review_list&catd=all'">리뷰 더 보기</button>
                        </div>
                        <div class="post-comments">
                           <ul class="media-list comments-list m-bot-50 clearlist" id="reviewprint">
                              <%
                              if(reviewlist.size() > 5){
                                 for(int i=0; i<5 ; i++){
                              %>
                              <!-- Comment Item start 1-->
                              <li class="media"><a class="pull-left" href="#"> 
                                 <img class="media-object comment-avatar" src="imagesProd/blog/avater-1.jpg" 
                                 alt="" width="50" height="50" />
                              </a>

                                 <div class="media-body">
                                    <div class="comment-info">
                                    
                                       
                                       <!-- @@고객 아이디@@ -->
                                       <span style="font-size: 10pt; font-family: 100"><%=reviewlist.get(i).getAcc_id() %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                       <!-- @@ 글 작성 시간 @@ -->
                                       <time datetime="2019-12-24T23:00"><%=reviewlist.get(i).getReview_regdate() %></time>
                                       
                                       <!-- @@ reply누르면 댓글 작성할 수 있게 @@  -->
                                       <a class="comment-button" href="#">
                                       <i class="tf-ion-chatbubbles"></i></a>
                                    </div>
                                    
                                    <!-- @@ 고객 리뷰글 가져오기 @@  -->
                                    <p style="margin-bottom: 10px;"><%=reviewlist.get(i).getReview_content() %></p>
                                    
                                 </div>
                              </li>
                              
                              <%
                                 }
                              }else if(reviewlist.size() <= 5 && reviewlist.size() > 0){
                                 for(int i=0; i<reviewlist.size() ; i++){
                                 
                              %>
                              <!-- Comment Item start 1-->
                              <li class="media"><a class="pull-left" href="#"> 
                                 <img class="media-object comment-avatar" src="imagesProd/blog/avater-1.jpg" 
                                 alt="" width="50" height="50" />
                              </a>

                                 <div class="media-body">
                                    <div class="comment-info">
                                    
                                       <!-- @@고객 아이디@@ -->
                                       <span style="font-size: 10pt; font-family: 100"><%=reviewlist.get(i).getAcc_id() %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                       <!-- @@ 글 작성 시간 @@ -->
                                       <time datetime="2019-12-24T23:00"><%=reviewlist.get(i).getReview_regdate() %></time>
                                       
                                       <!-- @@ reply누르면 댓글 작성할 수 있게 @@  -->
                                       <a class="comment-button" href="#">
                                       <i class="tf-ion-chatbubbles"></i></a>
                                    </div>
                                    
                                    <!-- @@ 고객 리뷰글 가져오기 @@  -->
                                    <p style="margin-bottom: 10px;"><%=reviewlist.get(i).getReview_content() %></p>
                                    
                                 </div>
                                 <a class="pull-left" href="#"> 
                                 <img class="media-object comment-avatar" src="imagesProd/blog/avater-1.jpg" alt="" width="50" height="50" />
                                 </a>
                              </li>
                              <%
                                 }
                              }else if(reviewlist.size() == 0){   

                              %>
                                 <p style="margin-bottom: 10px; text-align: center;">작성된 리뷰가 없습니다.</p>
                              <%      
                              }
                              %>
                              
                           </ul>
                  </div>
                     </div>
                     <!-- @@문의글 상세@@ -->
                     
                        <div id="qna" class="tab-pane fade">
                           <div style="text-align: right;">
                              <button style="color:white; background-color:black; width: 100px; height: 42px; border:0px;" onclick="location.href='<%=request.getContextPath()%>/qna.do?command=qna_list&catd=all'">Q&A 더 보기</button>
                           </div>
                           <div class="post-comments">
                              <ul class="media-list comments-list m-bot-50 clearlist">
                              <!-- Comment Item start-->
                              <c:choose>
                                 <c:when test="${empty qnalist }">
                                    <p style="margin-bottom: 10px; text-align: center;">작성된 문의가 없습니다.</p>
                                 </c:when>
                              <c:otherwise>
                                 <c:forEach var="qnalist" items="${qnalist }" begin = "0" end = "4">
                                    <li class="media">
                                       <a class="pull-left" href="#"> 
                                       <img class="media-object comment-avatar" src="imagesProd/blog/avater-1.jpg" alt="" width="50" height="50" />
                                       </a>
                                       <div class="media-body">
                                          <div class="comment-info">
                                                      <!-- @@고객 아이디@@ -->
                                                      <span id="id1" style="font-size: 10pt; font-family: 100">${qnalist.qna_acc_id } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                      <!-- @@ 글 작성 시간 @@ -->
                                                      <time id="regdate1" datetime="2019-12-24T23:00">${qnalist.qna_regdate }</time>
                                                      
                                                      <!-- @@ reply누르면 댓글 작성할 수 있게 @@  -->
                                                      <a class="comment-button" href="#">
                                                      <i class="tf-ion-chatbubbles"></i></a>
                                                   </div>
                                                   
                                                   <!-- @@ 고객 리뷰글 가져오기 @@  -->
                                                   <div><p id="content1" style="margin-bottom: 10px;">${qnalist.qna_content }</p></div>
                                       </div>
                                       <a class="pull-left" href="#"> 
                                       <img class="media-object comment-avatar" src="imagesProd/blog/avater-1.jpg" alt="" width="50" height="50" />
                                       </a>
                                    </li>
                                 </c:forEach>
                              </c:otherwise>
                              </c:choose>
                              
                              <!-- @@ 문의 작성 끝 @@ -->
                              
                              
                           </ul>
                        </div>
                     </div>


            </div>
         </div>
      </div>
   </div>
   </div>
	</section>


	<!-- @@ 연관 상품 추천 @@ -->
	<section class="products related-products section">
		<div class="container">
			<div class="row">
				<div class="title text-center">
					<h2>연관 상품</h2>
				</div>
			</div>
			<%-- <div>${pvo.prod_catd}</div> --%>
			
			<div class="row">
			<!-- @@ 연관 상품 @@ -->
			<c:set var = "i" value = "0"></c:set>
			<c:forEach var = "sub" items = "${plist}">
			<c:choose >
			<c:when test="${sub.prod_catd eq pvo.prod_catd && i < 4}"> 
				<div class="col-md-3">
					<div class="product-item">
						<div class="product-thumb">
						
							<!-- 세일 여부 -->
							<!-- <span class="bage">Sale</span> -->
							<!-- Bag이면 가방이랑 연관된 상품, ACC면 악세사리랑 연관된 상품이 뜨도록 어떻게??? -->
							
							<img class="img-responsive" id = "img-fluid"
							src="<%=request.getContextPath()%>/RECOREMain/RECOREProduct/product/${sub.prod_no}/f_img.png"
									alt="product-img" />
						</div>
						<!-- @@ 상품 이름, 가격 @@ -->
						<div class="product-content">
							<h4>
								<a href="Product.do?command=ProdDetail&pseq=${toplist.get(i).getProd_no()}
								&catdno=${toplist.get(i).getProd_catd()}"
								style = "overflow:hidden; word-wrap:break-word;">${sub.prod_name}</a>
							</h4>
							<p class="price"><fmt:formatNumber value="${sub.prod_price}" groupingUsed="true">
							</fmt:formatNumber>원
							</p>
						</div>
					</div>
				</div>
				<c:set var = "i" value = "${i+1}"></c:set>
			  </c:when>
			 </c:choose>
			</c:forEach>
		
			
			</div> 
		</div>
	</section>
	
	
	
	<!-- footer -->
	<%@ include file="/footer.jsp"%>


	<!-- 
    Essential Scripts
    =====================================-->

	<!-- Main jQuery -->
	<script
		src="<%=request.getContextPath()%>/RECOREMain/plugins/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.1 -->
	<script
		src="<%=request.getContextPath()%>/RECOREMain/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- Bootstrap Touchpin -->
	<script
		src="<%=request.getContextPath()%>/RECOREMain/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
	<!-- Instagram Feed Js -->
	<script
		src="<%=request.getContextPath()%>/RECOREMain/plugins/instafeed-js/instafeed.min.js"></script>
	<!-- Video Lightbox Plugin -->
	<script
		src="<%=request.getContextPath()%>/RECOREMain/plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
	<!-- Count Down Js -->
	<script
		src="<%=request.getContextPath()%>/RECOREMain/plugins/SyoTimer/build/jquery.syotimer.min.js"></script>

	<!-- Revolution Slider -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/RECOREMain/plugins/revolution-slider/revolution/js/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/RECOREMain/plugins/revolution-slider/revolution/js/jquery.themepunch.revolution.min.js"></script>

	<!-- Revolution Slider -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/RECOREMain/plugins/revolution-slider/revolution/js/extensions/revolution.extension.actions.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/RECOREMain/plugins/revolution-slider/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/RECOREMain/plugins/revolution-slider/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/RECOREMain/plugins/revolution-slider/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/RECOREMain/plugins/revolution-slider/revolution/js/extensions/revolution.extension.migration.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/RECOREMain/plugins/revolution-slider/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/RECOREMain/plugins/revolution-slider/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/RECOREMain/plugins/revolution-slider/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/RECOREMain/plugins/revolution-slider/revolution/js/extensions/revolution.extension.video.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/RECOREMain/plugins/revolution-slider/revolution/js/extensions/revolution.extension.video.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/RECOREMain/plugins/revolution-slider/assets/warning.js"></script>



	<!-- Google Mapl -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/RECOREMain/plugins/google-map/gmap.js"></script>

	<!-- Main Js File -->
	<script src="<%=request.getContextPath()%>/RECOREMain/js/script.js"></script>



</body>
</html>