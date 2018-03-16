<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="file-form" action="/file/upload" method="post" enctype="multipart/form-data">
		<input type="file" name="file" id="uploadFile">
		<input type="submit" onclick="sub()">
	</form>
</body>
<script>
function sub(){
	var formData=new FormData($("#file-form")[0]);
	$.ajax({
        type : 'post',
        url : '/file/upload',
        data : formData,
        processData : false,
        contentType : false,
        success : function(html) {
            alert("파일 업로드하였습니다.");
        }
	});
	
}
</script>
</html>