<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<!--  <table width="70%" height="10%" border="0" align="center" border="0">
	<tr>
		<td rowspan="2" align="center" valign="middle">
			<img src="../main/main_01.png" height="180" align="middle">
		</td>
		<td height="50%" align="center">
			<img src="../main/map_icon.gif" height="100" align="middle"> 
		</td> 
	</tr>
	<tr>
		<td height="50%">
			<img src="../main/mmm4.png" height="100">
		</td>
	</tr>
</table>
<br>--><br><br>
<table border="0" width="90%" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td><img src="../main/sale.jpg" height="20"></td>
	</tr>
	<tr><td><br></td></tr>
	<tr>
	  <c:forEach var="dealboard" items="${salelist}" begin="0" end="4">
		<td>
			<a href="../dealboard/saleDetail.html?num=${dealboard.bNo}&category=${dealboard.category}&pageNum=1&url=3" 
					style="text-decoration: none"><img src="../file/${dealboard.fileUrl1}" width="130" height="100"></a><br>
			<c:if test="${fn:length(dealboard.subject) == 6}">
			${dealboard.subject}...<br></c:if>
			<c:if test="${fn:length(dealboard.subject) != 6}">
			${dealboard.subject}<br></c:if>
			${dealboard.iprice}¿ø<br><br><br><br>
		</td>
	  </c:forEach>
	</tr>
	<tr>
		<td><img src="../main/buy.jpg" height="20"></td>
	</tr>
	<tr><td><br></td></tr>
	<tr>
		<c:forEach var="dealboard" items="${buylist}" begin="0" end="4">
		<td>
			<a href="../dealboard/saleDetail.html?num=${dealboard.bNo}&category=${dealboard.category}&pageNum=1&url=3" 
					style="text-decoration: none"><img src="../file/${dealboard.fileUrl1}" width="130" height="100"></a><br>
			<c:if test="${fn:length(dealboard.subject) == 6}">
			${dealboard.subject}...<br></c:if>
			<c:if test="${fn:length(dealboard.subject) != 6}">
			${dealboard.subject}<br></c:if>
			${dealboard.iprice}¿ø
		</td>
	  </c:forEach>
	</tr>
</table>