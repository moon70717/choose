<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${root}/resources/css/rank.css${ver}"/>
<title>Insert title here</title>
</head>

<body>
<div class='mainContainers' style='color:black;'>
	<div class="rank-container">
		<div class="rank1_grid">
			<i class="fas fa-chess-king rankIcon"></i> 랭킹1
			<div class="rank-container2">
				<div class="photo_grid photo"><img src="${rPath}/imgs/img_sample.jpg" /></div>
				<div class="rankDivs recommend_grid recommend">추천수</div>
				<div class="rankDivs point_grid point">평점</div>
				<div class="rankDivs shopname_grid shopname">상호명</div>
				<div class="rankDivs address_grid address">주소</div>
				<div class="rankDivs tel_grid tel">연락처</div>
			</div>
		</div>
		<div class="rank2_grid">  
			<i class="fas fa-chess-queen rankIcon"></i>랭킹2
			<div class="rank-container2">
				<div class="photo_grid photo"><img src="${rPath}/imgs/img_sample.jpg" style=/></div>
				<div class="rankDivs recommend_grid recommend">추천수</div>
				<div class="rankDivs point_grid point">평점</div>
				<div class="rankDivs shopname_grid shopname">상호명</div>
				<div class="rankDivs address_grid address">주소</div>
				<div class="rankDivs tel_grid tel">연락처</div>
			</div>

		</div>
		<div class="rank3_grid">
			<i class="fas fa-chess-rook rankIcon"></i>랭킹3
			<div class="rank-container2">
				<div class="photo_grid photo"><img src="${rPath}/imgs/img_sample.jpg" style=/></div>
				<div class="rankDivs recommend_grid recommend">추천수</div>
				<div class="rankDivs point_grid point">평점</div>
				<div class="rankDivs shopname_grid shopname">상호명</div>
				<div class="rankDivs address_grid address">주소</div>
				<div class="rankDivs tel_grid tel">연락처</div>
			</div>
		</div>
		<div class="rank4_grid">
			랭킹4
			<div class="rank-container3">
				<div class="photo_grid3 photo"><img src="${rPath}/imgs/img_sample.jpg" style=/></div>
				<div class="rankDivs shopname_grid3 shopname">상호명</div>
				<div class="rankDivs tel_grid3 tel">연락처</div>
				<div class="rankDivs address_grid3 address">주소</div>
			</div>
		</div>
		<div class="rank5_grid">
		랭킹5
		<div class="rank-container3">
				<div class="photo_grid3 photo"><img src="${rPath}/imgs/img_sample.jpg" style=/></div>
				<div class="rankDivs shopname_grid3 shopname">상호명</div>
				<div class="rankDivs tel_grid3 tel">연락처</div>
				<div class="rankDivs address_grid3 address">주소</div>
			</div>
		</div>
		<div class="rank6_grid">랭킹6
		<div class="rank-container3">
				<div class="photo_grid3 photo"><img src="${rPath}/imgs/img_sample.jpg" style=/></div>
				<div class="rankDivs shopname_grid3 shopname">상호명</div>
				<div class="rankDivs tel_grid3 tel">연락처</div>
				<div class="rankDivs address_grid3 address">주소</div>
			</div>
		</div>
		<div class="rank7_grid">랭킹7
		<div class="rank-container3">
				<div class="photo_grid3 photo"><img src="${rPath}/imgs/img_sample.jpg" style=/></div>
				<div class="rankDivs shopname_grid3 shopname">상호명</div>
				<div class="rankDivs tel_grid3 tel">연락처</div>
				<div class="rankDivs address_grid3 address">주소</div>
			</div>
		</div>
		<div class="rank8_grid">랭킹8
		<div class="rank-container3">
				<div class="photo_grid3 photo"><img src="${rPath}/imgs/img_sample.jpg" style=/></div>
				<div class="rankDivs shopname_grid3 shopname">상호명</div>
				<div class="rankDivs tel_grid3 tel">연락처</div>
				<div class="rankDivs address_grid3 address">주소</div>
			</div>
		</div>
		<div class="rank9_grid">랭킹9
		<div class="rank-container3">
				<div class="photo_grid3 photo"><img src="${rPath}/imgs/img_sample.jpg" style=/></div>
				<div class="rankDivs shopname_grid3 shopname">상호명</div>
				<div class="rankDivs tel_grid3 tel">연락처</div>
				<div class="rankDivs address_grid3 address">주소</div>
			</div>
		</div>
	</div>
</div>
	<script>
	
	//랭킹을 받아오는 ajax
	$.ajax({
		url : "/rank/list",
		success : function(res){  
			var temp = eval(res["rank"]["result"]);
			var tempCount = 1;
			//받아온 랭킹만큼 돌게 되어있음, 최대10개
			for(vv of temp){
			    console.log(vv);
			    $(".rank"+tempCount+"_grid .shopname").html(vv.placename);
			    $(".rank"+tempCount+"_grid .recommend").html(vv.count+"명이 평가");
			    $(".rank"+tempCount+"_grid .point").html(vv.avg+"점");
			    $(".rank"+tempCount+"_grid .address").html(vv.addr);
			    $(".rank"+tempCount+"_grid .tel").html(vv.tel);
			    $(".rank"+tempCount+"_grid img").attr("src",vv.img);
			    //이미지가 에러가 났을때 대체하는 설정을 입력시킴
			    $(".rank"+tempCount+"_grid img").attr("onError","this.src='/resources/imgs/img_sample.jpg';");
			    tempCount++;
			}
		}
	})
		
	</script>
</body>
</html>