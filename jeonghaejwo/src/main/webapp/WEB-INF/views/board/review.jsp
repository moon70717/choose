<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${root}/resources/css/review.css${ver}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REVIEW</title>

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
							    <input type="radio" id="star4" name="rating" value="4" />
							    <label class = "full" for="star4" title="Pretty good - 4 stars"></label>
							    <input type="radio" id="star3" name="rating" value="3" />
							    <label class = "full" for="star3" title="Meh - 3 stars"></label>
							    <input type="radio" id="star2" name="rating" value="2" />
							    <label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
							    <input type="radio" id="star1" name="rating" value="1" />
							    <label class = "full" for="star1" title="Sucks big time - 1 star"></label>
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
					<button type="button" class="btn review_modal_saveBtn" onclick="upload()">Save</button>
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
function swing() {
    $('.photoAndLocation').animate({'top':'5px'},600).animate({'top':'10px'},600, swing);
}

$(function(){
	  $('.photoAndLocation').hover(function(){
	    swing();
	  }, function(){
	        // hover out action
	  });
	});
//리뷰 업로드
function upload(){
	var point = $('input[name=rating]:checked')[0].value;
	var comment = $('#exampleTextarea')[0].value;
	var retitle=$("#loInput")[0].value;
	var utc = new Date().toJSON().slice(0,10).replace(/-/g,'-');
	var data = {
			userNo : "103230395918627060836",
			code : "294439",
			point : point,
			comment : comment,
			date : utc,
			placename : "고궁의 아침",
			retitle : retitle
	}
	
	$.ajax({
		url : "/review/addComment",
		data : data,
		success : function(res){
			console.log(res);
		}
	})
	
	$("#review_list").contents().remove();
	num=0;
	getReview(num);
	//form태그 작동
	//frmPopup.submit();
}

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
	var num=0;
	//여기서부터 시작
	$(document).ready(function(){
		getReview(num);
	});
	
	function nextReview(){
		num*=1;
		num+=8;
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
					temp+='<div class="photoAndLocation" data-toggle="modal" data-target="#reviewModal'+a.recoNo+'" style="transform: rotate('+degRandom+'deg)">';
					if(a.imgNo){
						temp+='<div class="grid-item photoPin"><img src="${rPath}/imgs/pins/pin'+pin+'.png" /></div>';
						temp+='<div class="grid-item reviewPhoto"><img src="'+a.imgPath+'" /></div>';
					}
					temp+='<div class="grid-item reviewPoint">'+a.point+'</div>';
					temp+='<div class="grid-item reviewLocation">'+a.placename+'</div></div>';
					temp+='</div>';
					
					temp2+='<div class="modal fade review" id="reviewModal'+a.recoNo+'" role="dialog"><div class="modal-dialog review">';
					temp2+='<div class="modal-content review"><div class="modal-header review"><button type="button" class="close" data-dismiss="modal">&times;</button>';
					temp2+='<h4 class="modal-title review">'+a.reTitle+'</h4></div>';
					temp2+='<div class="modal-body review"><p class=reviewUserId>'+a.userName+'</p><br>';
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