<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<!-- 게시물을 클릭하면 볼 페이지 -->
<body>
	<h1 style="text-align:center;">${boardVO.boardTitle}</h1>
	<hr>
	<p>
	<hr>
	글쓴이 : ${board.userId}<br>
	작성시간 : ${board.regist }<br>
	<input type=button value=수정하기 onclick="window.location.assign('UpdateForm?boardNo=${boardVO.boardNo }')"/>
	<input type=button value=삭제하기 onclick="window.location.assign('Delete?boardNo=${boardVO.boardNo}')"/>


</body>
</html>