<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.review_container {
  display: grid;
  grid-gap: 10px;
  background-color: #033e6d;
  padding: 10px;
  width: 94%;
}
.review_container>.grid-item {
  background-color: rgba(255, 255, 255, 0.8);
  text-align: center;
  padding: 20px;
  font-size: 30px;
}
.photo {
  grid-column: 1 / span 5 ;
}
.writer {
  grid-column: 5;
}
.location {
  grid-column: 1 / span 3;
}
.contents{

  grid-column: 1 / span 5;
}

</style>
</head>
<body>
<div class="review_container">
  <div class="grid-item photo">사진
  <img src="${rPath}/imgs/img_sample.jpg"/>
  </div>
  <div class="grid-item writer">작성일자, 글쓴이</div>  
  <div class="grid-item location">장소</div>
  <div class="grid-item contents">내용~~</div>
</div>
<hr>
<div class="review_container">
  <div class="grid-item photo">사진</div>
  <div class="grid-item writer">작성일자, 글쓴이</div>  
  <div class="grid-item location">장소</div>
  <div class="grid-item contents">내용~~</div>
</div>
<hr>
</body>
</html>