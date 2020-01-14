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
<script type="text/javascript">


var cardNumber = document.getElementById('fpm_card_number');
cardNumber.onkeyup = function(event){
    event = event || window.event;
    var _val = this.value.trim();
    this.value = autoHypenCard(_val) ;
};
function autoHypenCard(str){
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if( str.length < 4){
        return str;
    }
    else if(str.length < 8){
        tmp += str.substr(0, 4);
        tmp += '-';
        tmp += str.substr(4,4);
        return tmp;
    }else if(str.length < 12){
        tmp += str.substr(0, 4);
        tmp += '-';
        tmp += str.substr(4, 4);
        tmp += '-';
        tmp += str.substr(8,4);
        return tmp;
    }else if(str.length < 17) {
        tmp += str.substr(0, 4);
        tmp += '-';
        tmp += str.substr(4, 4);
        tmp += '-';
        tmp += str.substr(8,4);
        tmp += '-';
        tmp += str.substr(12,4);
        return tmp;
    }
    return str;
}
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


    <link href="<%=request.getContextPath() %>/RECOREMain/RECOREIssue/css/main.css" rel="stylesheet" media="all">

</head>
<body>
   <% Vo_Funding fvo = (Vo_Funding)request.getAttribute("fvo");%> 
   <% Vo_Account acc = (Vo_Account)session.getAttribute("acc"); %>
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
                                    <input class="input--style-6" type="number" name="fpm_price" >
                                     
                                </div>
                            </div>
                        </div>
                         <div class="form-row" style="border:0px;">
                            <div class="name">카드번호('-' 제외)</div>
                            <div class="value">
                                <div class="input-group">
                               <input type="text" class="input--style-6" name="fpm_card_name" id="fpm_card_number" maxlength="19" >
                                      </div>
                            </div>
                        </div>
<
                        <div class="form-row" style="border:0px;">
                            <div class="name">카드 비밀번호</div>
                            <div class="value">
                                <div class="input">
                                    <input class="input--style-6"  type="password" name="fpm_card_pw" maxlength="4">   
                     </div>
                     </div>
                            
                        </div>   
                        <div class="form-row" style="border:0px;">
                            <div class="name">카드 유효기간<br> (XX월XX년순 입력)</div>
                             <div class="value">
                                <div class="input">
                                    <input class="input--style-6"  type="text" name="fpm_card_valid" maxlength="4">   
                     </div>
                     </div>
                            
                        </div>   
                         <div class="form-row" style="border:0px;">
                            <div class="name">카드 cvc 번호</div>
                             <div class="value">
                                <div class="input">
                                    <input class="input--style-6"  type="password" name="fpm_card_cvc"maxlength="4" >   
                     </div>
                     </div>
                            
                        </div>
                        <br><br>
                       <input type="submit" id="savebutton" value="펀딩 참여하기" class="btn btn--radius-2 btn--blue-2"
                        onclick="location.href='funding.do?command=selectAllFunding&pageno=1'" > 
                       
                    
                    </form>
           
                </div>
                <div class="card-footer">
               
                </div>
            </div>
            </div>
            </div>
</body>
</html>