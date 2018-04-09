<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	$(function() {
		$("#uploadFile").on('change', function() {
			readURL(this);
		});
	});
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	//serialize를 이용하여 form 데이터를 보내는 형식
	function up(){
		//$("#frmPopup").submit();
		var formData=$("#frmPopup").serialize();
		//ajax("${root}/file/upload",back,formData);
		ajax("${root}/file/upload",back,formData,"multipart/form-data");
	}
	function back(res){
		console.log(res);
	}
</script>
</head>
<body> 
	<!--  action="/file/upload" -->
	<!-- 위쪽에 태그라이브러리 추가되어있음 -->
	<f:form name="frmPopup" id="frmPopup" modelAttribute="popupVO"
		method="post" enctype="multipart/form-data">
		<!-- 요놈이 업로드됨 -->
		<input type="file" name="uploadFile" id="uploadFile">
		<img id="blah" src="#" alt="your image" />
		<input type="submit" value="클릭1" onclick="up()">
	</f:form>
</body>
</html>