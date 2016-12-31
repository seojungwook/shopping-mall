<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<table border="1">
	<tr>
		<td colspan="2">
			쪽지함
		</td>
	</tr>
	<tr>
		<td>
			받는사람
		</td>
		<td>
			<input type="text" name="nickname">
		</td>
	</tr>
	<tr> 
		<td>
			내용
		</td>
		<td>
			<textarea name = "centent" rows="20" cols="50"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="전송">
			<input type="button" value="취소">
		</td>
	</tr>
</table>