<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/jsp/jspHeader.jsp"%>
<script>
function login() {
	alert("�α��κ��� ���ּ���");
	location.href='../member/loginForm.html';
}
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" valign="top">
	<tr align="center" valign="middle" width="100%">
		<td colspan="5">
			<h2>${msg}</h2>
		</td>
	</tr>
	<c:if test="${listcount > 0}">
		<tr bgcolor="#EAEAEA" align="center" valign="middle" width="100%" height="50">
			<th width="8%" headers="26">��ȣ</th>
			<th width="50%" headers="26">����</th>
			<th width="14%" headers="26">�ۼ���</th>
			<th width="17%" headers="26">��¥</th>
			<th width="11%" headers="26">��ȸ��</th>
		</tr>
		<c:forEach var="board" items="${boardlist}">
			<tr align="center" valign="middle" height="40">
				<td>
					${listcount}
				</td>
				<td align="left"><c:choose>
				 	<c:when test="${board.no>0}">
						<c:forEach begin="1" end="${board.no}" step="1">
						<!-- �۹�ȣ -->
						</c:forEach>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="detail.html?no=${board.no}&pageNum=${pageNum}&category=${param.category}" style="text-decoration: none">${board.subject}</a>
						<c:if test="${not empty board.fileUrl}">
							<a href="filedown.html?filename=${board.fileUrl }"><img src="../img/img.png"></a>
						</c:if>
					</c:when>
					<c:otherwise>
						<a href="detail.html?no=${board.no}&pageNum=${pageNum}&category=${param.category}" style="text-decoration: none">${board.subject}</a>
						<c:if test="${not empty board.fileUrl}">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="filedown.html?filename=${board.fileUrl }"><img src="../img/img.png"></a>
						</c:if>
					</c:otherwise></c:choose></td>
				<td align="center">
					<%-- ${board.nickname} --%>
					test
				</td>
                <c:choose>
                	<c:when test="${board.getFormat() == today}">
                		<td align="center">
                			<f:formatDate value="${board.regDate}" pattern="hh:mm:ss"/>
                		</td>
					</c:when>
					<c:otherwise>
					<td align="center">
						<f:formatDate value="${board.regDate}" pattern="yyyy-MM-dd"/>
					</td>
					</c:otherwise>
                </c:choose>
				<td align="center">
					${board.readCnt}
				</td>
			</tr>
		</c:forEach>
		<tr align="center" height="30">
			<td colspan="5">
				<c:if test="${pageNum > 1 }">
					<a href="${gu}.html?pageNum=${pageNum -1}&searchtype=${searchtype}&searchContent=${searchContent}&category=${param.category}" style="text-decoration: none">
				</c:if>[����]&nbsp; 
				<c:if test="${pageNum > 1}">
					</a>
				</c:if> 
				<c:forEach var="a" begin="${startpage}" end="${endpage}">
					<c:if test="${pageNum == a }">[${a}]</c:if>
					<c:if test="${pageNum != a}">
						<a href="${gu}.html?pageNum=${a}&searchtype=${searchtype}&searchContent=${searchContent}&category=${param.category}" style="text-decoration: none">[${a}]</a>
					</c:if>&nbsp;
				</c:forEach> 
				<c:if test="${pageNum < maxpage }">
					<a href="${gu}.html?pageNum=${pageNum+1 }&searchtype=${searchtype}&searchContent=${searchContent}&category=${param.category}" style="text-decoration: none">
				</c:if> [����]&nbsp; 
				<c:if test="${pageNum < maxpage }">
					</a>
				</c:if>
			</td>
		</tr>
	<c:if test="${not gu.equals('search')}">
		<tr>
			<td colspan="5" align="center">
				<form action="search.html?category=${category}" method="post">
					<select name="searchtype" id="searchtype">
						<option selected="selected" value="subject">����</option>
						<option value="nickName">�ۼ���</option>
						<option value="content">����</option>
					</select>&nbsp;

					<!-- <script>
					if(${searchContent !=""}){
						document.getElementById("searchtype").value = '${param.searchtype}';						
					};
					</script> -->
					<input type="text" name="searchContent" value="${param.searchContent }"> 
					<input type="submit" value="�˻�">
				</form>
			</td>
		</tr>
		</c:if>
	</c:if>
	<c:if test="${listcount == 0}">
		<tr bgcolor="#EAEAEA" align="center" valign="middle">
			<td width="8%" headers="26"><h4>��ȣ</h4></td>
			<td width="50%" headers="26"><h4>����</h4></td>
			<td width="14%" headers="26"><h4>�ۼ���</h4></td>
			<td width="17%" headers="26"><h4>��¥</h4></td>
			<td width="11%" headers="26"><h4>��ȸ��</h4></td>
		</tr>
		<tr>
			<td>
				<br><br>
			</td>
		</tr>
		<tr width="100%">
			<td align="center" colspan="5">��ϵ� �Խù��� �����ϴ� .<br></td>
		</tr>
		<tr>
			<td>
				<br><br>
			</td>
		</tr>
	</c:if>
	<tr>
	    <c:if test="${not empty USER_KEY}">
		<td colspan="5" align="right"><a href="add.html?category=${category}"><img src="../img_board/add.png"></a></td>
		</c:if>
		<c:if test="${empty USER_KEY}">
		<td colspan="5" align="right"><a href="javascript:login()"><img src="../img_board/add.png"></a></td>
		</c:if>
	</tr>
</table>