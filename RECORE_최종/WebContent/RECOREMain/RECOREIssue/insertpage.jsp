<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>RECORE &mdash; ISSUE</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900"> 
    <link rel="stylesheet" href="<%=request.getContextPath() %>/RECOREMain/fonts/icomoon/style.css">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/RECOREMain/css/magnific-popup.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/RECOREMain/css/jquery-ui.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/RECOREMain/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/RECOREMain/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/RECOREMain/css/bootstrap-datepicker.css">
    
    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/RECOREMain/fonts/flaticon/font/flaticon.css">
  
    <link rel="stylesheet" href="<%=request.getContextPath() %>/RECOREMain/css/aos.css">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/RECOREMain/css/style.css">
     <script src="<%=request.getContextPath() %>/RECOREMain/js/jquery-3.3.1.min.js"></script>


   <!-- insert 폼 css 적용 -->
   
    
    <link href="<%=request.getContextPath() %>/RECOREMain/RECOREIssue/css/main.css" rel="stylesheet" media="all">
    
    
     <script type="text/javascript">
         
        $(function(){
           
        $("#title").blur(function(){
           
              var chkor = /^[~!@#$%^&*()_+|<>?:{}0-9가-힣\s]+$/;           
           
           var title = $("#title").val();
           
           if(chkor.test(title)){
              
              $("#titlean").css({"display":"none","padding-left": "5px","color": "red"});
             
           }else{
              
              $("#titlean").css({"display":"block","padding-left": "5px","color": "red"});
              $("#title").val("");
                                        
           }
        });
        });
        
                     
                
     </script>
 
  </head>
  <body>
  
  
   <!-- header -->
   <%@ include file="/header.jsp" %>


   
    <div class="page-wrapper p-t-100 p-b-50" style="background-color: white;">
        <div class="wrapper wrapper--w900">
            <div class="card card-6" style="border:0px;">
            
                <form action="issue.do?command=insertIssue" method="post" enctype="multipart/form-data" id="formform">
                <input type="hidden" name="iss_catd_no" value="${iss_catd_no }">
                     
                <div class="card-heading" style="border:0px;">
                    <h2 class="title" style="color:#a0d9d9;">
                       <c:choose>
                          <c:when test="${iss_catd_no eq 4 }">&nbsp;&nbsp;&nbsp;뉴스 작성</c:when>
                          <c:when test="${iss_catd_no eq 5 }">&nbsp;&nbsp;&nbsp;기획전 작성</c:when>
                       </c:choose>
                    </h2>
                </div>
                <div class="card-body" style="border:0px;">
                
                        <div class="form-row">
                            <div class="name">Title</div>
                            <div class="value">
                                <input id="title" class="input--style-6" type="text" name="iss_title" placeholder="제목 입력" required="required" maxlength="30" >
                               <p id= "titlean" style="padding-left: 5px; display:none; color: red">현재 입력된 제목은 사용할 수 없습니다.</p>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Writer</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-6" type="text" name="iss_writer" placeholder="작성자 이름" required="required" maxlength="10">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Source</div>
                            <div class="value">
                                <div class="input-group">
                                    <textarea class="input--style-6" name="iss_source" placeholder="출처" required="required" maxlength="30"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">URL</div>
                            <div class="value">
                                <div class="input-group">
                                    <textarea class="input--style-6" name="iss_note" placeholder="URL" required="required"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">대표이미지</div>
                            <div class="value">
                                <div class="input-group">
                                    <input type="file" name=iss_front_img accept=".png" required="required">
                                     <div class="label--desc">뉴스 대표 이미지의 규격은 450px x 450px / 기획전 대표 이미지의 규격은 450px x 150px 입니다.</div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">썸네일이미지</div>
                            <div class="value">
                                <div class="input-group">
                                    <input type="file" name=iss_th_img accept=".png" required="required">
                                   <div class="label--desc">뉴스 썸네일 이미지의 규격은 450px x 450px / 기획전 썸네일 이미지의 규격은 800px x 850px 입니다.</div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">내용이미지</div>
                            <div class="value">
                                <div class="input-group">
                                    <input type="file" name=iss_content accept=".png" required="required">
                                </div>
                                <div class="label--desc">뉴스 내용이미지의 규격은 1000px x * / 기획전 내용이미지의 규격은 2000px x * 내외 입니다.</div>
                                <div class="label--desc">업로드 하는 사진의 확장자는 .png 이어야 하며 사진의 크기는 10MB까지 가능합니다.</div>
                                
                            </div>
                        </div>
                </div>
                <div class="card-footer" style="border:0px; text-align: right;">
                    <c:choose>
                       <c:when test="${iss_catd_no eq 4 }">
                          <button class="btn btn--radius-2 btn--blue-2" type="submit">작성 완료</button>&nbsp;&nbsp;
                          <button class="btn btn--radius-2 btn--blue-2" type="button" onclick="location.href='issue.do?command=selectAllNews&pageno=1'">돌아가기</button>
                       </c:when>
                       <c:when test="${iss_catd_no eq 5 }">
                          <button class="btn btn--radius-2 btn--blue-2" type="submit">작성 완료</button>&nbsp;&nbsp;
                          <button class="btn btn--radius-2 btn--blue-2" type="button" onclick="location.href='issue.do?command=selectAllExhibition&pageno=1'">돌아가기</button>
                       </c:when>
                    </c:choose>
                </div>
                </form>
            </div>
        </div>
    </div>
   

   <!-- footer -->
   <%@ include file="/footer.jsp" %> <!-- SI footer적용  -->



  <script src="<%=request.getContextPath() %>/RECOREMain/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="<%=request.getContextPath() %>/RECOREMain/js/jquery-ui.js"></script>
  <script src="<%=request.getContextPath() %>/RECOREMain/js/popper.min.js"></script>
  <script src="<%=request.getContextPath() %>/RECOREMain/js/bootstrap.min.js"></script>
  <script src="<%=request.getContextPath() %>/RECOREMain/js/owl.carousel.min.js"></script>
  <script src="<%=request.getContextPath() %>/RECOREMain/js/jquery.stellar.min.js"></script>
  <script src="<%=request.getContextPath() %>/RECOREMain/js/jquery.countdown.min.js"></script>
  <script src="<%=request.getContextPath() %>/RECOREMain/js/jquery.magnific-popup.min.js"></script>
  <script src="<%=request.getContextPath() %>/RECOREMain/js/bootstrap-datepicker.min.js"></script>
  <script src="<%=request.getContextPath() %>/RECOREMain/js/aos.js"></script>

  <script src="<%=request.getContextPath() %>/RECOREMain/js/main.js"></script>
    
  </body>
</html>