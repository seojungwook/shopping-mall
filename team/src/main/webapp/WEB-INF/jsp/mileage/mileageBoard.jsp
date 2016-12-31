<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp"%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle" width="100%">
		<td colspan="7">
			<h2>���ϸ��� ����/ȯ�� �Խ���</h2>
		</td>
	</tr>
		<tr bgcolor="#EAEAEA" align="center" valign="middle" width="100%" height="50">
			<th width="8%" height="26">��ȣ</th>
			<th width="15%" height="26">����/ȯ��</th>
			<th width="25%" height="26">���ϸ���</th>
			<th width="14%" height="26">�ۼ���</th>
			<th width="17%" height="26">��¥</th>
			<th width="11%" height="26">ó����Ȳ</th>
			<th width="10%" height="26">����</th>

		</tr>
		<c:forEach var="mileage" items="${milelist}">
     		<c:if test="${USER_KEY.mNo == mileage.mNo || USER_KEY.grade == '9'}">
			<tr align="center" valign="middle" bordercolor="#333333">
				<td height="23">${mileage.listno }</td>

				<c:set var="boardNum" value="${boardNum -1 }" />

				<td align="center">
				
				<c:if test="${mileage.money=='����'}">����</c:if>

				<c:if test="${mileage.money=='ȯ��'}">ȯ��</c:if></td>
				
				<td align="center"><f:formatNumber value="${mileage.mileage }" pattern="#,##0" /> ��</td>
				
				<td align="center">
				${mileage.nickname}
				</td>

				<td align="center">
					<f:formatDate var="rdate" value="${mileage.regdate}" pattern="yyyy-MM-dd" /> <%-- ���� ��ϵ� �Խù� --%>
					<c:if test="${rdate == today }">
						<f:formatDate value="${mileage.regdate}" pattern="HH:mm:ss" />
					</c:if> <c:if test="${rdate != today }">
						<f:formatDate value="${mileage.regdate }"
							pattern="yyyy-MM-dd HH:mm" />
					</c:if></td>
				<td align="center">
					<c:if test="${mileage.mileage_check == 0}">
						���� ���
					</c:if>
					<c:if test="${mileage.mileage_check == 1}">
						���� �Ϸ�
					</c:if>
					<c:if test="${mileage.mileage_check == 2}">
						���� ���
					</c:if>
				</td>
				<td>
					<a href="delete.html?listno=${mileage.listno}" style="text-decoration: none">����</a>
				</td>
			</tr>
			</c:if>
		</c:forEach>

		<tr align="center" height="26">
			<td colspan="7"><c:if test="${pageNum >1}">
					<a href="list.html?pageNum=${pageNum -1 }">
				</c:if> [����] <c:if test="${pageNum >1 }">
					</a>&nbsp;
				</c:if> <c:forEach var="a" begin="${startpage }" end="${endpage }">
					<c:if test="${pageNum == a }">
						[${a }]
					</c:if>
					<c:if test="${pageNum != a }">
						<a href="list.html?pageNum=${a }">[${a }]</a>
					</c:if>
				</c:forEach> <c:if test="${pageNum < maxpage}">
					<a href="list.html?pageNum=${pageNum +1 }">
				</c:if>[����]&nbsp;<c:if test="${pageNum < maxpage }">
					</a>
				</c:if></td>
		</tr>
	<tr >
		<td colspan="7" align="right"><a href="mileageWrite.html"><img src="../img_board/add.png"></a></td>
	</tr>
</table>