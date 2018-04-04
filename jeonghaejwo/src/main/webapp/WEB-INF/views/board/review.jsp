<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW</title>
<style>
#review_containers{
background-image: url("${rPath}/imgs/board.jpg");
	background-repeat: repeat-y;
    background-position: center;
    padding-left: 3vw; 
    box-shadow: 20px 38px 34px -26px hsla(0,0%,0%,.2);
    border-radius: 255px 15px 225px 15px/15px 225px 15px 255px;
}
.write_btn_div{
	text-align: right;
}
.write_btn{
        background-color: #ffffff00;
    border-color: #ffffff;
    border: solid;
    margin: 0.5rem;
    color: white;
    box-shadow: 20px 38px 34px -26px hsla(0,0%,0%,.2);
    border-radius: 255px 15px 225px 15px/15px 225px 15px 255px;
    font-size: 2vmin;
}
.write_btn:focus{
	border-color: black; 
}
.writeReviewpen{
    margin-right: 2vw;
}
.review_container {
 	display: inline-block;
	margin: auto;
	/* border-style: dotted solid;
	border-width: 1px;
	border-color: #f9d201; */
	text-align: center;
	
}

.review_container>.grid-item {
	background-color: rgba(255, 255, 255, 0.8);
	text-align: center;
	padding: 10px;
	font-size: 30px;
}

.photoAndLocation {
	grid-template-columns: 1fr 2fr 2fr 2fr 1fr;
  	grid-template-areas:
  		". . photoPin . ." 
    	". reviewPhoto reviewPhoto reviewPhoto ."
    	". reviewPhoto reviewPhoto reviewPhoto ."
    	". reviewPhoto reviewPhoto reviewPhoto ."
    	". reviewLocation reviewLocation reviewLocation ."
    	". . . reviewPoint .";
    background-color: white;
    background: white;
	display: inline;
	float: left;
	margin: 0 1vw 2vw;
    padding: 0px 0.5vw 0.5vw;
	text-align: center;
	text-decoration: none;
	-webkit-box-shadow: 0 9px 10px rgba(0, 0, 0, 0.49);
	-moz-box-shadow: 0 9px 10px rgba(0, 0, 0, 0.49);
	box-shadow: 0 9px 10px rgba(0, 0, 0, 0.49);
	-webkit-transition: all .15s linear;
	-moz-transition: all .15s linear;
	transition: all .15s linear;
	z-index:0;
    position:relative;
    width: 14vw;
}
.photoPin{
grid-area: photoPin;
}
.photoPin>img{
width: 4rem;

    padding-bottom: 0.5rem;
}
.reviewPhoto{
	grid-area: reviewPhoto;
}
.reviewPhoto>img{
	width: 100%; 
}
.reviewLocation {
	grid-area: reviewLocation;
	color: black;
    font-size: 1vw;
}

.reviewPoint{
	grid-area: reviewPoint;
}
.reviewUserId{
    margin: 0 0 10px;
    text-align: right;
}
/* next 버튼 */
.rank_nextBtn{
color: white;
    background-color: #ffffff00;
    position: relative;
    top: 6vh;
    box-shadow: 20px 38px 34px -26px hsla(0,0%,0%,.2);
    border-radius: 255px 15px 225px 15px/15px 225px 15px 255px;
    font-size: 2vmin;
    border: solid 2px;
    transition:all .5s ease;
}
.rank_nextBtn_right{
    font-size: 3.5vmin;
    text-indent: 0.25em;
        margin-left: 3vw;
}
.rank_nextBtn:hover{
	background-color: white;
	color: black;
}
/* 새글쓰기 부분 */
.review_write_container {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	grid-template-areas: 
	"writeTitle writeTitle writeTitle writeTitle" 
	"imgUpload imgUpload reviewPoint reviewPoint"
	"preImg preImg reviewStar reviewStar" 
	"co co co co" 
	"co co co co";
	grid-gap: 10px;
	padding: 10px;
	    border: dotted 1px;
}

.review_write_container>div { 
	text-align: center;
	font-size: 3.5rem;
	
}

.title {
	grid-area: writeTitle;
}
.img_btn {
	grid-area: imgUpload;
}
.img_preview {
	grid-area: preImg;
    border: solid 1.5px rgba(199, 199, 199, 0.53);
    width: 50%;
    margin: auto;
}
.review_point {
	grid-area: reviewPoint;
}
.review_star{
	grid-area: reviewStar;
	margin: auto;
}
.review_write_contents {
	grid-area: co;
}

#preview_img {
	width: 5vw;
	margin-top: 0.1vw;
}
.review_modal_closeBtn{
	    background-color: #ff7070;
    color: white;
}
.review_modal_saveBtn{
    background-color: #5d5d5d;
    color: white;
}
}
/* 업로드 버튼  */
.img_btn label { 
display: inline-block;
    padding: .5em .75em;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-radius: .25em;
    color: #fff;
    background-color: #5d5d5d;
    border-color: #3c3c3c;
} 

.img_btn input[type="file"] {
 /* 파일 필드 숨기기 */ 
 position: absolute; 
 width: 1px; 
 height: 1px; 
 padding: 0; 
 margin: -1px; 
 overflow: hidden; 
 clip:rect(0,0,0,0); 
 border: 0; 
 }

/* 별점 */

fieldset, label { margin: 0; padding: 0; }

/****** Style Star Rating Widget *****/

.review_rating { 
  border: none;
  float: left;
}

.review_rating > input { display: none; } 
.review_rating > label:before { 
  margin: 5px;
  font-size: 1.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.review_rating > .half:before { 
  content: "\f089";
  position: absolute;
}

.review_rating > label { 
  color: #ddd; 
 float: right; 
}

/***** CSS Magic to Highlight Stars on Hover *****/

.review_rating > input:checked ~ label, /* show gold star when clicked */
.review_rating:not(:checked) > label:hover, /* hover current star */
.review_rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.review_rating > input:checked + label:hover, /* hover current star when changing rating */
.review_rating > input:checked ~ label:hover,
.review_rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.review_rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 
</style>
</head>
<body>
<div class='mainContainers'>
<h1 style='margin-top: 1vw;margin-bottom: -2.5vw;color: black'>솔직 방문 후기</h1>
	<!-- Button trigger modal -->
	<div class='write_btn_div'>
		<button type="button" class="btn write_btn" data-toggle="modal" data-target="#exampleModalCenter">
		<i class="fas fa-pencil-alt writeReviewpen"></i>글쓰기</button>
	</div>



	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document" style='color: black'>
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">후기를 써볼까?</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- 내용 -->
					<div class="review_write_container">
						<div class="title">제목
							<input class="location_input_text" id="loInput" type="text">
							<span class="highlight"></span> <span class="bar"></span>
							<hr>
						</div>
						<div class="img_btn">
							<f:form name="frmPopup" id="frmPopup" modelAttribute="popupVO"
								method="post" action="/file/upload"
								enctype="multipart/form-data">
								<label for="uploadFile"><i class="fas fa-upload"></i>   사진업로드</label>
								<input type="file" name="uploadFile" id="uploadFile">
							</f:form>
						</div>
						<div class='img_preview'>
							<img id="preview_img" src="${rPath}/imgs/img_sample2.jpg" alt="your image" />
						</div>
						<div class="review_point">점수</div>
						<div class="review_star">
							
							<fieldset class="review_rating">
							    <input type="radio" id="star5" name="rating" value="5" />
							  	<label class = "full" for="star5" title="Awesome - 5 stars"></label>
							    <input type="radio" id="star4half" name="rating" value="4 and a half" />
							    <label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
							    <input type="radio" id="star4" name="rating" value="4" />
							    <label class = "full" for="star4" title="Pretty good - 4 stars"></label>
							    <input type="radio" id="star3half" name="rating" value="3 and a half" />
							    <label class="half" for="star3half" title="Meh - 3.5 stars"></label>
							    <input type="radio" id="star3" name="rating" value="3" />
							    <label class = "full" for="star3" title="Meh - 3 stars"></label>
							    <input type="radio" id="star2half" name="rating" value="2 and a half" />
							    <label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
							    <input type="radio" id="star2" name="rating" value="2" />
							    <label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
							    <input type="radio" id="star1half" name="rating" value="1 and a half" />
							    <label class="half" for="star1half" title="Meh - 1.5 stars"></label>
							    <input type="radio" id="star1" name="rating" value="1" />
							    <label class = "full" for="star1" title="Sucks big time - 1 star"></label>
							    <input type="radio" id="starhalf" name="rating" value="half" />
							    <label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
							</fieldset>
													
						</div>
						<div class="review_write_contents">
						<hr>
							<textarea class="form-control" id="exampleTextarea" rows="8"></textarea>
						</div>
					</div>
					<!-- 내용끝 -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn review_modal_closeBtn"
						data-dismiss="modal" onclick="#">Close</button>
					<button type="button" class="btn review_modal_saveBtn" onclick="#">Save</button>
				</div>
			</div>
		</div>
	</div>
	<!--  -->

	<div id="review_containers">
		<div id="review_list">	
		</div>
		<div id="review_coments_modal" style="color:black"></div>
		<div style="text-align:right;">
		<button class='rank_nextBtn' onclick="nextReview()">next<i class="fas fa-angle-right rank_nextBtn_right"></i></button>
		</div>
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
</div>
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
	
	//여기서부터 시작
	$(document).ready(function(){
		getReview(1);
	});
	
	function nextReview(){
		var num=$("#review_list").children().last()[0].attributes.num.value;
		num*=1;
		num++;
		console.log(num);
		getReview(num);
	}
	
	function getReview(data){
		data*=1;
		var data={"startNo":data,
				"endNo":data+10};
		$.ajax({
			url : "/review/list",
			data : data,
			success : function(res){
				console.log(res);
				for(a of res){
					var degRandom = Math.floor((Math.random() * 40) - 20);
					var pin = Math.floor((Math.random() * 5) + 1);
					var temp="";
					var temp2="";
					temp+='<div class="review_container" num="'+a.recoNo+'" id="review'+a.recoNo+'">';
					temp+='<div class="photoAndLocation" style="transform: rotate('+degRandom+'deg)">';
					if(a.imgNo){
						temp+='<div class="grid-item photoPin"><img src="${rPath}/imgs/pins/pin'+pin+'.png" /></div>';
						temp+='<div class="grid-item reviewPhoto"><img data-toggle="modal" data-target="#reviewModal'+a.recoNo+'" src="'+a.imgPath+'" /></div>';
					}
					temp+='<div class="grid-item reviewPoint">'+a.point+'</div>';
					temp+='<div class="grid-item reviewLocation">'+a.placename+'</div></div>';
					temp+='</div>';
					
					temp2+='<div class="modal fade review" id="reviewModal'+a.recoNo+'" role="dialog"><div class="modal-dialog review">';
					temp2+='<div class="modal-content review"><div class="modal-header review"><button type="button" class="close" data-dismiss="modal">&times;</button>';
					temp2+='<h4 class="modal-title review">'+a.reTitle+'</h4></div>';
					temp2+='<div class="modal-body review"><p class=reviewUserId>'+a.userId+'</p>';
					temp2+='<p>'+a.comment+'</div>';
					temp2+='<div class="modal-footer review"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div>';
					
					$("#review_list").append(temp);
					$("#review_coments_modal").append(temp2);
				}
			}
		});
	}
	
</script>

</html>