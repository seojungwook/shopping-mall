<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<table border="1">
	<tr>
		<td colspan="2" align="center">
			���� ������
		</td>
	</tr>
	<tr>
		<td width="100" align="center">
			������ ���
		</td>
		<td>
			&nbsp;&nbsp;&nbsp;${USER_KEY.nickname}
		</td>
	</tr>
	<tr>
		<td align="center">
			�޴»��
		</td>
		<td>
			&nbsp;&nbsp;&nbsp;${nickName}
		</td>
	</tr>
	<tr> 
		<td align="center">
			����
		</td>
		<td>
			<textarea name = "centent" rows="20" cols="50"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="������">
			<input type="button" value="���">
		</td>
	</tr>
</table>