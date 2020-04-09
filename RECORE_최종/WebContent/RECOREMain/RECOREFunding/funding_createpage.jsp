<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">

function checktitle(){
   var title = $("#fund_title").val();
   
   
   if(title.length == 30){
      $("#fund_creator").focus();
   } 
   
}

function checkcrea(){
   var creator = $("#fund_creator").val();
   
   
   if(creator.length == 10){
      $("#fund_target_price").focus();
   } 
   
}

function checkpri(){
   var price = $("#fund_target_price").val();
   
   
   if(price.length == 9){
      $("#fund_deadline").focus();
   } 
   
}

$(document).ready(function() {
      
      $("input[name=fund_target_price]").blur(function(){
            var priceCheck = RegExp(/^[1-9][\d]{4,7}$/);   
            var fund_target_price = $("input[name=fund_target_price]").val();
            
            if(!priceCheck.test($('#fund_target_price').val()) && fund_target_price!=""){
                alert("금액은 1111원 부터 999999999원까지 입력 가능합니다.");
                $('#fund_target_price').val($('#fund_target_price').val().replace(fund_target_price,""));
                $('#fund_target_price').focus();
             } 
        
         });
      
      
      }); 


</script>
  <head>
    <title>RECORE &mdash; CREATE</title>
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


   <!-- insert 폼 css 적용 -->
   
    <!-- @@ RECORE favicon @@  -->
    <link rel="icon" href="<%=request.getContextPath()%>/images/recorefavi.png">
    <link href="<%=request.getContextPath() %>/RECOREMain/RECOREIssue/css/main.css" rel="stylesheet" media="all">

<style type="text/css">
   #backbutton {
    display: inline-block;
     line-height: 50px;
     padding: 0 30px;
     -webkit-transition: all 0.4s ease;
     -o-transition: all 0.4s ease;
     -moz-transition: all 0.4s ease;
     transition: all 0.4s ease;
     cursor: pointer;
     font-size: 15px;
     text-transform: capitalize;
     font-weight: 700;
     color: white;
     font-family: inherit;
     width: 200px;
     margin-left: 80px;
     background: #185ac1;
   }
   #savebutton {
     width: 200px;
     margin-left: 220px;
     background: #185ac1;
   }
   html{
      scroll-behavior: smooth;
   }
</style> 

  </head>
  <body id="body" style="font-weight: 300; font-size: 1rem; 
  font-family: 'Nunito Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';">
  
  
   <!-- header -->
   <%@ include file="/header.jsp" %>
   
   
    <div class="site-section" style="padding: 0em;" >

  <div class="page-wrapper bg-dark p-t-100 p-b-50">
        <div class="wrapper wrapper--w900">
       <div class="card card-6" style="border:0px;">
                <div class="card-heading" >
                    <h2 class="title">펀딩 등록하기</h2>
                </div>
                <div class="card-body"style="border:0px;" >

                    <form action="funding.do?command=insertFunding" method="post" id="frm" enctype="multipart/form-data">

                        <div class="form-row" style="border:0px;">
                            <div class="name">펀딩 제목</div>
                            <div class="value">
                            <div class="input-group">
                                <input class="input--style-6" type="text" id="fund_title" name="fund_title" required="required" maxlength = "30"onkeyup="checktitle();">
                                </div>
                            </div>
                        </div>
                        <div class="form-row" style="border:0px;">
                            <div class="name">작성자</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-6" type="text" id="fund_creator"name="fund_creator" required="required" maxlength ="10" onkeyup="checkcrea();">
                                </div>
                            </div>
                        </div>
                        <div class="form-row" style="border:0px;">
                            <div class="name">목표 금액</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-6" type="text" id="fund_target_price" name="fund_target_price" required="required" maxlength="9" onkeyup="checkpri();">
                                </div>
                            </div>
                        </div>
                         <div class="form-row" style="border:0px;">
                            <div class="name">펀딩   마감 기한</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-6"  type="date" id="fund_deadline" name="fund_deadline" required="required" >   
                                </div>
                            </div>
                        </div>
                        <div class="form-row" style="border:0px;">
                            <div class="name">본문 내용 이미지 업로드</div>
                            <div class="value">
                                <div class="input">
                                     <input type="file" name=fund_content accept=".png" required="required">
                               


                                </div>
                                <div class="label--desc">이미지 파일을 업로드 하세요</div>
                            </div>
                        </div>   
                        <div class="form-row" style="border:0px;">
                            <div class="name">썸네일 이미지 업로드</div>
                            <div class="value">
                                <div class="input">
                                  
                               <input type="file" name=fund_front_img accept=".png" required="required">
                               <label class="label--file" for="file"> </label>

                               
                                </div>
                                <div class="label--desc">이미지 파일을 업로드 하세요</div>
                            </div>
                        </div>
                        <br><br>
                          <input type="submit" id="savebutton" value="펀딩 등록하기" class="btn btn--radius-2 btn--blue-2"
                         >           
                  <input type="button" id="backbutton" value="등록 취소하기"  class = "btn btn--radius-2 btn--blue-2" onclick="history.back(-1);" > 
                        
                    
                    </form>
           
                </div>
                <div class="card-footer">
               
                </div>
            </div>
            </div>
            </div>

    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>

<script src="js/global.js"></script>
    <!-- Main JS-->
    

<!--form action="funding1.jsp" method="post" id="frm">
<div id="table">
<table >
     <tr>
           
           
           <th align = "center">제목</th>    
            
            <td> <input type="text" id="title" name="title" style="width:650px"/> </td>
     
       </tr>
    <tr>
            <th>작성자   </th>
            <td> <input type="text" id="creator" name="creator" style="width:650px"/></td>
       </tr>

           <tr>
            <th>목표금액    </th>
            <td> <input type="number" id="target_price" name="target_price" style="width:650px"/>원</td>
       
     </tr>
 
      <tr>
            <th>마감기한    </th>
            <td> <input type="date" id="deadline" name="deadline" style="width:650px"/></td>
       
    
    </tr>   
   <tr>
    <th>  
       펀딩 내용</th><td>
    <textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:766px; height:412px;"></textarea>
  
    </td>
    </tr>
   <tr>
    <td>
    <div id="button1">
    <input type="button" id="savebutton" value="펀딩 등록하기" /></div>

    </td>
    </tr>
</table>
</div>
</form-->




       
      </div>
   
   
   
   

   <!-- footer -->
   <%@ include file="/footer.jsp" %>       



  <script src="<%=request.getContextPath() %>/RECOREMain/js/jquery-3.3.1.min.js"></script>
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