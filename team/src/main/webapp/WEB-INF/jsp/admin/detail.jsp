
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>${msg} 게시판 상세</title>
</head>
<body>
	<table width="100%" cellpadding="0" cellspacing="0">
		<tr align="center" valign="middle">
			<td colspan="2">${msg }게시판</td>
		</tr>
		<tr>
			<td>글쓴이 :${board.nickname}</td>
		</tr>
		<tr bgcolor="#cccccc">
			<td colspan="2" style="height: 1px;"></td>
		</tr>
		<tr>
			<td>제목 :${board.subject}</td>
		</tr>
		<tr bgcolor="#cccccc">
			<td colspan="2" style="height: 1px;"></td>
		</tr>
		<tr>
			<td>내용</td>
		<tr bgcolor="#cccccc">
			<td colspan="2" style="height: 1px;"></td>
		</tr>
		<td><table border="0" width="490" height="250">
			<tr>
				<td>${board.content}
			</table></td>
		</tr>
		<tr>
			<td align="left">첨부파일 :
			&nbsp;
			<c:if test="${!empty board.fileUrl}">
			<a href="../upload/${board.fileUrl}">${board.fileUrl}</a>
			</c:if>
			</td>
		</tr>
		<tr bgcolor="#cccccc">



			<td colspan="2" style="height: 1px;"></td>
		</tr>

		<tr align="center" valign="middle">
			<td colspan="2">
				<a href="modifyf.html?no=${board.no}&pageNum=${param.pageNum}&category=${param.category}">[수정]</a>&nbsp;&nbsp;
				<a href="deletef.html?no=${board.no}&pageNum=${param.pageNum}&category=${param.category}">[삭제]</a>&nbsp;&nbsp;
				<a href="list.html?pageNum=${param.pageNum}&category=${param.category}">[목록]</a>&nbsp;&nbsp;
			</td>
		</tr>
	</table>
	<form action="reply.html" method="post" name="reply">
      <input type="hidden" name="nickname" value="${USER_KEY.nickname}">
      <input type="hidden" name="no" value="${param.no}">
      <input type="hidden" name="category" value="${param.category}">
      <input type="hidden" name="pageNum" value="${param.pageNum}">
      <input type="hidden" name="mNo" value="${USER_KEY.mNo}">
      <table>
        
         <tr>
            <td>
               <tr><td height="25">내용</td>
               <td><textarea name="content" cols="67" rows="4"></textarea>
            </td>
            <td align="right">
               <a href="javascript:document.reply.submit()">
                  [등록]
               </a>&nbsp;
            </td>
         </tr>
   </table>
</form>	
	 <table>
     <c:forEach var="comment" items="${replyList }"> 
        <table >
          <tr align="center" valign="middle" bordercolor="#333333"
            onmouseover="this.style.backgroundColor='#5CD1E5'"
            onmouseout="this.style.backgroundColor=''">
            <td align="center" width="100"><font size="2.5">${comment.nickname }</font></td>
            <td height="20" width="400" align="left">   
            <font size="2.5">   
               ${comment.content }</font></td>
            
            <td align="center"> <font size="2">작성일 :
               <c:if test="${comment.format == today}">
                  <f:formatDate value="${comment.cdate}" pattern="HH : mm : ss"/><br>
               </c:if>
               <c:if test="${comment.format != today}">
                  <f:formatDate value="${comment.cdate}" pattern="yyyy-MM-dd  HH : mm "/><br>
               </c:if>
                </font>
               <c:if test="${USER_KEY.mNo == comment.mNo || USER_KEY.grade == '9'}">
                  <a href="replyDelete.html?commentno=${comment.commentno }&no=${param.no}&pageNum=${pageNum}&category=${comment.category}">
                  <font size="2">X</font></a>
                  </c:if>
         </td>
      </tr> 
   </table>
</c:forEach> 
   </table>
</body>
</html>