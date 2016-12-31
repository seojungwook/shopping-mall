<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp"%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle" width="100%">
		<td colspan="7">
			<h2>마일리지 충전/환전 게시판</h2>
		</td>
	</tr>
		<tr bgcolor="#EAEAEA" align="center" valign="middle" width="100%" height="50">
			<th width="8%" height="26">번호</th>
			<th width="15%" height="26">충전/환전</th>
			<th width="25%" height="26">마일리지</th>
			<th width="14%" height="26">작성자</th>
			<th width="17%" height="26">날짜</th>
			<th width="11%" height="26">처리현황</th>
			<th width="10%" height="26">삭제</th>

		</tr>
		<c:forEach var="mileage" items="${milelist}">
     		<c:if test="${USER_KEY.mNo == mileage.mNo || USER_KEY.grade == '9'}">
			<tr align="center" valign="middle" bordercolor="#333333">
				<td height="23">${mileage.listno }</td>

				<c:set var="boardNum" value="${boardNum -1 }" />

				<td align="center">
				
				<c:if test="${mileage.money=='충전'}">충전</c:if>

				<c:if test="${mileage.money=='환전'}">환전</c:if></td>
				
				<td align="center"><f:formatNumber value="${mileage.mileage }" pattern="#,##0" /> 원</td>
				
				<td align="center">
				${mileage.nickname}
				</td>

				<td align="center">
					<f:formatDate var="rdate" value="${mileage.regdate}" pattern="yyyy-MM-dd" /> <%-- 오늘 등록된 게시물 --%>
					<c:if test="${rdate == today }">
						<f:formatDate value="${mileage.regdate}" pattern="HH:mm:ss" />
					</c:if> <c:if test="${rdate != today }">
						<f:formatDate value="${mileage.regdate }"
							pattern="yyyy-MM-dd HH:mm" />
					</c:if></td>
				<td align="center">
					<c:if test="${mileage.mileage_check == 0}">
						승인 대기
					</c:if>
					<c:if test="${mileage.mileage_check == 1}">
						승인 완료
					</c:if>
					<c:if test="${mileage.mileage_check == 2}">
						승인 취소
					</c:if>
				</td>
				<td>
					<a href="delete.html?listno=${mileage.listno}" style="text-decoration: none">삭제</a>
				</td>
			</tr>
			</c:if>
		</c:forEach>

		<tr align="center" height="26">
			<td colspan="7"><c:if test="${pageNum >1}">
					<a href="list.html?pageNum=${pageNum -1 }">
				</c:if> [이전] <c:if test="${pageNum >1 }">
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
				</c:if>[다음]&nbsp;<c:if test="${pageNum < maxpage }">
					</a>
				</c:if></td>
		</tr>
	<tr >
		<td colspan="7" align="right"><a href="mileageWrite.html"><img src="../img_board/add.png"></a></td>
	</tr>
</table>