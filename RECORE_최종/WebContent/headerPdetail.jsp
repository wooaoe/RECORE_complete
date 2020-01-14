<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    <%@ page import = "com.mvc.vo.Vo_Account" %>
    
    <% Vo_Account vo = (Vo_Account)session.getAttribute("vo"); %>

<!DOCTYPE html>
<html lang="en">
  <head>
	
  </head>
 
  <body>

	<div style="background: #A0D9D9;" >

    </div> 
    <!-- .site-mobile-menu -->
 	 <div class="site-navbar-wrap" style="position: static; background-color: #A0D9D9; height: 185.6px;"> <!--  -->
      <div class="site-navbar-top">
        <div class="container py-3">
        
           <!-- @@@로고 위치 @@@-->
        <br>
        <div style = "text-align: center; position:relative; top:15.5px;">
        <a href = "<%=request.getContextPath()%>/RECOREMain/index.html">
        <img alt="" src = "<%=request.getContextPath()%>/images/logo2.png"></a></div>
          <div class="row align-items-center">
            <div class="col-6">
           
            </div>
           
            <!-- 페이지마다 로그인/회원가입 뜨는거 -->
            <div class="col-6" >
              <div class="d-flex ml-auto" style = "font-size: 9pt; position:relative; left:360px; top:10px; ">
             <form id="search" method="get" action="#" class="d-flex align-items-center ml-auto mr-4">
              
              	</form> 
                
                <!-- 로그인 안되어있을 때 --> <!-- **커맨드 값으로 경로 수정(20/01/15 승혜) -->
                <c:if test="${empty vo }">
                <a href="Account_Controller.do?command=loginpage" class="d-flex align-items-center">
                 <span class="d-none d-md-inline-block" style="color:black;">로그인 &nbsp;&nbsp;</span>
                 </a>
                  <a href="Account_Controller.do?command=signuppage" class="d-flex align-items-center">
                  <span class="d-none d-md-inline-block" style="color:black;">회원가입 &nbsp;&nbsp;</span></a>
                  <br>
                  <a href="Account_Controller.do?command=loginpage" class="d-flex align-items-center">
                  <span class="d-none d-md-inline-block" style="color:black;">마이페이지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
                 <a href = "Account_Controller.do?command=loginpage">
                  <img class="d-none d-md-inline-block" src = "<%=request.getContextPath()%>/images/cart3.png"/></a>
                 </c:if>
                 
                 <!-- 로그인 되어있을 때 -->
                  <c:if test="${!empty vo }">
    				<a href="../Account_Controller.do?command=logout" class="d-flex align-items-center">
    				<span class="d-none d-md-inline-block" style="color:black;">로그아웃&nbsp;&nbsp;</span></a>
    				<a href="<%=request.getContextPath()%>/mypage.do?command=main" class="d-flex align-items-center">
    				<span class="d-none d-md-inline-block" style="color:black;">마이페이지&nbsp;&nbsp;</span></a>
    				<a href="<%=request.getContextPath()%>/mypage.do?command=cartlist" class="d-flex align-items-center">
                    <span class="d-none d-md-inline-block" style="color:black;">장바구니</span></a>
    			</c:if>
                 
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <!-- **펀딩, 이슈, 커뮤니티 카테고리 경로 설정 안되어있는거 수정** 20/01/15 승혜 -->
      <div class="site-navbar" style = "width: 1519.2px; height: 78.4px;" >
        <div class="container py-1">
          <div class="row align-items-center">
            <div class="col-2">
            </div>
            
            <div class="col-10">
              <nav class="site-navigation text-right" role="navigation">
                <div class="container" style = "position: static;">
                  <div class="d-inline-block d-lg-none ml-md-0 mr-auto py-3"><a href="#" class="site-menu-toggle js-menu-toggle text-white"><span class="icon-menu h3"></span></a></div>
                  <ul class="site-menu js-clone-nav d-none d-lg-block" 
                  style = "position:relative; z-index: 1; top: 20px;">
                    <li class="has-children">
                      <a href="<%=request.getContextPath()%>/funding.do?command=selectAllFunding&pageno=1" style = "color:black;">Funding</a>
                      <ul class="dropdown arrow-top">
                        <li><a href="<%=request.getContextPath()%>/funding.do?command=selectAllFunding&pageno=1">조회</a></li>
                        <li><a href="<%=request.getContextPath()%>/funding.do?command=createfundingpage">등록</a></li>
                      </ul>
                    </li>
                    <li class="has-children">
                      <a href="<%=request.getContextPath()%>/Product.do?command=ProdSelectAll" style = "color:black;">Product</a>
                      <ul class="dropdown arrow-top">
                        <li><a href="<%=request.getContextPath()%>/Product.do?command=BagAccSelectAll" style = "color:black;">Bag / Acc</a></li>
                        <li class = "has-children"><a href="<%=request.getContextPath()%>/Product.do?command=ClothingSelectAll" style = "color:black;">Clothing</a>
                        	<ul class = "dropdown arrow-down">
								<li><a href = "<%=request.getContextPath()%>/Product.do?command=OuterSelectAll">Outer</a></li>                        	
								<li><a href = "<%=request.getContextPath()%>/Product.do?command=TopSelectAll">Top</a></li>                        	
								<li><a href = "<%=request.getContextPath()%>/Product.do?command=BottomSelectAll">Bottom</a></li>                        	
                        	</ul>
                        </li>
                        <li><a href="<%=request.getContextPath()%>/Product.do?command=WalletSelectAll">Wallet</a></li>
                        <li class = "has-children"><a href="<%=request.getContextPath()%>/Product.do?command=LifeSelectAll">Life</a>
                        	<ul class = "dropdown arrow-down">
								<li><a href = "<%=request.getContextPath()%>/Product.do?command=SupplySelectAll">Supply</a></li>                        	
								<li><a href = "<%=request.getContextPath()%>/Product.do?command=HomeSelectAll">Home</a></li>                        	
                        	</ul>
                        </li>
                      </ul>
                    </li>
                    <li class="has-children"><a href="<%=request.getContextPath()%>/issue.do?command=selectAllNews&pageno=1" style="color:black;">Issue</a>
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
 	</div>
 	
</body>
</html>