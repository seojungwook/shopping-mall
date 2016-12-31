<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file="/WEB-INF/jsp/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>



마일리지 충전/환금<br>
<br>
<form action="mileageApply.html" method="post" name="mileageApply">
<input type="hidden" name="mNo" value="${USER_KEY.mNo}">
회원번호 : ${USER_KEY.mNo}
<br>


<select name="money">
<option value="충전">충전</option>
<option value="환전">환전</option>
</select>
금액 : <input type="text" name="mileage"><br>


<a href="javascript:document.mileageApply.submit()">[등록]</a>
</form>
</body>
</html>