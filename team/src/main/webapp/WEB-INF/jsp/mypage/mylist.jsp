<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/jsp/jspHeader.jsp"%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" valign="top" align="center">
   <tr align="center" valign="middle" width="100%">
      <td colspan="6"><h2>${USER_KEY.nickname}���� ������ ���</h2></td>
   </tr>
<c:if test="${mylistcount  == 0 }">
   <tr bgcolor="#EAEAEA" align="center" valign="middle" width="100%"
      height="50">
      <th width="45%" headers="26">ǰ��</th>
      <th width="14%" headers="26">�ۼ���</th>
      <th width="17%" headers="26">��¥</th>
      <th width="20%" headers="26">�ŷ�����</th>
   </tr>
   <tr width="100%">
      <td colspan="5" align="center"><br><br>������ ������ �����ϴ�.</td>
   </tr>
   </c:if>
   <c:if test="${mylistcount > 0 }">
      <tr bgcolor="#EAEAEA" align="center" valign="middle" width="100%" height="50">
         <th width="40%" headers="26" colspan="2">ǰ��</th>
         <th width="15%" headers="26">�ۼ���</th>
         <th width="15%" headers="26">����</th>
         <th width="15%" headers="26">�ŷ�����</th>
      </tr>
      <c:forEach var="mylist" items="${mylist}">
      <tr>
         <td align="center">
            <a href="../dealboard/saleDetail.html?num=${mylist.bNo}&url=2"><img src="../file/${mylist.fileUrl1}" height="100"></a>
         </td>
         <td align="left">
            <a href="../dealboard/saleDetail.html?num=${mylist.bNo}&url=2">${mylist.subject} </a>
         </td>
         <td align="center">${mylist.nickname}</td>
         <td align="center">${mylist.iprice}��</td>
      </tr>
      </c:forEach>
   </c:if>
</table>