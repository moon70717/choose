<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 작성하는 페이지 -->

</head>

<!-- <script>
	function check() {
		if ( !document.writeform.title.value ) {
			alert("제목을 입력해주세요");
			return;
		} else if ( !document.writeform.content.value ) {
			alert("내용을 입력해주세요");
			return;
		}
	
		document.writeform.submit();
	}
	  
</script> -->
<body>
		<form action=Write method=post name=writeform>
			제목:<input type="text" size=50 value="${board.title}" style="color:black";name=title placeholder="제목을 입력해주세요"/>
			<hr>
			<textarea style="width: 395px; height: 230px;color:black;" name=content >${board.content }</textarea>
			<input type=button onclick="check();" style="color:black" value="저장하기"/>		
		</form>
		<hr>
		글쓴이 : ${sessionScope.userName}


</body>
</html>

<!-- private int idx;
	private String userId;
	private String title;
	private String content;
	private String regist;
	private int hit; -->