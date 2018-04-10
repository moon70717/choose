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
<script>
	function goPost(id) {
		$("#goContentIdx").val(id);
		$("#goContent").submit();
	}
</script>
<body>
	<div class='mainContainers'>
		<h1 style="text-align: center;">Board</h1>
		<h4 style="text-align: center;">${sessionScope.userName }환영합니다</h4>
		<!-- 	<input type="button" value="로그아웃" onclick="window.location.assign('Logout')"/> -->
		<hr>
		<table class="table-hover" style="width: 100%;">
			<tr>
				<td width=10%>No</td>
				<td width=15%>아이디</td>
				<td width=50%>제목</td>
				<td width=15%>등록일수</td>
				<td width=10%>조회수</td>
			</tr>
			<c:forEach items="${board}" var="a">
				<tr id="${a.idx}" onclick="goPost(id)" style="cursor: pointer;">
					<td width=10%>${a.idx}</td>
					<td width=15%>${a.userName}</td>
					<td width=50%>${a.title}</td>
					<td width=15%>${a.regist}</td>
					<td width=10%>${a.hit}</td>
				</tr>
			</c:forEach>
		</table>

		<form id="goContent" action="/path/board/Get" method="get" style="display: none;">
			<input id="goContentIdx" name="idx">
		</form>

		<hr>
		<input type="button" onclick="window.location.assign('WriteForm')"
			value="작성하기" />
	</div>
</body>
</html>

<!-- private int idx;
	private String userId;
	private String title;
	private String content;
	private String regist;
	private int hit; -->