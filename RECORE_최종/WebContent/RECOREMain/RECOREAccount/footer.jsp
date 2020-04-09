<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!-- 상단으로 올라가기 -->
<div style = "position: fixed; bottom: 70px; right: 50px;">
   <a href = "#body"><img src = "<%=request.getContextPath()%>/images/chevron3.png" /></a>
</div>
    
<!-- footer 라인 -->
<footer class="site-footer border-top">
   <div class="container">
      <div class="row">
         <div class="footermain" style="font-size: 14px;">
            <ul>
               <li><a href="#">브랜드소개</a></li>
               <li><a href="#">이용안내</a></li>
               <li><a href="#">이용약관</a></li>
               <li><a href="#"><b>개인정보처리방침</b></a></li>
               <li><a href="#">FAQ</a></li>
            </ul>
         </div>
         <div class="footermain" style="font-size: 14px; margin-top: 20px;">
            <ol>
                  <li>회사명 : (주)RECORE</li>
                  <li>주소 : 06141 서울특별시 강남구 테헤란로 201 (역삼동) 남도빌딩 4층</li>
                  <li>대표번호 : 02-2458-5221</li>
                  <span>사업자등록번호 : 107-87-07004</span>
                  <br>
                  <li>고객센터 : 1577-5221</li>
                  <li>이메일 : recore@gmail.com</li>
                  <li>통신판매업 신고 : 2016-서울강남-00411</li>
                  <span>개발자: 김동현 김성일 박도영 박수지 주희진 최승혜</span> 
               </ol>
         </div>
         <div class="col-md-12" style="padding: 0px; margin-top: 20px;" >
            <div style="border-top: 0.1px solid #808080; height: 20px;"></div>
            <p style="font-weight: bold; text-align: center; font-size: 14px;">
               Copyright &copy;
               <script>
                  document.write(new Date().getFullYear());
               </script>
               All rights reserved | RECORE
            </p>
         </div>
      </div>
   </div>
</footer>


<style>

.footermain ol li::after {
    content: "";
    display: inline-block;
    width: 1px;
    height: 12px;
    background: #808080;
    margin: 0 8px 0 12px;
}

.footermain ol li,.footermain ol span{
   font-weight: bold;
}

.footermain{
font-family: "Nunito Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
}
.footermain a{
   color: #555555;
   font-weight: bold;
   font-size: 14px;
}
.footermain ul, .footermain ol{
   list-style:none;
    margin:0;
    padding:0;
    color:#808080;
 }
 
 .footermain ul li{
    margin: 0 0 0 0;
    padding: 0 0 0 0;
    border : 0;
    float: left;
    margin-right: 15px;
    font-size: 14px;
 }
 
.footermain ol li{
    margin: 0 0 0 0;
    padding: 0 0 0 0;
    border : 0;
    float: left;
    margin-left: 1px;
    color:#808080;
    font-size: 14px;
 }
</style>