####  📢 Seung Hye Choi 기능 구현 설명 - RECORE <JSP MVC2 Semi Project>
> 담당 업무 - PM(팀장), UI 총괄, 카테고리 별 상품 목록, 
상품 상세 페이지/연관 상품 추천, 주문서 작성/결제페이지 구현


📩 contact - motop68@gmail.com





🎈 사용 언어 및 IDE
  1. Java 8 / jre 1.8.0_202
  2. JavaScript, jQuery
  3. JSP/Servlet
  4. HTML5, CSS
  5. Eclipse

🎈 Server 
  1. Apache Tomcat v9.0
  2. AWS EC2, Route 53 
 
🎈 협업/형상관리 Tool
  1. Slack
  2. Github / Github Desktop

🎈 DBMS 
  1. Oracle - SQL developer(11g)
  
🎈 OS
  1. Chrome




* * *   
#### WebContent -> RECOREMain -> RECOREProduct 경로로 들어가면 전체 jsp파일이 있습니다.
### 전체 흐름 
#### 👉🏻 Prod_All(Child, Parent) -> Prod_SingleDetail -> Prod_Checkout -> kakaopay -> kakaopay2 -> afterOrder_page    




#
#### 1. ProdAll / Parent / Child jsp file (Product_Controller, ProductDao, ProductImpl, Vo_Product)
- ProdAll.jsp
  - PRODUCT 카테고리 클릭 시 등록 된 전체 상품 조회(페이징)
- Parent.jsp
  - CLOTHING, LIFE는 자식 카테고리를 포함하는 부모 카테고리이기 때문에 하나의 jsp에서 처리(카테고리별 상품 조회)
- Child.jsp
  - Bag/Acc, Wallet, Clothing에 포함된 서브 카테고리, Life에 포함된 서브 카테고리를 하나의 jsp에서 처리(상품 조회)
  
  
 #### 2. Prod_SingleDetil jsp file 
 #### (Product_Controller, ProductDao, ProductImpl, Vo_Product, Vo_Review, Vo_QnA, Vo_Prod_option, Vo_Category_Detail)
 - Prod_SingleDetail.jsp
   - 상품 선택 시 보여지는 상세 페이지(Select One)
   - 상품 수량에 따라 가격 변동, ajax로 상품 옵션 선택 구현 
   - 해당 상품과 같은 카테고리 번호를 가진 상품들을 연관 상품으로 추천
   - 바로구매, 장바구니 -> 전체 옵션 값 필요 / 관심상품 -> 상품 시퀀스 번호만 필요 
   - 해당 상품에 리뷰와 Q&A가 존재하면 상위 5개만 뽑아서 조회
   
   
 #### 3. Prod_Checkout / Prod_Checkout2(Cart) / kakaopay, kakaopay2(바로구매) jsp file -> 바로구매와 장바구니 주문 따로 처리
 #### (Vo_Product, Vo_Prod_option, Vo_Account, MyPageDao)
 - Prod_Checkout.jsp
    - Prod_SingleDetail.jsp에서 바로구매 클릭 시 호출되는 페이지
    - 상품 옵션 값, 수량을 파라미터로 보내서 출력
    - 적립금 사용(유효성 검사) 및 도로명 주소 API를 통해 주문자의 주소 정보를 수정할 수 있다.(Prod_Checkout2.jsp도 동일) 
 - Prod_Checkout2.jsp (장바구니에서 주문하기 클릭 시 호출)
    - 장바구니에 있던 상품의 옵션 값, 수량을 배열 파라미터로 받은 뒤 출력(map사용)
 - kakaopay/kakaopay2.jsp
    - 주문서 작성 페이지에서 카카오페이 선택 후 결제하기를 누르면 팝업 호출됨 -> kakaopay.jsp
    - 호출 시 주문자의 정보들이 파라미터로 넘어간다. 
    - 정규식으로 유효성 검사를 하여 올바른 휴대폰 번호와 생년월일을 입력했는지 체크
    - 결제요청 클릭 시 Order_num(주문자 정보)가 insert됨과 동시에 kakaopay2.jsp 호출(결제를 완료해주세요 화면)
    - 취소 시 현재 주문 번호를 파라미터로 보내어 주문자 정보 삭제 
    - 결제 완료시 Prod_Order(주문 상품 정보) insert / 적립금 사용 유무에 따라 사용했으면 계정 적립금 update
     #### 💡 cartkakaopay / cartkakaopay2.jsp 는 장바구니에서 넘어올 때 보여지는 view이고 로직은 위와 같다.
    
    
#### 4. afterOrder_page / afterOrder_Cart.jsp
 - afterOrder_page.jsp
    - 결제가 완료되었을 때 호출되는 주문내역 페이지
    - 상품 정보, 주문자 정보, 적립금 사용유무를 보여준다. 
 - afterOrder_Cart.jsp 
    - 장바구니 상품이 결제 완료 되었을 때 호출되는 주문내역 페이지
    - 상품의 종류가 많으므로 배열로 만들어 파라미터를 보낸다. 
 
  
