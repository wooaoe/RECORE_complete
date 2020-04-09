<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%request.setCharacterEncoding("UTF-8");%>
   <%response.setContentType("text/html; charset=UTF-8");%>
       
    
<%@ page import = "com.mvc.vo.Vo_Account" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   
<%@ page import="com.mvc.vo.Vo_Funding" %>    
<!DOCTYPE html>
<html>
	<!-- @@ RECORE favicon @@  -->
    <link rel="icon" href="<%=request.getContextPath()%>/images/recorefavi.png">
    
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

function checkpri(){
   var price = $("#fpm_price").val();
   
   
   if(price.length == 8){
      $("#fpm_card_name").focus();
   } 
   
}

function checkno(){
   var number = $("#fpm_card_name").val();
   
   
   if(number.length == 16){
      $("#fpm_card_pw").focus();
   } 
   
}

function checkpw(){
   var pw = $("#fpm_card_pw").val();
   
   
   if(pw.length == 4){
      $("#fpm_card_valid").focus();
   } 
   
}

function checkval(){
   var valid = $("#fpm_card_valid").val();
   
   if(valid.length == 4){
      $("#fpm_card_cvc").focus();
   }
}

$(document).ready(function() {
   
   $("input[name=fpm_price]").blur(function(){
         var priceCheck = RegExp(/^[1-9][\d]{4,7}$/);   
         var price = $("input[name=fpm_price]").val();
         
         if(!priceCheck.test($('#fpm_price').val()) && price!=""){
             alert("금액은 1111원 부터 99999999원까지 입력 가능합니다.");
             $('#fpm_price').val($('#fpm_price').val().replace(price,""));
             $('#fpm_price').focus();
          } 
     
      });
   $("input[name=fpm_card_name]").blur(function(){
       var cardCheck = RegExp(/^[0-9]{16}$/);   
       var fpm_card_name = $("input[name=fpm_card_name]").val();
       
       if(!cardCheck.test($('#fpm_card_name').val()) && fpm_card_name!=""){
           alert("카드번호는 16자리를 입력해주세요");
           $('#fpm_card_name').val($('#fpm_card_name').val().replace(fpm_card_name,""));
           $('#fpm_card_name').focus();
        } 
   
    });
   $("input[name=fpm_card_pw]").blur(function(){
       var pwCheck = RegExp(/^[0-9]{4}$/);   
       var fpm_card_pw = $("input[name=fpm_card_pw]").val();
       
       if(!pwCheck.test($('#fpm_card_pw').val()) && fpm_card_pw!=""){
           alert("카드비밀번호는 4자리를 입력해주세요");
           $('#fpm_card_pw').val($('#fpm_card_pw').val().replace(fpm_card_pw,""));
           $('#fpm_card_pw').focus();
        } 
   
    });
   $("input[name=fpm_card_valid]").blur(function(){
       var validCheck = RegExp(/^[0-9]{4}$/);   
       var fpm_card_valid = $("input[name=fpm_card_valid]").val();
       
       if(!validCheck.test($('#fpm_card_valid').val()) && fpm_card_valid!=""){
           alert("카드유효기간은 4자리를 입력해주세요");
           $('#fpm_card_valid').val($('#fpm_card_valid').val().replace(fpm_card_valid,""));
           $('#fpm_card_valid').focus();
        } 
   
    });
   $("input[name=fpm_card_cvc]").blur(function(){
       var cvcCheck = RegExp(/^[0-9]{2,4}$/);   
       var fpm_card_cvc = $("input[name=fpm_card_cvc]").val();
       
       if(!cvcCheck.test($('#fpm_card_cvc').val()) && fpm_card_cvc!=""){
           alert("카드cvc번호는 최대 4자리를 입력해주세요");
           $('#fpm_card_cvc').val($('#fpm_card_cvc').val().replace(fpm_card_cvc,""));
           $('#fpm_card_cvc').focus();
        } 
   
    });
   
   
   });      

</script>

<head>
<meta charset="UTF-8">
<title>RECORE &mdash; APPLY</title>


    <link href="<%=request.getContextPath() %>/RECOREMain/RECOREIssue/css/main.css" rel="stylesheet" media="all">

 <style>
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
     cursor: pointer;
   }
   #savebutton {
     width: 200px;
     margin-left: 220px;
     background: #185ac1;
     cursor: pointer;   
}

</style>



</head>
<body>
   <% Vo_Funding fvo = (Vo_Funding)request.getAttribute("fvo");%> 
   <% Vo_Account acc = (Vo_Account)session.getAttribute("vo"); %>
   <% String[] arr = acc.getAcc_phone().split("-"); %>

  <div class="page-wrapper bg-dark p-t-100 p-b-50">
        <div class="wrapper wrapper--w900">
      <div class="card card-6" >
                <div class="card-heading" >
                    <h2 class="title">펀딩 참여하기</h2>
                </div>
                <div class="card-body"style="border:0px;" >

                    
                    <form action="funding.do?command=payFunding" method="post" id="frm" enctype="multipart/form-data">
                  <input type="hidden" name="fund_no" value="<%=fvo.getFund_no()%>">
                  <input type="hidden" name="acc_no" value="<%=acc.getAcc_no()%>">
                        <div class="form-row" style="border:0px;">
                            <div class="name">참여 펀딩 이름 </div>
                            <div class="value">
                                ${fvo.fund_title}
                            </div>
                        </div>
                        <div class="form-row" style="border:0px;">
                            <div class="name">참여자 아이디</div>
                            <div class="value">
                                <div class="input-group">
                                <span id="customerNameArea"><%=acc.getAcc_id()%></span> </div>
                            </div>
                        </div>
                        <div class="form-row" style="border:0px;">
                            <div class="name">결제 금액</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-6" type="text" name="fpm_price" id="fpm_price"
                                    required="required" maxlength="8" onkeyup="checkpri();" >
                                     
                                     
                                </div>
                            </div>
                        </div>
                         <div class="form-row" style="border:0px;">
                            <div class="name">카드번호('-' 제외)</div>
                            <div class="value">
                                <div class="input-group">
                               <input type="text" class="input--style-6" name="fpm_card_name" 
                               id="fpm_card_name" maxlength="16" required="required" onkeyup="checkno();" >
                                      </div>
                            </div>
                        </div>

                        <div class="form-row" style="border:0px;">
                            <div class="name">카드 비밀번호</div>
                            <div class="value">
                                <div class="input">
                                    <input class="input--style-6"  type="password" name="fpm_card_pw" id="fpm_card_pw"
                                    maxlength="4" required="required" onkeyup="checkpw();" >   
                     </div>
                     </div>
                            
                        </div>   
                        <div class="form-row" style="border:0px;">
                            <div class="name">카드 유효기간<br> (XX월XX년순 입력)</div>
                             <div class="value">
                                <div class="input">
                                    <input class="input--style-6"  type="text" name="fpm_card_valid" id="fpm_card_valid"
                                    maxlength="4" required="required" onkeyup="checkval();">   
                     </div>
                     </div>
                            
                        </div>   
                         <div class="form-row" style="border:0px;">
                            <div class="name">카드 cvc 번호</div>
                             <div class="value">
                                <div class="input">
                                    <input class="input--style-6"  type="password" name="fpm_card_cvc"  id="fpm_card_cvc"
                                    maxlength="3" required="required" >   
                     </div>
                     </div>
                            
                        </div>
                        <br><br>
                          <input type="submit" id="savebutton" value="펀딩 참여하기" 
                          class="btn btn--radius-2 btn--blue-2" > 
                        <input type="button" id="backbutton" value="뒤로 가기"  
                        class = "btn btn--radius-2 btn--blue-2" onclick="history.back(-1);" > 
                    </form>
           
                </div>
                <div class="card-footer">
                </div>
            </div>
            </div>
            </div>
</body>
</html>