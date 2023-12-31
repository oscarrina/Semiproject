<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="/mni/css/header_cat.css">
    
  <%
    String id=(String)session.getAttribute("sid");
    %>
    
    <script>
       function userSearch(){
          var search = document.headerSearch.search.value;
          location.href = '/mni/headerSearch.jsp?search='+search;
       }
    </script>   
    <header>
    <div id="member">
    <%
    if(id==null){

    %>
           <a id="memberjoin" href="/mni/user/join.jsp">회원가입</a>
              <div class="t"></div>
           <a class="login" href="/mni/user/login.jsp">로그인</a>
                <div class="t"></div>
        <%
    }else{
        %>
             <div><%=id %>님 로그인 중
          |<a href="/mni/user/logout.jsp">로그아웃</a>
          <a href="/mni/user/usercheck.jsp">회원수정</a>
          </div>
        <% 
     }
        %>
           <a class="center" href="/mni/user/noticeList.jsp">고객센터</a>
    </div><br>
    <div class="header-content">
        <div class="logo" onclick="location.href='/mni/index.jsp'">
            <img class="mainlogo" src="/mni/img/mainlogo.png" alt="mainlogo">
        </div>
        <div class="l-logo">
        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <button class="l-button" onclick = "javascript:location.href='/mni/index.jsp?pet=d'">
            <img class="inactive-doglogo" src="/mni/img/dog-inactive.jpg" alt="dog-icon">
            <img class="active-doglogo" src="/mni/img/dog.jpg" alt="dog-icon">
            <div>강아지</div>
        </button>
        <span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <button class="r-button" id="active-button"  onclick="location.href='/mni/index.jsp?pet=c'">
            <img class="catlogo" src="/mni/img/cat-active.jpg" alt="cat-active icon">
            <div>고양이</div>
        </button>
        </div>
        <form name = "headerSearch" class="little-search" action = "/mni/headerSearch.jsp">
            <input type="text" maxlength="30" name="search" id="search" placeholder="검색어를 입력하세요.">
                <div id="magnifying-glass wrapper" onclick = "userSearch()">
                    <img id="search-icon" src="/mni/img/magnifying glass icon.png" alt="magnifying glass icon">
                </div>
        </form>
    <span class="top-right"> </span>
    </div>
    <section>
        <div class="dropdown">
            <nav class="dropbtn">
               <img class="iconmenu" src="/mni/img/Icon_Menu.png" alt="category">
                <span class="dropbtn_icon123">카테고리</span>
            </nav>
            <div class="dropdown-content">
                <a href="javascript:location.href='/mni/category.jsp?categoryNum=01'">사료</a>
                <a href="javascript:location.href='/mni/category.jsp?categoryNum=02'">간식</a>
                <a href="javascript:location.href='/mni/category.jsp?categoryNum=03'">용품</a>
                <a href="javascript:location.href='/mni/category.jsp?categoryNum=04'">장난감</a>
            </div>
        </div>
        <div class="btn"><a href="/mni/best.jsp">베스트</a></div>
        <div class="btn"><a href="/mni/newProduct.jsp">신상품</a></div>
        <div class="btn"><a href="/mni/brand.jsp">브랜드</a></div>
        <div class="right-section">
        <div class="cart-button" id="cart-icon" onclick = "javascript:location.href='/mni/user/usercart.jsp'">
            <img class="inactive-cart" src="/mni/img/cart-inactive.png" alt="cart-icon">
            <img class="active-cart" src="/mni/img/cart-active.png" alt="cart-icon">
        </div>
        <div class="my-button" id="my-icon" onclick = "javascript:location.href='/mni/user/orderdetail.jsp'">
            <img class="inactive-my" src="/mni/img/mypage-inactive.png" alt="mypage-icon">
            <img class="active-my" src="/mni/img/mypage-active.png" alt="mypage-icon">
        </div>
        </div>
    </section>
</header>
    