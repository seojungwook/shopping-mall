<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/jsp/jspHeader.jsp"%>

<table width="100%" border="0" cellpadding="0" cellspacing="0" valign="top" align="center">
	<tr align="center" valign="middle" width="100%">
		<td colspan="6"><h2>${USER_KEY.name}����Zzim�Ѹ��</h2></td>
	</tr>
<c:if test="${countlist  == 0 }">
	<tr bgcolor="#EAEAEA" align="center" valign="middle" width="100%"
		height="50">
		 
		<th width="45%" headers="26">ǰ��</th>
		<th width="14%" headers="26">�ۼ���</th>
		<th width="17%" headers="26">��¥</th>
		<th width="20%" headers="26">�ŷ�����</th>
		<th width="22%" headers="26">���� </th>
	</tr>
	<tr width="100%">
		<td colspan="5" align="center"><br><br>����� ���׿� ...</td>
	</tr>
	</c:if>
	<c:if test="${countlist >0 }">
		<tr bgcolor="#EAEAEA" align="center" valign="middle" width="100%" height="50">
			<th width="40%" headers="26" colspan="2">ǰ��</th>
			<th width="15%" headers="26">�ۼ���</th>
			<th width="15%" headers="26">����</th>
			<th width="15%" headers="26">�ŷ�����</th>
			<th width="15%" headers="26">���� </th>
		</tr>
		<c:forEach var="zzim" items="${zzimlist}">
		<tr>
			<td align="center">
				<a href="../dealboard/saleDetail.html?num=${zzim.bNo}"><img src="../file/${zzim.picture1}" height="100"></a>
			</td>
			<td align="left">
				<a href="../dealboard/saleDetail.html?num=${zzim.bNo}">${zzim.iname}</a>
			</td>
			<td align="center">${zzim.nickname}</td>
			<td align="center">${zzim.iprice}��</td>
			<td align="center">
			<c:if test="${zzim.dealcheck==0}">
			�Ǹ���
			</c:if>
			<c:if test="${zzim.dealcheck==1}">
			�ŷ���
			</c:if>
			<c:if test="${zzim.dealcheck==2}">
			������
			</c:if>
			</td>
			<td align="center"><a href="zzimdel.html?num=${zzim.bNo}">X</a></td>
		</tr>
		</c:forEach>
	</c:if>
</table>