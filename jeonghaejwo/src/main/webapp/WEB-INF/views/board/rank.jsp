<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
.rank-container {
	display: grid;
	grid-template-columns: auto auto auto auto auto auto;
	grid-gap: 10px;
	padding: 100px;
	width: 92%;
}

.rank-container>div {
	background-color: rgba(255, 255, 255, 0.8);
	text-align: center;
	padding: 20px 0;
	font-size: 30px;
}

.rank1_grid {
	grid-column: 1/span 2;
}

.rank2_grid {
	grid-column: 3/span 2;
}

.rank3_grid {
	grid-column: 5/span 2;
}

.rank4_grid, .rank6_grid, .rank8_grid {
	grid-column: 1/span 3;
}

.rank5_grid, .rank7_grid, .rank9_grid {
	grid-column: 4/span 3;
}
/*  */
.rank-container2 {
	display: grid;
	grid-template-columns: repeat(7, 1fr);
  	grid-template-areas: 
    	"pt pt pt pt pt pt pt"
    	"pt pt pt pt pt pt pt"
    	"pt pt pt pt pt pt pt"
    	"re re po po sn sn sn"
    	"te te te ad ad ad ad";
	grid-gap: 10px;
	background-color: #065b9e;
	padding: 10px;
}

.rank-container2>div {
	background-color: rgba(255, 255, 255, 0.8);
	text-align: center;
	padding: 20px 0;
	font-size: 30px;
}

.photo_grid {
	grid-area:pt;
}

.recommend_grid {
	grid-area:re;
}

.point_grid {
	grid-area:po;
}

.shopname_grid {
	grid-area:sn;
}

.tel_grid {
	grid-area:te;
}

.address_grid {
	grid-area:ad;
}
/*  */
.rank-container3 {
	display: grid;
  	grid-template-columns: repeat(6, 1fr);
  	grid-template-areas: 
    	"pt pt sn sn te te"
    	"pt pt ad ad ad ad";
  	grid-gap: 10px;
  	background-color: #2196F3;
  	padding: 10px;
}

.rank-container3>div {
	background-color: rgba(255, 255, 255, 0.8);
	text-align: center;
	padding: 20px 0;
	font-size: 30px;
}

.photo_grid3 {
	grid-area:pt;
}

.shopname_grid3 {
	grid-area:sn;
}

.tel_grid3 {
	grid-area:te;
}

.address_grid3 {
	grid-area:ad;
}

.photo_grid>img{
    display: block;
    margin: auto;
    width: 100%;
}
.photo_grid3>img{
display:block;
width:100%;
}
</style>
<body>

	<div class="rank-container">
		<div class="rank1_grid">
			랭킹1
			<div class="rank-container2"> 
				<div class="photo_grid"><img src="${rPath}/imgs/img_sample.jpg" style=/></div>
				<div class="recommend_grid">추천수</div>
				<div class="point_grid">평점</div>
				<div class="shopname_grid">상호명</div>
				<div class="address_grid">주소</div>
				<div class="tel_grid">연락처</div>
			</div>
		</div>
		<div class="rank2_grid">
			랭킹2
			<div class="rank-container2">
				<div class="photo_grid"><img src="${rPath}/imgs/img_sample.jpg" style=/></div>
				<div class="recommend_grid">추천수</div>
				<div class="point_grid">평점</div>
				<div class="shopname_grid">상호명</div>
				<div class="address_grid">주소</div>
				<div class="tel_grid">연락처</div>
			</div>

		</div>
		<div class="rank3_grid">
			랭킹3
			<div class="rank-container2">
				<div class="photo_grid"><img src="${rPath}/imgs/img_sample.jpg" style=/></div>
				<div class="recommend_grid">추천수</div>
				<div class="point_grid">평점</div>
				<div class="shopname_grid">상호명</div>
				<div class="address_grid">주소</div>
				<div class="tel_grid">연락처</div>
			</div>
		</div>
		<div class="rank4_grid">
			랭킹4
			<div class="rank-container3">
				<div class="photo_grid3"><img src="${rPath}/imgs/img_sample.jpg" style=/></div>
				<div class="shopname_grid3">상호명</div>
				<div class="tel_grid3">연락처</div>
				<div class="address_grid3">주소</div>
			</div>
		</div>
		<div class="rank5_grid">랭킹5
		<div class="rank-container3">
				<div class="photo_grid3"><img src="${rPath}/imgs/img_sample.jpg" style=/></div>
				<div class="shopname_grid3">상호명</div>
				<div class="tel_grid3">연락처</div>
				<div class="address_grid3">주소</div>
			</div>
		</div>
		<div class="rank6_grid">랭킹6
		<div class="rank-container3">
				<div class="photo_grid3">사진</div>
				<div class="shopname_grid3">상호명</div>
				<div class="tel_grid3">연락처</div>
				<div class="address_grid3">주소</div>
			</div>
		</div>
		<div class="rank7_grid">랭킹7
		<div class="rank-container3">
				<div class="photo_grid3">사진</div>
				<div class="shopname_grid3">상호명</div>
				<div class="tel_grid3">연락처</div>
				<div class="address_grid3">주소</div>
			</div>
		</div>
		<div class="rank8_grid">랭킹8
		<div class="rank-container3">
				<div class="photo_grid3">사진</div>
				<div class="shopname_grid3">상호명</div>
				<div class="tel_grid3">연락처</div>
				<div class="address_grid3">주소</div>
			</div>
		</div>
		<div class="rank9_grid">랭킹9
		<div class="rank-container3">
				<div class="photo_grid3">사진</div>
				<div class="shopname_grid3">상호명</div>
				<div class="tel_grid3">연락처</div>
				<div class="address_grid3">주소</div>
			</div>
		</div>
	</div>
</body>
</html>