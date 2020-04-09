<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import = "java.util.List" %>
<%@ page import="com.mvc.vo.Vo_Funding"%>
<%@ page import = "com.mvc.vo.Vo_Account" %>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<% Vo_Account acc = (Vo_Account)session.getAttribute("vo"); %> 
   

<!DOCTYPE html>
<html lang="en">
<head>
<title>RECORE &mdash; FUNDING DETAIL</title>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900">
<link rel="stylesheet"
   href="<%=request.getContextPath() %>/RECOREMain/fonts/icomoon/style.css">

<link rel="stylesheet"
   href="<%=request.getContextPath() %>/RECOREMain/css/magnific-popup.css">
<link rel="stylesheet"
   href="<%=request.getContextPath() %>/RECOREMain/css/jquery-ui.css">
<link rel="stylesheet"
   href="<%=request.getContextPath() %>/RECOREMain/css/owl.carousel.min.css">
<link rel="stylesheet"
   href="<%=request.getContextPath() %>/RECOREMain/css/owl.theme.default.min.css">
<link rel="stylesheet"
   href="<%=request.getContextPath() %>/RECOREMain/css/bootstrap-datepicker.css">


<link rel="stylesheet"
   href="<%=request.getContextPath() %>/RECOREMain/fonts/flaticon/font/flaticon.css">

<link rel="stylesheet"
   href="<%=request.getContextPath() %>/RECOREMain/css/aos.css">

<link rel="stylesheet"
   href="<%=request.getContextPath() %>/RECOREMain/css/style.css">
   
   <!-- @@ RECORE favicon @@  -->
    <link rel="icon" href="<%=request.getContextPath()%>/images/recorefavi.png">
   
 <style>
.state-box {
   position: relative;
   width: 420px;
   height: 530px;
   background-color: white;
}

.img-fluid {
   position: relative;
}

#title {
   color: #676363;
   font-family: Roboto, 'Noto Sans KR', sans-serif;
   font-size: 28px;
   padding-top: 10px;
   padding-bottom: 100px;
}

#btn {
   position: relative;
   padding-top: 10px;
   padding-bottom: 10px;
   background-color: #F25430;
   border: 1px;
   color: white;
   padding: 20px 100px;
   text-align: center;
   font-size: 20px;
   cursor: pointer;
   font-family: Roboto, 'Noto Sans KR', sans-serif;
}

#deadline {
   color: #676363;
   font-family: Roboto, 'Noto Sans KR', sans-serif;
   font-size: 30px;
   padding-top: 10px;
   padding-bottom: 10px;
}

#target_price {
   color: #676363;
   font-family: Roboto, 'Noto Sans KR', sans-serif;
   font-size: 30px;
   padding-top: 10px;
   padding-bottom: 10px;
}

#total-amount {
   color: #676363;
   font-family: Roboto, 'Noto Sans KR', sans-serif;
   font-size: 20px;
   padding-top: 10px;
   padding-bottom: 10px;
}

#total-supporter {
   color: #676363;
   font-family: Roboto, 'Noto Sans KR', sans-serif;
   font-size: 20px;
   padding-top: 10px;
   padding-bottom: 10px;
}

#creator {
   color: #676363;
   font-family: Roboto, 'Noto Sans KR', sans-serif;
   font-size: 25px;
   padding-top: 10px;
   padding-bottom: 50px;
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
</style>


<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script type="text/javascript">
       
       function deleteFunding(){
          
          var fund_no = "${funding_vo.fund_no}";
          var pageno = "${page}";
          
          if(confirm("현재 펀딩을 삭제하시겠습니까?")){
             location.href="funding.do?command=deleteFunding&pageno="+pageno+"&fund_no="+fund_no;
          }else{
             
          }
          
       }
       
    </script>

</head>
<body id = "body">


   <!-- header -->
   <%@ include file="/header.jsp"%>
   
   
    <!-- @@ RECORE favicon @@  -->
    <link rel="icon" href="<%=request.getContextPath()%>/images/recorefavi.png">
   

   <div class="site-section" style="padding: 10px;">

      <h1
         style="margin-top: 5rem; font-size: 30pt; text-align: center; padding-bottom: 60px">${funding_vo.fund_title }</h1>
      <!--  div style="text-align: right; padding-right: 17%; padding-top: 30px; padding-bottom: 20px">${funding_vo.fund_regdate }</div-->
   </div>



   <div class="site-section site-block-3 bg-light" style="text-align: center;">
      <div class="container" style="max-width: 1300px; ">
         <div class="row">

            <div class="d-block mb-3" style="width: 800px">
               <img
                  src="<%=request.getContextPath() %>/RECOREMain/RECOREFunding/images/${funding_vo.fund_no }/${funding_vo.fund_content }.png"
                  alt="Image" class="img-fluid">

            </div>
            <div class="state-box" style="padding: 20px">
            
               <div id="countDay"></div>
               
               <script>
               var x = setInterval(function() {
               var t1=moment('${funding_vo.fund_deadline}');
               var now=moment();
               var diffTime={
                     d:moment.duration(t1.diff(now)).days(),
                     h:moment.duration(t1.diff(now)).hours(),
                     m:moment.duration(t1.diff(now)).minutes(),
                     s:moment.duration(t1.diff(now)).seconds()
                     
               }
               
               console.log(diffTime.d +"일"+diffTime.h+"시간"+diffTime.m+"분"+diffTime.s+"초");
               document.getElementById("countDay").innerHTML = "종료까지 " +"<br><span style='font-size:25pt'><b>"+ diffTime.d +"일 " + diffTime.h + "시간 " + diffTime.m + "분 "+diffTime.s+"초 </b></span>";
               
               
               if(diffTime.s<0){
                   clearInterval(x); 
                    document.getElementById("countDay").innerHTML = "해당 펀딩은 종료되었습니다."; 
                    
                    //from 김성일
                    var target = ${funding_vo.fund_target_price};
                    var nowmoney = ${funding_vo.fund_total};
                    
                    if(target > nowmoney){
                       
                       document.getElementById("btn").innerHTML = "펀딩 실패";
                       document.getElementById("btn").setAttribute('onclick','finishFunding()');
                       document.getElementById("btn").setAttribute('style','background-color:gray;');
                          
                    }else{

                       document.getElementById("btn").innerHTML = "펀딩 성공";
                       document.getElementById("btn").setAttribute('onclick','finishFunding()');
                       document.getElementById("btn").setAttribute('style','background-color:#a0d9a0;');

                    }

               }
               
               
               });
               
               //from 김성일
               function finishFunding(){
                  
                  alert("종료된 펀딩입니다.");
                  
               }
               
               //from 김성일
               function fundingIt(){
                  
                  var fseq = ${funding_vo.fund_no};
                  location.href="funding.do?command=fundingIt&fseq="+fseq;
                  
               }

               var dt = "${funding_vo.fund_deadline}";
               var year =dt.getFullYear();
               var month =dt.getMonth();
               var day =dt.today.toLocaleDateString();
               console.log(year);
               console.log(month);
               console.log(day);
                     
               </script>
               
               <table style="margin-top: 20px;" >
                  <tr>
                     <td style="padding: 5px">메이커 정보 </td>
                     <td style="padding: 5px">${funding_vo.fund_creator }</td>
                  </tr>
                  <tr>
                     <td style="padding: 5px">마감기한 </td>
                     <td style="padding: 5px">${funding_vo.fund_deadline }</td>
                  </tr>
               </table>
               
               
               <div id=target_price style="font-size: 15pt;">
                  <p class="target_price" >
                     <script>
                     var nf = ${funding_vo.fund_target_price};
                     console.log(nf);
                     document.getElementById("target_price").innerHTML = "목표금액 <br><b style='font-size:30pt'>"+ nf.toLocaleString()+"</b> 원";
                     
                     </script>


                  </p>
               </div>
               <div id=total-amount style="font-size: 15pt;">
                  <p class="total-amount">
                     <script>
                     var nf2 = ${funding_vo.fund_total};
                     console.log(nf2);
                     document.getElementById("total-amount").innerHTML = "현재까지 모금된 금액 <br><b style='font-size:25pt'> "+ nf2.toLocaleString()+"</b> 원";
                     
                     </script>
                  </p>
               </div>
               
               


               <p class="total-supporter">
                  <strong></strong>
               </p>
            <c:if test="${!empty vo}">
               <div style="text-align: center;">
               <!-- from 김성일 -->
               
                  <button id="btn" onclick="fundingIt()" style="background-color: #a0d9d9">펀딩하기</button>
               </div>
               </c:if>
               <c:if test="${empty vo}">
               <button id="btn" onclick="disabledbtn();" style="background-color: #a0d9d9">펀딩하기</button>
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
                  
               <div class="target_price" style="text-align: center; padding-left: 110px">
               
                  <!-- joinlist -->
                  <table style="color: #676363; font-family: Roboto, 'Noto Sans KR', sans-serif;
                     position: relative; right: 45px;">
                     <tr>
                        <th>
                           <br><br><br>
                           &lt; &nbsp;&nbsp; 펀딩 참여자  &nbsp;&nbsp; &gt;
                        </th>
                     </tr>
                     <c:choose>
                        <c:when test="${empty joinlist }">
                           <tr>
                              <td>참여자가 없습니다.</td>
                           </tr>
                        </c:when>
                        <c:otherwise>
                           <c:forEach var="joinlist" items="${joinlist }">
                              <tr>
                                 <td>
                                 ${joinlist.acc_name } 님! 펀딩 참여해주셔서 <br>감사합니다.</td>
                              </tr>
                           </c:forEach>
                        </c:otherwise>
                     </c:choose>
                  </table>
                  
               </div>
            </div>
            
         
            
            

         </div>
         <div style="text-align: right; margin-right: 100px;">
          <%
   
            if(session.getAttribute("vo") != null){
               Vo_Account vo_a = (Vo_Account)session.getAttribute("vo");

               if(vo_a.getAcc_m_c().equals("M")){      
%>   

          <div style="text-align: right; margin-right: 100px;"><button id="deletebtn" onclick="deleteFunding()"> 펀딩삭제 </button></div>
<%
               }
            }

%>       
         </div>
      </div>
   </div>


   <!-- footer -->
   <%@ include file="/footer.jsp"%>



   <script
      src="<%=request.getContextPath() %>/RECOREMain/js/jquery-3.3.1.min.js"></script>
   <script
      src="<%=request.getContextPath() %>/RECOREMain/js/jquery-migrate-3.0.1.min.js"></script>
   <script src="<%=request.getContextPath() %>/RECOREMain/js/jquery-ui.js"></script>
   <script
      src="<%=request.getContextPath() %>/RECOREMain/js/popper.min.js"></script>
   <script
      src="<%=request.getContextPath() %>/RECOREMain/js/bootstrap.min.js"></script>
   <script
      src="<%=request.getContextPath() %>/RECOREMain/js/owl.carousel.min.js"></script>
   <script
      src="<%=request.getContextPath() %>/RECOREMain/js/jquery.stellar.min.js"></script>
   <script
      src="<%=request.getContextPath() %>/RECOREMain/js/jquery.countdown.min.js"></script>
   <script
      src="<%=request.getContextPath() %>/RECOREMain/js/jquery.magnific-popup.min.js"></script>
   <script
      src="<%=request.getContextPath() %>/RECOREMain/js/bootstrap-datepicker.min.js"></script>
   <script src="<%=request.getContextPath() %>/RECOREMain/js/aos.js"></script>

   <script src="<%=request.getContextPath() %>/RECOREMain/js/main.js"></script>

</body>
</html>