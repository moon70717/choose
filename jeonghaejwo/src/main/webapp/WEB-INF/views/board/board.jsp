<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 게시판 리스트를 확인하는 페이지 -->

<style>
	a {
		text-decoration: none;
	}
</style>
<title>Insert title here</title>
</head>
<body>

	<h1 style="text-align: center;">Board</h1>
	<h4 style="text-align:center;">${sessionScope.name }환영합니다</h4>
	<input type="button" value="로그아웃" onclick="window.location.assign('Logout')"/>
	<hr>
	<table style="width: 100%;">
		<tr>
		<td width=10%> No</td>
		<td width=15%> 아이디</td>
		<td width=50%> 제목</td> 
		<td width=15%> 등록일수</td>
		<td width=10%> 조회수</td>
		</tr>
		<c:forEach items="${boardVO}" var="a">
			<tr>	
				<td width=10%>${a.boardNo}</td>
				<td width=15%>${a.userNo}</td>
				<td width=50%><a href="Get?boardNo=${a.boardNo}">${a.boardTitle}</a></td>
				<td width=15%>${a.regist}</td>
				<td width=10%>${a.hit}</td>
			</tr>
		
		</c:forEach>
	</table>
	<hr>
	<input type="button" onclick="window.location.assign('boardWrite')" value="작성하기"/>
</body>
</html>