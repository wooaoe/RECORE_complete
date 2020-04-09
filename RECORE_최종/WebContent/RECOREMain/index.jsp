<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8");%>
	<%response.setContentType("text/html; charset=UTF-8");%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    <%@ page import = "com.mvc.vo.Vo_Account" %>
    
    <% Vo_Account vo = (Vo_Account)session.getAttribute("vo"); %>
	
    
<!DOCTYPE html>
<html lang="en">
  <head>
    
    <title>RECORE &mdash; RECORE</title>
    <%@ include file = "/head.jsp" %>
    
    <!-- @@ RECORE favicon @@  -->
    <link rel="icon" href="<%=request.getContextPath()%>/images/recorefavi.png">
    
    
    <style type="text/css">
    	html{
    		scroll-behavior:smooth;
    	}
    </style>
    
    
  </head>
  
  <body id="body">
  
  <div class="site-wrap">

    <div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div> 
    
    
    <div class="site-navbar-wrap" style="background-color: white;">
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
              <div class="d-flex ml-auto" style = "position:relative; left: 100px;" >
               <form id="search" method="get" action="#" class="d-flex align-items-center ml-auto mr-4">
              	</form>
              	
              	<!-- 로그인 안되어있을 때  -->
                <c:if test="${empty vo }">
                <a href="<%=request.getContextPath()%>/Account_Controller.do?command=loginpage" class="d-flex align-items-center">
                 <span class="d-none d-md-inline-block" style="color:black;">로그인 &nbsp;&nbsp;</span>
                 </a>
                  <a href="<%=request.getContextPath()%>/Account_Controller.do?command=signuppage" class="d-flex align-items-center">
                  <span class="d-none d-md-inline-block" style="color:black;">회원가입 &nbsp;&nbsp;</span></a>
                  <br>
                  <a href="<%=request.getContextPath()%>/Account_Controller.do?command=loginpage" class="d-flex align-items-center">
                  <span class="d-none d-md-inline-block" style="color:black;">마이페이지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
                 <a href = "<%=request.getContextPath()%>/Account_Controller.do?command=loginpage">
                  <img class="d-none d-md-inline-block" src = "<%=request.getContextPath()%>/images/cart3.png"/></a>
                 </c:if>
                 
                 <!-- 로그인 되어있을 때 -->
                  <c:if test="${!empty vo }">
    				<a href="<%=request.getContextPath()%>/Account_Controller.do?command=logout" class="d-flex align-items-center">
    				<span class="d-none d-md-inline-block" style="color:black;">로그아웃&nbsp;&nbsp;</span></a>
    				<a href="<%=request.getContextPath()%>/mypage.do?command=main" class="d-flex align-items-center">
    				<span class="d-none d-md-inline-block" style="color:black;">마이페이지&nbsp;&nbsp;&nbsp;</span></a>
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

                  <ul class="site-menu js-clone-nav d-none d-lg-block" style = "position:relative; z-index: 1; left: 110px;">
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


    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
          </ol>
          
          <!-- **RECOREMain 메인 이미지 변경 /2번째 EXHIBITION 업사이클링 패션 이미지 변경/  -->
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
                <div class="site-blocks-cover overlay" style="background-image: url(<%=request.getContextPath()%>/RECOREMain/images/backimg/img00.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
      				<br><br>
      				<div class="container">
      				  <div class="row align-items-center text-center justify-content-center">
  				        <div class="col-md-8">
						<!-- **제목 아래로 내림  20/01/15-->
						 <br><br>	
   				         <span class="sub-text">FUNDING</span>
   				         <h1 style="font-size: 2.5rem;">${flist.get(0).fund_title}</h1>
  				        </div>
   				     </div>
 				     </div>
 				   </div> 
            </div>
            
            <!-- **2번째 이미지 변경 20/01/15 -->
            <div class="carousel-item">
                <div class="site-blocks-cover overlay" style="background-image: url(<%=request.getContextPath()%>/RECOREMain/images/backimg/exhibition_img_01.png);" data-aos="fade" data-stellar-background-ratio="0.5">
      				<br><br>
      				<div class="container">
      				  <div class="row align-items-center text-center justify-content-center">
  				        <div class="col-md-8">
  				        <!-- **제목 아래로 내림  20/01/15-->
						 <br><br>	
   				         <span class="sub-text">EXHIBITION</span>
   				         <h1 style="font-size: 2.5rem;">${elist.get(0).iss_title }</h1>
  				        </div>
   				     </div>
 				     </div>
 				   </div>
     	        </div>
            <div class="carousel-item">
                <div class="site-blocks-cover overlay" style="background-image: url(<%=request.getContextPath()%>/RECOREMain/images/backimg/img02.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
      				<br><br>
      				<div class="container">
      				  <div class="row align-items-center text-center justify-content-center">
  				        <div class="col-md-8">
  				         <!-- **제목 아래로 내림  20/01/15-->
						 <br><br>
   				         <span class="sub-text">NEWS</span>
   				         <h1 style="font-size: 2.5rem;">${nlist.get(0).iss_title }</h1>
  				        </div>
   				     </div>
 				     </div>
 				   </div> 
           		</div>
           		<div class="carousel-item">
                <div class="site-blocks-cover overlay" style="background-image: url(<%=request.getContextPath()%>/RECOREMain/images/backimg/img03.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
      				<br><br>
      				<div class="container">
      				  <div class="row align-items-center text-center justify-content-center">
  				        <div class="col-md-8">
  				         <!-- **제목 아래로 내림  20/01/15-->
						 <br><br>
   				         <span class="sub-text">FUNDING</span>
   				         <h1 style="font-size: 2.5rem;">${flist.get(1).fund_title }</h1>
  				        </div>
   				     </div>
 				     </div>
 				   </div> 
           		</div>
           		<div class="carousel-item">
                <div class="site-blocks-cover overlay" style="background-image: url(<%=request.getContextPath()%>/RECOREMain/images/backimg/img04.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
      				<br><br>
      				<div class="container">
      				  <div class="row align-items-center text-center justify-content-center">
  				        <div class="col-md-8">
  				         <!-- **제목 아래로 내림  20/01/15-->
						 <br><br>
   				         <span class="sub-text">EXHIBITION</span>
   				         <h1 style="font-size: 2.5rem;">${elist.get(1).iss_title }</h1>
  				        </div>
   				     </div>
 				     </div>
 				   </div> 
           		</div>
           		<div class="carousel-item">
                <div class="site-blocks-cover overlay" style="background-image: url(<%=request.getContextPath()%>/RECOREMain/images/backimg/img05.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
      				<br><br>
      				<div class="container">
      				  <div class="row align-items-center text-center justify-content-center">
  				        <div class="col-md-8">
  				         <!-- **제목 아래로 내림  20/01/15-->
						 <br><br>
   				         <span class="sub-text">NEWS</span>
   				         <h1 style="font-size: 2.5rem;">${nlist.get(1).iss_title }</h1>
  				        </div>
   				     </div>
 				     </div>
 				   </div> 
           		</div>
          </div>
          <br><br><br><br><br><br><br>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" 
          role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>



    <div class="site-section" style="padding: 0px;"><!-- **border-bottom 삭제(펀딩과 기획 사이에 있던 hr) 20/01/15 -->
    
      <div class="container">
        <div class="row">
		  <div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
          </div>
          
          <div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
			<span class="sub-title" style = "text-align:center;">Funding</span>
            <h2  align="center" style="margin-bottom: 50px"><b>이 펀딩 어때요?</b></h2>
          </div>

          <div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
          </div>
      	</div>
      </div>
      
       <div class="container">
        <div class="row">
        	
        	<c:forEach begin="0" end="2" var="i">
        	
        		 <div class="col-lg-4 col-md-6 mb-4 project-entry">
		            <a href="<%=request.getContextPath() %>/funding.do?command=selectOneFunding&pageno=1&fund_no=${flist.get(i).fund_no}" class="d-block figure">
		              <img src="<%=request.getContextPath() %>/RECOREMain/RECOREFunding/images/${flist.get(i).fund_no }/f_img.png" alt="Image" class="img-fluid">
		            </a>
		            <h3 class="mb-0"><a href="#">${flist.get(i).fund_title }</a></h3>
		            <span class="text-muted">${flist.get(i).fund_creator }</span><br>
		          </div>
        	
        	
        	</c:forEach>
        </div>
        
      </div>
    </div>

   
    <div class="container site-section block-13 testimonial-wrap">

      <div class="row">
        <div class="col-12 text-center">
          <span class="sub-title"><a href = "exhibition.html" style = "color:#F56D3E;">Exhibition</a></span>
          <h2 class="font-weight-bold text-black mb-5"><a href = "exhibition.html" style = "color:black;">기획전 & 전시</a></h2>
        </div>
      </div>

      <div class="nonloop-block-13 owl-carousel">
        
        <c:forEach begin="0" end="4" var="i" >
        
	        <div class="" style="padding:10px;" onclick="location.href='<%=request.getContextPath() %>/issue.do?command=selectOneExhibition&pageno=1&iss_no=${elist.get(i).iss_no}'">
		          <img src="<%=request.getContextPath() %>/RECOREMain/RECOREIssue/images/${elist.get(i).iss_no }/f_img.png" alt="Image" 
		          style="margin:0 auto 30px auto;margin-left: 30px; cursor: pointer;" >
		          <h5 class="mb-0" style="margin-left: 30px; cursor: pointer;">${elist.get(i).iss_title }</h5>
	        </div>
        
        
        </c:forEach>
        
      </div>      
    </div>

    
      <div class="container">
        <div class="row">
          <div class="col-12 text-center">
            <span class="sub-title"><a href = "news.html" style = "color: #F56D3E;">News &amp; Issue</a></span>
            <h2 class="font-weight-bold text-black mb-5">
            <!-- **issue 조회 페이지 경로 수정 20/01/15 승혜  -->
            <a href = "<%=request.getContextPath()%>/issue.do?command=selectAllNews&pageno=1" style = "color:black;">뉴스 &amp; 이슈</a></h2>
          </div>
        </div>
        
        <div class="row mb-5">
        
        	<c:forEach begin="0" end="2" var="i">
        	
	          <div class="col-lg-4 col-md-6 mb-4 mb-lg-0 post-entry">
	            <a href="<%=request.getContextPath() %>/issue.do?command=selectOneNews&pageno=1&iss_no=${nlist.get(i).iss_no}" class="d-block figure">
	              <img src="<%=request.getContextPath() %>/RECOREMain/RECOREIssue/images/${nlist.get(i).iss_no }/th_img.png" alt="Image" class="img-fluid">
	            </a>
	            <span class="text-muted d-block mb-2">${nlist.get(i).iss_title }</span>
	            <h5 style="font-size: 13px"><a href="<%=request.getContextPath() %>/issue.do?command=selectOneNews&pageno=1&iss_no=${nlist.get(i).iss_no}">${nlist.get(i).iss_writer } </a></h5>
	          </div>        	
        	
        	</c:forEach>
		</div>
		</div>

	 <!-- 상단으로 올라가기 -->
          <div style = "position: fixed; bottom: 70px; right: 50px;">
			<a href = "#body"><img src = "<%=request.getContextPath()%>/images/chevron3.png" /></a>
		  </div>

	</div>
	 <%@ include file="/footer.jsp" %> <!-- SI footer적용  -->


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