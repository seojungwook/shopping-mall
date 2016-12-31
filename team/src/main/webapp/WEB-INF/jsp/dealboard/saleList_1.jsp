<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp"%>

<input type="hidden" name="dealcheck" value="${param.dealcheck}">
<script>
	function drag(ev) {
		ev.dataTransfer.effectAllowed = "copy";
		ev.dataTransfer.setData("URL", ev.Source.href);

	}
</script>
<table align="left" border="0" width="100%">
	<tr>
		<td><c:if test="${param.dealcheck == 2}">
				<a href="saleList_1.html?category=${category}&dealcheck=0"
					style="text-decoration: none"> <img src="../main/sale.jpg"
					height="20">
			</c:if> <c:if test="${param.dealcheck == 2}">
				</a>
				<img src="../main/buybl.jpg" height="20">
			</c:if> <c:if test="${param.dealcheck == 0}">
				<img src="../main/salebl.jpg" height="20">
				<a href="saleList_1.html?category=${category}&dealcheck=2"
					style="text-decoration: none"> <img src="../main/buy.jpg"
					height="20">
			</c:if> <c:if test="${param.dealcheck == 0}">
				</a>
			</c:if></td>
	</tr>
	<tr align="center">
		<td><h2>${msg}</h2></td>
	</tr>
</table>
<hr>
<c:set var="listcut" value="0" />
<table width="100%" cellpadding="2" cellspacing="2" border="0">
	<c:if test="${listcount > 0}">
		<c:set var="boardNum" value="${listcount-(12*(pageNum-1))}" />
		<tr align="center">
			<c:forEach var="dealboard" items="${boardlist}">
				<td width="25%" id="${dealboard.fileUrl1}" draggable="true"
					ondragstart="drag(event)"><a
					href="saleDetail.html?num=${dealboard.bNo}&pageNum=${pageNum}&category=${category}&url=1"
					style="text-decoration: none"><img
						src="../file/${dealboard.fileUrl1}" width="130" height="100"></a><br>
					<%-- ${dealboard.bNo}<br> --%> ${dealboard.subject}<br>
					${dealboard.iprice}��&nbsp;&nbsp; ${dealboard.nickname}</td>
				<c:set var="listcut" value="${listcut+1}" />
				<c:if test="${listcut==4}">
		</tr>
		<tr align="center">
			<c:set var="listcut" value="0" />
	</c:if>
	<c:set var="boardNum" value="${boardNum-1}" />
	</c:forEach>
	</tr>
	</c:if>
	<tr>
		<td colspan="6"><hr></td>
	</tr>
	<tr align="center" height="26">
		<td colspan="6"><c:if test="${pageNum > 1}">
				<a
					href="saleList_1.html?pageNum=${pageNum-1}&category=${category}&dealcheck=${param.dealcheck}&searchContent=${param.searchContent}"
					style="text-decoration: none">
			</c:if> [����]&nbsp; <c:if test="${pageNum > 1}">
				</a>
			</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${pageNum == a}">[${a}]</c:if>

				<c:if test="${pageNum != a}">
					<a
						href="saleList_1.html?pageNum=${a}&category=${category}&dealcheck=${param.dealcheck}&searchContent=${param.searchContent}"
						style="text-decoration: none">[${a}]</a>&nbsp;
					</c:if>

			</c:forEach> <c:if test="${pageNum < maxpage}">
				<a
					href="saleList_1.html?pageNum=${pageNum+1}&category=${category}&dealcheck=${param.dealcheck}&searchContent=${param.searchContent}"
					style="text-decoration: none">
			</c:if> [����]&nbsp; <c:if test="${pageNum < maxpage}">
				</a>
			</c:if></td>
	</tr>
	<c:if test="${listcount == 0}">
		<tr>
			<td colspan="6" align="center">��ϵ� �Խù��� �����ϴ�.</td>
		</tr>
	</c:if>
	<c:if test="${param.category!=100}">
		<tr>
			<td colspan="3" align="left">
				<form
					action="salesearch.html?pageNum=${pageNum}&category=${param.category}&dealcheck=${param.dealcheck}&searchContent=${param.searchContent}"
					method="post">
					<input type="hidden" name="category" value="${param.category}">
					<input type="hidden" name="dealcheck" value="${param.dealcheck}">
					<select name="searchType">
						<option value="subject">����</option>
						<option value="nickname">�ۼ���</option>
						<option value="content">����</option>
					</select> <input type="text" name="searchContent"> <input
						type="submit" value="�˻�">
				</form>
			</td>
			<td colspan="3" align="right"><a
				href="saleAdd.html?category=${param.category}&dealcheck=${param.dealcheck}"
				style="text-decoration: none">[�۾���]</a></td>
		</tr>
	</c:if>
	<tr>
		<td><br></td>
	</tr>
</table>
