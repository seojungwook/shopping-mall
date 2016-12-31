<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
	opener.document.saleAdd.fileUrl1.value="${picture1}";
	img = opener.document.getElementById("file1_1");
	//opener.document.getElementById("file1").value = ${file1};
	img.src="${pageContext.request.contextPath}/file/${picture1}"
	self.close();
</script>