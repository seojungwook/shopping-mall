<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	function SubmitSearch() {
		document.search.submit();
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Give & Take</title>
</head>
<body>
	<center>

		<table border="0" width="85%" height="100%" cellpadding="0"
			cellspacing="0">
			<tr>
				<td><tiles:insertAttribute name="top" /></td>
			</tr>
		</table>
		
		<table border="0" width="85%" height="100%" align="center" valign="top" cellpadding="0" cellspacing="0">
			<tr>
				<td width="15%" valign="top">
					<table valign="top" width="100%" cellpadding="0" cellspacing="0">
						<tr width="100%">
							<td valign="top" width="100%">
								<tiles:insertAttribute name="left" />
							</td>
						</tr>
						<tr width="100%">
							<td width="100%">
								<tiles:insertAttribute name="chat" />
							</td>
						</tr>
						<tr width="100%">
							<td width="100%">
								<tiles:insertAttribute name="left2" />
							</td>
						</tr>
					</table>
				</td>
				<td rowspan="3" valign="top">
					<table width="100%" height="100%" align="center" valign="top">
						<tr>
							<td height="100%" valign="top">
								<tiles:insertAttribute name="body" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table border="0" width="100%">
			<tr>
				<td colspan="2">
					<br><br><br><br><br><br>
					<tiles:insertAttribute name="bottom" />
				</td>
			</tr>
		</table>
	</center>
</body>
</html>