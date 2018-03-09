<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
<input type="text" value="text"/>
<input type="submit" onclick="aj()"/>
</form>
<script>
function aj(){
	var param = {
            uiId: '35'
        };
	$.ajax({
		url : "/api/test",
		type : "post",
		data :param,
		success : function(res) {
			alert("end");
		}
	});	
}
</script>
</html>