<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.mni.userInfo.*" %>
<jsp:useBean id="udao" class="com.mni.userInfo.userInfoDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String userpwd=request.getParameter("pwd");
String id = (String)session.getAttribute("sid");
userInfoDTO dto = udao.loginCheck(id);
	if(userpwd!=""){
		if(userpwd.equals(dto.getUser_pwd())){
			%>
			<script>
			location.href='/mni/user/userInfo.jsp';
			</script>
			<%
		}else{
			%>
			<script>
			window.alert('비밀번호가 맞지 않습니다.');
			location.href='/mni/user/usercheck.jsp';
			</script>
			<%
		}
	}else{
		%>
		<script>
		window.alert('비밀번호를 입력해주세요.');
		location.href='/mni/user/usercheck.jsp';
		</script>	
	<%
	}
%>