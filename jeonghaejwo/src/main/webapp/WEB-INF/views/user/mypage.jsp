<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="${root}/resources/js/mypage.js" charset="utf-8"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.mainContainers{
	display: grid;
	grid-template-columns: repeat(6, 1fr);
  	grid-template-areas: 
    	". mypageUserImg mypageUserImg mypageUserInfo mypageUserInfo ."
    	". repointTable repointTable repointTable repointTable .";
    margin-top: 6vh;
}
.mainContainers>div{
	text-align: center;
	margin: 0.5vh;
}
.mypageUserImg{
	grid-area:mypageUserImg;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr;
  	grid-template-areas:
  		"mypageUserImg_container mypageUserImg_container mypageUserImg_container mypageUserImg_container" 
  		"mypage_userImg_hr mypage_userImg_hr mypage_userImg_hr mypage_userImg_hr"
    	"mypageUserId mypageUserId mypageUserId2 mypageUserId2"
    	"mypageUserNickName mypageUserNickName mypageUserNickName2 mypageUserNickName2"
    	"memberLeave memberLeave memberLeave memberLeave";
	text-align: center;
}
.mypageUserImg_container{
	grid-area: mypageUserImg_container;
}
.mypage_userImg_hr{
	grid-area: mypage_userImg_hr;
}
.mypageUserId{
	grid-area: mypageUserId;
}
.mypageUserId2{
	grid-area: mypageUserId2;
	    text-align: left;
}
.mypageUserNickName{
	grid-area: mypageUserNickName;
	    margin-top: 2vh;
}
.mypageUserNickName2{
	grid-area: mypageUserNickName2;
	    margin-top: 2vh;
	        text-align: left;
}
.userNicknamechange{
  cursor: pointer;
  margin-left: 2vw;
}
.mypageUserImg .memberLeave{
	grid-area: memberLeave;
    }
.mypageUserImg .memberLeave > button{
    margin-top: 3vh;
    background-color: #ff8282;
    }
.mypageUserImg_container>img{
	width: 5vw; 
}
.mypageUserNickName>.btn{
    margin-left: 1vw;
}
.mypageUserInfo{
	grid-area: mypageUserInfo;
	padding-top: 7.8vh;
}
.repointTable{
	grid-area:repointTable;
    margin-top: 5vh;  
}
.tab_menu{
	color:white;
}
.rejeunghaejwo{
}
#user_VisitRecord_container{
}
#user_plan_container{
}
#menu_etc{
}
/* Style the list items */
#userPositionList li {
  cursor: pointer;
  list-style-type: none;
  transition: 0.2s;
      font-size: 1vw;
}

/* Set all odd list items to a different color (zebra-stripes) */
#userPositionList li:nth-child(odd) {
}

/* Darker background-color on hover */
#userPositionList li:hover {
  background: #ddd;
}

/* Style the "Add" button */
.addBtn {
  padding: 10px;
  cursor: pointer;
  transition: 0.3s;
}

.addBtn:hover {
  color: black; 
}

/* Style the close button */
.userPositionListclose {
    font-size: 1.5vw;
    margin-left: 2vw;
    text-align: center;
    vertical-align: middle;
}

.userPositionListclose:hover {
  background-color: #f44336;
  color: white;
}
</style>
<body>
<hr>
<div class='mainContainers'>
<div class='mypageUserImg'>
	<div class='mypageUserImg_container'>
		<img src='${rPath}/imgs/user/userimg_sam.png' />
	</div>
	<div class=mypage_userImg_hr><hr></div>
	
	<div class='mypageUserId'>유저 아이디 : </div>
	<div class='mypageUserId2'></div>
	<div class='mypageUserNickName'>유저 별명 :</div>
	<div class='mypageUserNickName2'></div>
	
	<div class='memberLeave'><button class='btn btn'>회원탈퇴</button></div>
	
</div>
<div class='mypageUserInfo'>
	<div class='mypageUserPosition'>즐겨찾는 내위치</div><hr>
	<div class='userPositionAdd'>
	<input type="text" id="myPositionInput" placeholder="address..." style='color:black'>
  	<span onclick="newElement()" class="addBtn">Add</span>
	</div>
	<div>
	<ul id="userPositionList"></ul>
	</div>
	
</div> 
<div class='repointTable'>
  <ul class="nav nav-tabs">
    <li class="active"><a class='tab_menu' data-toggle="tab" href="#user_VisitRecord_container" >방문 기록</a></li>
    <li><a class='tab_menu' data-toggle="tab" href="#user_plan_container">내가 할 일</a></li>
    <li><a class='tab_menu'data-toggle="tab" href="#menu_etc">뭐할까?</a></li>
  </ul>
  <br>
  <div class='rejeunghaejwo tab-content'>
<div id="user_VisitRecord_container" class="tab-pane fade in active">
      <h3 >방문 기록</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      <div class='userVisitRecordBtn'>
<button class='btn'>다시 보기</button>
</div>
    </div>
    <div id="user_plan_container" class="tab-pane fade">
    <table class="table table-hover">
    <thead>
      <tr>
        <th>무엇을?</th>
        <th>언제?</th>
        <th>어디서?</th>
      </tr>
    </thead>
    <tbody id="todoList">
      
    </tbody>
  </table>
  <hr>
  <table class="table table-hover">
    <thead>
      <tr>
        <th><div class='userWorkAdd'>
		<input type="text" id="myWorkInput1" class='myWorkInput' placeholder="my work..." style='color:black;text-align: center;'>
		</div></th>
        <th><div class='userWorkAdd'>
        <!--  -->
        <button class="time_set" onclick="mypage_minus()">
        	<span class="glyphicon glyphicon-menu-left"></span>
		</button>	
        <!--  -->
		<input type="text" id="time_count" class='myWorkInput' placeholder="time..." style='color:black;text-align: center;'>
		<button class="time_set" onclick="mypage_plus()">
			<span class="glyphicon glyphicon-menu-right"></span>
		</button>
		</div></th>
        <th><div class='userWorkAdd'>
		<input type="text" id="myWorkInput3" class='myWorkInput' placeholder="where..." style='color:black;text-align: center;'>
	  	<span onclick='newWorkElement()' class="addBtn">Add</span>
		</div></th>
      </tr>
    </thead>
    </table>
      
		<div> 
		<ul id="userPositionList"></ul>
	</div>
    </div>
    <div id="menu_etc" class="tab-pane fade">
      <h3>뭐할까?</h3>
      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
    </div>
</div>

</div> 
</div>
<script>
//유저정보 받아오는 부분
var temp;
var dtemp=[];
$(document).ready(function(){
	
		//유저아이디 임시
		dtemp={
				"userId":"103230395918627060836"
		}
		//프로필
		$.ajax({
			url : "/profile/user",
			data : dtemp,
			success : function(res){
				var user=res.user[0];
				$(".mypageUserId2").append(user.userName);
				temp=user.userName;
				temp+='<i class="fas fa-pencil-alt userNicknamechange" onclick="#" ></i>';
				$(".mypageUserNickName2").append(temp);
				$(".mypageUserImg_container img").attr("src",user.ImageURL);
			}
		});
		
		//할일 보여주는곳
		$.ajax({
			url : "/history/todo",
			data : dtemp,
			success : function(res){
				var todo=res.result[0];
				temp="";
				for(i of todo){
					temp+='<tr><td>'+i.title+'</td>';
			        temp+='<td>'+i.usetime+'</td>';
			        temp+='<td>'+i.location+'</td></tr>';
				}
				$("#todoList").append(temp);
			}
		});
		
		//히스토리 정보 받아오는곳
		getHistory();
	}
);

function getHistory(res){
	var st;
	if(res){
		st=res*2;
	}else{
		st=0;
	}
	dtemp={
			"userId" : "103230395918627060836",
			"toggle" : "2",
			"st" : st
	}
	ajax("/history/list",initHistory,dtemp,initHistory);
}

var hisTemp;
//히스토리 적용
function initHistory(res){
	console.log(res);
	hisTemp=res.result[0];
	$("#user_VisitRecord_container").contents().remove();
	for(vv of hisTemp){
		$("#user_VisitRecord_container").append(vv.placename+"<br>");
	}
	for(vv=1;vv<=Math.ceil(res.result[1]/5);vv++){
		$("#user_VisitRecord_container").append("<button id='historyBtn"+vv+"' value='"+vv+"'>"+vv+"</button>");
		$("#historyBtn"+vv).click(function(){
			$("#user_VisitRecord_container").contents().remove();
			getHistory(this.value);
		});
	}
	
}




//Create a "close" button and append it to each list item

var myPositionlist = $(".li_userPosition");

for (var i = 0; i < myPositionlist.length; i++) {
  var span = document.createElement("span");
  var txt = document.createTextNode("\u00D7");
  span.className = "userPositionListclose";
  span.appendChild(txt);
  myPositionlist[i].appendChild(span);
}


// Click on a close button to hide the current list item
var userPositionListclose = $(".userPositionListclose");
var i;
for (i = 0; i < userPositionListclose.length; i++) {
  close[i].onclick = function() {
    var div = this.parentElement;
    div.style.display = "none";
  }
}

//주소 추가하는거, 지도랑 연동 필요함!! add버튼 또는 앤터키 눌렀을때 지도검색결과 나오기
// Create a new list item when clicking on the "Add" button
function newElement() {
	var myPage_className="li_userPositionList";
	var num_Lists = $('.'+myPage_className);
	if(num_Lists.length>=3){
		alert("You must delete something! you can 3 positionlist");
	}else{
		var li = document.createElement("li");
		var inputValue = document.getElementById("myPositionInput").value;
		var t = document.createTextNode(inputValue);
		li.appendChild(t);
		if (inputValue.trim() === '') {
		  alert("You must write something!");
		} else {
		  document.getElementById("userPositionList").appendChild(li);
		}
		document.getElementById("myPositionInput").value = "";
		var span = document.createElement("span");
		var txt = document.createTextNode("\u00D7");
		span.className = "userPositionListclose";
		span.appendChild(txt);
		li.className="li_userPositionList";
		li.appendChild(span);
		var userPositionListclose = $(".userPositionListclose");
		for (var i = 0; i < userPositionListclose.length; i++) {
			userPositionListclose[i].onclick = function() {
		    var div = this.parentElement;
		    div.remove(div);
		  }
		}
	}
}
//할일 추가하는 것
function newWorkElement() {
	if($('.myWorkInput').length<3){
		alert('값을 다 입력하시오!');
	}else{
		var myPage_whatDo = $('.myWorkInput')[0].value;
		var myPage_howMuchDo = $('.myWorkInput')[1].value;
		var myPage_whereDo = $('.myWorkInput')[2].value;
		console.log(myPage_whatDo+','+myPage_howMuchDo+','+myPage_whereDo);
		var data={
				'userId' : '103230395918627060836',
				'usetime' : myPage_howMuchDo,
				'location' : myPage_whereDo,
				'title': myPage_whatDo
		}
		$.ajax({
			url : "/history/todoIn",
			data : data,
			success : function(res){
				temp=res;
				if(res.result){
					location.reload();
				}else{
					alert("잠시후 시도해주세요");
				}
			}
		});
	}
	
}
</script>
</body>
</html>