<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.mni.notice.*" %>
<jsp:useBean id="ndao" class="com.mni.notice.NoticeDAO"></jsp:useBean>
<%
String admin_id = (String)session.getAttribute("admin_saveid");
String ck = "";
Cookie cks[]=request.getCookies();
if(cks!=null){
	for(int i=0; i<cks.length; i++){
		//자동 로그인 쿠키 유무
		if(cks[i].getName().equals("admin_auto")){
			ck = cks[i].getValue();
		}
	}
	if(admin_id == null && !ck.equals("admin")){
		%><script>
		window.alert('로그인 후 이용가능합니다.');
		location.href='/mni/admin/index_admin.jsp';
		</script>
		<%
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 관리자 : 공지사항</title>
<link rel="stylesheet" type="text/css" href="/mni/css/adminList.css">
<style>

td{
	text-align: center;
}
</style>
</head>
<%
int totalCnt = ndao.getTotal();
int pageCnt = 5;
int pageButton = 10;

String cp_s = request.getParameter("cp");
if(cp_s == null || cp_s.equals("")){
   cp_s = "1";
}
int cp = Integer.parseInt(cp_s);

int totalPage = totalCnt / pageCnt +1;
if(totalCnt % pageCnt == 0){
   totalPage--;
}

int userGroup = cp / pageButton;
if(cp % pageButton == 0){
   userGroup--;
}
%>
<body>
<div class="divSize">
<%@ include file="admin_header/admin_header_6.jsp" %>
<h1>공지사항</h1>
<section>
	<article>
		<table class="notTable">
		<thead>
			<tr>
				<th>NO.</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>조회수</th>
				<th></th>
			</tr>
		</thead>
		<tfoot>
		   <tr>
            <td colspan="6" align="center">
         <%
         if(userGroup != 0){
            %><a href="notice.jsp?cp=<%=userGroup*pageButton%>">&lt;&lt;</a><%
         }
         for(int i = userGroup*pageButton+1; i<=(userGroup+1)*pageButton; i++){
            String button = i == cp ? "nowPage":"page";
            %>&nbsp;&nbsp;<button class="<%=button %>" onclick="javascript:location.href='notice.jsp?cp=<%=i%>'"><%=i %></button>&nbsp;&nbsp;<%
            if(i == totalPage){
               break;
            }
         }
         if(userGroup != (totalPage/pageButton-(totalPage%pageButton==0?1:0))){
            %><a href="notice.jsp?cp=<%=(userGroup+1)*pageButton+1%>">&gt;&gt;</a><%
         }
         %>
         </td>
         </tr>
		</tfoot>
		<tbody>
				<%
				ArrayList<NoticeDTO> arr=ndao.noticeList(cp,pageCnt);
				if(arr==null || arr.size()==0){
					%>
					<tr>
						<td colspan="6">등록된 공지사항이 없습니다.</td>
					</tr>
					<%
				}else{
					for(int i=0;i<arr.size();i++){
						NoticeDTO dto=arr.get(i);
						%>
						<tr>
							<td><%=dto.getNotice_idx() %></td>
							<td><a href="noticeList.jsp?idx=<%=arr.get(i).getNotice_idx()%>"><%=dto.getNotice_title() %></a></td>
							<td><%=dto.getAdmin_id() %></td>
							<td><%=dto.getNotice_date() %></td>
							<td><%=dto.getNotice_count() %></td>
						</tr>
						<%
					}
				}
				%>
		</tbody>
		</table>
		<div class="noticeUpBtn"><a href="noticeWrite.jsp"><input type="button" value="작성하기" class="longboxBtnDeco"></a></div>
		</article>
	</section>
</div>
</body>
</html>