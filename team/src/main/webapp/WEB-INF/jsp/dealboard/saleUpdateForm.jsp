<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<script src="//cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
	function file_delete1(){
	document.updateform.file1_1.value="";
	document.getElementById("file_desc1").innerHTML="";
	}
	function file_delete2(){
	document.updateform.file2_1.value="";
	document.getElementById("file_desc2").innerHTML="";
	}
	function file_delete3(){
	document.updateform.file3_1.value="";
	document.getElementById("file_desc3").innerHTML="";
	}
	function file_delete4(){
	document.updateform.file4_1.value="";
	document.getElementById("file_desc4").innerHTML="";
	}
	function file_delete5(){
	document.updateform.file5_1.value="";
	document.getElementById("file_desc5").innerHTML="";
	}
</script>
<script>
function win_open() {
	var op = "width=300, height=50, scrollbars=yes, resizeable=no, left=150, top=150";
	window.open("fileimg.html", "picture1", op);
}
</script>
<form:form modelAttribute="dealboard" action = "saleUpdate.html?pageNum=${param.pageNum}" method = "post" enctype = "multipart/form-data" name = "saleUpdate">
   <input type = "hidden" name = "file1_1" value = "${dealboard.fileUrl1}"/>
   <input type = "hidden" name = "file2_1" value = "${dealboard.fileUrl2}"/>
   <input type = "hidden" name = "file3_1" value = "${dealboard.fileUrl3}"/>
   <input type = "hidden" name = "file4_1" value = "${dealboard.fileUrl4}"/>
   <input type = "hidden" name = "file5_1" value = "${dealboard.fileUrl5}"/>
   <input type = "hidden" name = "pageNum" value = "${param.pageNum}"/>
   <input type = "hidden" name = "url" value = "${param.url}"/>
   <form:hidden path="num" value="${param.num}"/>
   <form:hidden path="nickname"/>
   <form:hidden path="category" value="${param.category}"/>
   <form:hidden path="dealcheck" value="${param.dealcheck}"/>   
   <h2 align="center">�˴ϴ�_����</h2>
   <hr>
   <table width="100%" cellpadding="1" cellspacing="0">
      <tr>
      <th align="center">����</th>
      <td>
      <input type="text" name="subject" value="${dealboard.subject}"/>
      </td>
      </tr>
      <tr><td colspan="3"><hr></td></tr>
      <tr>
       <th width="100" align="center">�Ǹ��� ����</th>
   	   <td><table border="0">
   	   		<tr><th width="100">�̸�</th>
      			<td>${USER_KEY.name}</td>
      		</tr>
      		<tr><th>����ó</th>
      			<td>${USER_KEY.phone}</td>
      		</tr>
      		<tr><th>�ּ�</th>
      			<td>${USER_KEY.email}</td>
      		</tr>
      </table></td>
      <tr><td colspan="3"><hr></td></tr>
      
      <tr>
      	<th align="center">��ǰ����</th>
      	<c:if test="${dealboard.fileUrl1 != null}">
      		<script>
      			window.onload = function addpic(){
      				if('${dealboard.fileUrl1 != null}'){
     	 				document.getElementById("file1_1").src = "../file/${dealboard.fileUrl1}";
     	 			}
     	 		}
    	  	</script>
      	</c:if>
     	<td><table border="0">
     		<tr><th width="100">��ǰ�̸�</th>
      		<td width="400"><input type="text" name="iName" value="${dealboard.iName}"></td>
      		<td rowspan="3"><img id="file1_1" width="150" height="100">&nbsp;&nbsp;&nbsp;<br>
				<a href="javascript:win_open()" style="text-decoration: none">
					<font size="2">[�������]</font>&nbsp;&nbsp;&nbsp;
				</a>
			</td>
      		</tr>
      		<tr><th>��ǰ����</th>
      		<td><input type="text" name="iprice" value="${dealboard.iprice}">��</td>
      		</tr>
      		<tr><td colspan="2"><font size="2">
      		���� �� �ǸŰ� ������ ��ǰ, �Ǵ� ����ǰ��� ���� ��ǰ�� ����� �Ұ����ϸ�,<br>
      		���Ŀ��� �Ű� ���� ���� ��� �̿� ���� ������ ���� �� �ֽ��ϴ�.<br>
      		��ǥ������ 10MB �̸��� JPG, GIF ���ϸ� ����� �����մϴ�.</font>
      		</td>
      		<tr><th width="100">�����</th>
      			<td><input type="text" name="transport" value="${dealboard.transport}"></td>
      		</tr>
      		<tr>
     	</table></td>
      </tr>
      <tr><td colspan="3"><hr></td></tr>
      <tr><td colspan="2">
      	<textarea rows="10" cols="50" name="content">${dealboard.content}</textarea>
      	<script>
      		CKEDITOR.replace('content');
      	</script>
      </td>
      </tr>
      <tr><td colspan="3"><hr></td></tr>
      <tr>
      	<th height="25" align = "center">÷������</th>
      	<td>
      	<c:if test = "${!empty dealboard.fileUrl2 && !dealboard.fileUrl2.equals('')}">
            <div id = "file_desc2">
               <a href = "../file/${dealboard.fileUrl2}" style="text-decoration: none">${dealboard.fileUrl2} &nbsp;</a>
               <a href = "javascript:file_delete2()" style="text-decoration: none">[÷�����ϻ���]</a>
            </div>
         </c:if>
            &nbsp;
            <input type = "file" name = "picture2" id = "picture2" >
            <br>
      	</td>
      </tr>
      <tr>
      	<th height="25" align = "center">÷������</th>
      	<td>
      	<c:if test = "${!empty dealboard.fileUrl3 && !dealboard.fileUrl3.equals('')}">
            <div id = "file_desc3">
               <a href = "../file/${dealboard.fileUrl3}" style="text-decoration: none">${dealboard.fileUrl3} &nbsp;</a>
               <a href = "javascript:file_delete3()" style="text-decoration: none">[÷�����ϻ���]</a>
            </div>
         </c:if>
            &nbsp;
            <input type = "file" name = "picture3" id = "picture3" >
            <br>
      	</td>
      </tr>
      <tr>
      	<th height="25" align = "center">÷������</th>
      	<td>
      	<c:if test = "${!empty dealboard.fileUrl4 && !dealboard.fileUrl4.equals('')}">
            <div id = "file_desc4">
               <a href = "../file/${dealboard.fileUrl4}" style="text-decoration: none">${dealboard.fileUrl4} &nbsp;</a>
               <a href = "javascript:file_delete4()" style="text-decoration: none">[÷�����ϻ���]</a>
            </div>
         </c:if>
            &nbsp;
            <input type = "file" name = "picture4" id = "picture4" >
            <br>
      	</td>
      </tr>
      <tr>
      	<th height="25" align = "center">÷������</th>
      	<td>
      	<c:if test = "${!empty dealboard.fileUrl5 && !dealboard.fileUrl5.equals('')}">
            <div id = "file_desc5">
               <a href = "../file/${dealboard.fileUrl5}" style="text-decoration: none">${dealboard.fileUrl5} &nbsp;</a>
               <a href = "javascript:file_delete5()" style="text-decoration: none">[÷�����ϻ���]</a>
            </div>
         </c:if>
            &nbsp;
            <input type = "file" name = "picture5" id = "picture5" >
            <br>
      	</td>
      </tr>
      <tr><td><br></td></tr>
      <tr bgcolor="#cccccc">
         <td colspan = "2" style = "height : 1px"></td>
      </tr>
      <tr><td><br></td></tr>
      <tr align = "center" valign = "middle">
         <td colspan = "2"><a href = "javascript:document.saleUpdate.submit()" style="text-decoration: none">[����]</a>&nbsp;&nbsp;
         <a href = "saleList_1.html?pageNum=${pageNum}&category=${param.category}&dealcheck=${dealboard.dealcheck}" style="text-decoration: none">[���]</a>
         </td>
      </tr>
      <tr><td><br></td></tr>
   </table>
</form:form>