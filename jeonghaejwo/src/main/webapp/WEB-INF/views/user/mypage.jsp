<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.mainContainers{
	display: grid;
	grid-template-columns: repeat(6, 1fr);
  	grid-template-areas: 
    	"mypageUserImg mypageUserImg mypageUserImg mypageUserInfo mypageUserInfo mypageUserInfo"
    	"repoint1 repoint1 repoint2 repoint2 repoint3 repoint3"
    	"repointTable repointTable repointTable repointTable repointTable repointTable";
    margin-top: 6vh;
}
.mainContainers>div{
	border:solid;
	height: 20vh;
	text-align: center;
	padding: 3vw;
	margin: 0.5vh;
}
.mypageUserImg{
	grid-area:mypageUserImg;
	text-align: center;
}
.mypageUserImg_container>img{
	width: 5vw; 
}
.mypageUserInfo{
	grid-area: mypageUserInfo;
}
.repoint1{
	grid-area:repoint1;
}
.repoint2{
	grid-area:repoint2;
}
.repoint3{
	grid-area:repoint3;
}
.repointTable{
	grid-area:repointTable; 
}

</style>
<body>

<div class='mainContainers'>
<div class='mypageUserImg'>
	<div class='mypageUserImg_container'>
		<img src='${rPath}/imgs/user/userimg_sam.png' />
	</div>
</div>
<div class='mypageUserInfo'>
	<div class='mypageUserId'>유저 아이디</div>
	<div class='mypageUserNickName'>유저 별명</div>
	<div class='mypageUserPosition'>즐겨찾는 내위치</div>
</div>
<div class='repoint1'>1</div>
<div class='repoint2'>2</div>
<div class='repoint3'>3</div>
<div class='repointTable'>
갔던 장소 나와랏!! 테이블로
<div class='userRepointBtn'>
<button class='btn'>다시 보기</button>
</div>
</div> 

</div>
</body>
</html>