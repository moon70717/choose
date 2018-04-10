<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="${root}/resources/js/mypage.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/mypage.css${ver}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
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
  	<span onclick="searchElement()" class="addBtn">search</span>
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
      <table class="table table-hover">
    <thead>
      <tr>
      	<th>No</th>
        <th>장소</th>
        <th>주소</th>
        <th>방문일자</th>
      </tr>
    </thead>
    <tbody id="visitRecords_table">
      
    </tbody>
  </table>
<!--       <div class='userVisitRecordBtn'>
<button class='btn'>다시 보기</button>
</div> -->

	<div id="userVisitRecordBtn"></div>
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
    
</div>

</div> 
</div>
<script>
//즐겨찾는 주소 검색하는 부분(엔터)
$(function(){
	  $('#myPositionInput').keypress(function(key){
		  if (key.keyCode == 13) {
		  getLatLng($('#myPositionInput')[0].value, $('#myPositionInput')[0].id);
		  }
	  });
	});
//즐겨찾는 주소 검색하는 부분(버튼)	
function searchElement(){
	getLatLng($('#myPositionInput')[0].value, $('#myPositionInput')[0].id);
}	

//입력 주소를 검색하는부분(공통)
function getLatLng(place, id){
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({
		address : place,  
		region : 'ko'
	},function(results, status){
		if(status == google.maps.GeocoderStatus.OK){
			var bounds = new google.maps.LatLngBounds();
			for (var r of results) {
				console.log(r);
				if (r.geometry) {
					var latlng = r.geometry.location;
					var address = r.formatted_address;
					console.log(latlng.lat()+","+latlng.lng());
					$( "#"+id)[0].value = address;
				}
			}
		}
	});
}	
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
		getFav();
		//히스토리 정보 받아오는곳
		getHistory();
	}
);

function getFav(){
	//즐겨찾기 보여주는곳, temp딴걸로 수정해야될듯
	$.ajax({
		url : "/profile/fav",
		data : dtemp,
		success : function(res){
			//userPositionList
			console.log(res);
			for(temp1 of res.result[0]){
				addFav(temp1);
			}
		}
	})
}

function getHistory(res){
	var st;
	if(res){
		st=res*5;
	}else{
		st=0;
	}
	dtemp={
			"userId" : "103230395918627060836",
			"toggle" : "2",
			"st" : st
	}
	ajax("/history/list", initHistory, dtemp);
}

var hisTemp;
var selectPagingBtn = 0;
//히스토리 적용
function initHistory(res){
	console.log(res);
	hisTemp=res.result[0];
	var hisIdx = 1;
	var historyTemps = "";
	$("#visitRecords_table").contents().remove();
	for(vv of hisTemp){
		historyTemps+="<tr><td>"+hisIdx+"</td>";
		historyTemps+="<td>"+vv.placename+"</td>";
		historyTemps+="<td>"+vv.addr+"</td>";
		historyTemps+="<td>"+vv.visitDate+"</td></tr>";
		hisIdx++;
	}
	$("#visitRecords_table").append(historyTemps);
	for(vv=1;vv<Math.ceil(res.result[1]/5);vv++){
		$("#userVisitRecordBtn").append("<button id='historyBtn"+vv+"' class='historypagingBtn' value='"+vv+"'>"+vv+"</button>");
		$("#historyBtn"+vv).click(function(){
			selectPagingBtn = this.value;
			$("#userVisitRecordBtn").contents().remove();
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

// Create a new list item when clicking on the "Add" button
function newElement() {
	var myPage_className="li_userPositionList";
	var num_Lists = $('.'+myPage_className);
	if(num_Lists.length>=3){
		alert("You must delete something! you can 3 positionlist");
	}else{
		var inputValue = document.getElementById("myPositionInput").value;
		if (inputValue.trim() === '') {
			  alert("You must write something!");
		}else{		
			dtemp={
					"userId":"103230395918627060836",
					"address" : inputValue,
					"toggle" : 2
			}
			$.ajax({
				url : "/profile/insertFav",
				data : dtemp,
				success : function(res){			
					console.log(res);		
					//입력 성공하면 보여줌
					if(res.result){
						//있는거 한번 날림
						$(".li_userPositionList").remove();
						getFav();
					}else{
						alert("입력에 실패하였습니다.");
					}
				}
			});
			
		}
	}
}
//즐겨찾기 추가하는부분 분리
function addFav(res){
	var li = document.createElement("li");
	var t = document.createTextNode(res.address);
	li.appendChild(t);
	document.getElementById("userPositionList").appendChild(li);
	document.getElementById("myPositionInput").value = "";
	var span = document.createElement("span");
	var txt = document.createTextNode("\u00D7");
	span.className = "userPositionListclose";
	span.appendChild(txt);
	li.className="li_userPositionList";
	li.appendChild(span);
	//span의 dataset에 favNo를 저장함
	//span보다는 위에놈한태 주는것도 나쁘지 않을듯
	span.dataset.favNo=res.favNo;
	var userPositionListclose = $(".userPositionListclose");
	for (var i = 0; i < userPositionListclose.length; i++) {
		
		//만들어진 즐겨찾기에 삭제기능을 추가하는부분
		userPositionListclose[i].onclick = function() {
	    var div = this.parentElement;
	    
	    //유저정보는 세션에서 받아오도록 할 예정이므로
	    //userId는 테스트후 삭제예정
	    var data={
	    		"userId":"103230395918627060836",
				"favNo" : div.children[0].dataset.favNo
	    }
	    //서버가서 삭제하는부분
	    $.ajax({
	    	url : "/profile/delFav",
	    	data : data,
	    	success : function(res){
	    		
	    		//성공했을때만 삭제하도록
	    		if(res.result){
	    			div.remove();
	    		}else{
	    			alert("삭제에 실패하였습니다");
	    		}
	    	}
	    });
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

/*  */

/*  */
</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFbONelL6n5CyJfPLkocOutqCZqwiFANA&callback=initMap"></script>

</body>
</html>