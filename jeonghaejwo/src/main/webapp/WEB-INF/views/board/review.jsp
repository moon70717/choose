<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW</title>
<style>
.review_container {
	display: grid;
	grid-template-columns: repeat(5, 1fr);
	grid-template-areas: "pt pt pt pt pt" "pt pt pt pt pt" ".  .  wr wr wr"
		".  .  lo lo lo" "co co co co co";
	grid-gap: 8px;
	padding: 10px;
	width: 50%;
	margin: auto;
	border-style: dotted solid;
	border-width: 1px;
	border-color: #f9d201;
}

.review_container>.grid-item {
	background-color: rgba(255, 255, 255, 0.8);
	text-align: center;
	padding: 10px;
	font-size: 30px;
}

.photo {
	grid-area: pt;
}

.photo>img {
	width: 100%;
}

.writer {
	grid-area: wr;
}

.location {
	grid-area: lo;
}

.contents {
	grid-area: co;
}

hr {
	width: 50%;
	margin: auto;
}

#preview_img {
	
}
/* 새글쓰기 부분 */
.review_write_container {
  display: grid;
    grid-template-columns: repeat(4, 1fr);
    grid-template-areas: 
    "tn tt tt tt"
    "fi fi pr pr"
    "to to to to"
    "co co co co"
    "co co co co";
  grid-gap: 10px;
  background-color: #2196F3;
  padding: 10px;
}
.review_write_container > div {
  background-color: rgba(255, 255, 255, 0.8);
  text-align: center;
  padding: 20px 0;
  font-size: 10px; 
}
.title {
grid-area:tn;
}

.title_write {
grid-area:tt;

}
.img_btn{
grid-area:fi;
}

.img_preview{
grid-area:pr;
}
.review_tools{
grid-area:to;
}
.review_write_contents{
grid-area:co;
}
#preview_img{
width:80%;
}
</style>
</head>
<body>
	<h1>솔직 방문 후기</h1>
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#exampleModalCenter">글쓰기</button>



	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document"
			style='color: black'>
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- 내용 -->
					<div class="review_write_container">
						<div class="title">
						제목
						</div>
						<div class="title_write">
							<input class="location_input_text" id="loInput" type="text">
							<span class="highlight"></span> <span class="bar"></span>
						</div>
						<div class="img_btn">
						<f:form name="frmPopup" id="frmPopup" modelAttribute="popupVO" method="post" action="/file/upload" enctype="multipart/form-data">
							<input type="file" name="uploadFile" id="uploadFile">
							
						</f:form>
						</div>
						<div class='img_preview'>
							<img id="preview_img" src="#" alt="your image" />
						</div>
						<div class="review_tools">도구</div>
						<div class="review_write_contents">
							<textarea class="form-control" id="exampleTextarea" rows="8"></textarea>
						</div>
					</div>
					<!-- 내용끝 -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<!--  -->

	<div class="review_container">
		<div class="grid-item photo">
			<img src="${rPath}/imgs/img_sample.jpg" />
		</div>
		<div class="grid-item writer"></div>
		<div class="grid-item location"></div>
		<div class="grid-item contents"></div>
	</div>

	<%-- <hr>
	<div class="review_container">
		<div class="grid-item photo">
			<img src="${rPath}/imgs/img_sample.jpg" />
		</div>
		<div class="grid-item writer">작성일자, 글쓴이</div>
		<div class="grid-item location">장소</div>
		<div class="grid-item contents">내용~~</div>
	</div>
	<hr> --%>
</body>
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
				$('#preview_img').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</html>