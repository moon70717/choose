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
	grid-gap: 0.5vw;
    padding: 5vw;
    width: 65vw;
    margin: auto;
}

.rank-container>div {
	background-color: rgba(255, 255, 255, 0);
    text-align: center;
    padding-top: 1vw;
    font-size: 1.5vw;
    border: solid 1px #ffffffc4;
    box-shadow: 20px 38px 34px -26px hsla(0,0%,0%,.2);
    border-radius: 255px 15px 225px 15px/15px 225px 15px 255px;
    color: white;
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
	padding: 10px;
}

.rank-container2>.rankDivs {
	background-color: rgba(255, 255, 255, 0.22);
    text-align: center;
    padding: 1vw 0;
    font-size: 1vw;
    /* border-radius: 0px; */
    box-shadow: 20px 38px 34px -26px hsla(0,0%,0%,.2);
    border-radius: 255px 15px 225px 15px/15px 225px 15px 255px;
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
.rank_recommend_thumbs{
	font-size:2vmin; 
}
/*  */
.rank-container3 {
	display: grid;
  	grid-template-columns: repeat(6, 1fr);
  	grid-template-areas: 
    	"pt pt sn sn te te"
    	"pt pt ad ad ad ad";
  	grid-gap: 10px;
  	padding: 10px;
}

.rank-container3>.rankDivs {
	background-color: rgba(169, 169, 169, 0.8);
    text-align: center;
    padding: 1vw 0;
    font-size: 1vw;
    box-shadow: 20px 38px 34px -26px hsla(0,0%,0%,.2);
    border-radius: 255px 15px 225px 15px/15px 225px 15px 255px;
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
.rankIcon{
margin-right: 1vw;
}
.rank-container>div:hover{
	border-width: 6px;
}
</style>
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
			    $(".rank"+tempCount+"_grid .recommend").html("<span class='glyphicon glyphicon-thumbs-up rank_recommend_thumbs'></span>"+vv.count);
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