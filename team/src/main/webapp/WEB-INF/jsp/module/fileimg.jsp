<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이미지업로드</title>
</head>
<body>
<form name="f" action="fileimg2.html" method="post" enctype="multipart/form-data">
	<input type="file" name="picture1">
	<input type="submit" value="이미지등록">
</form>
</body>
</html>