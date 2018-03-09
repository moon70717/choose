<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
</head>
<style>
h1{
text-align:center;
color:white; 
}
.default_container{
margin: auto;
z-index: 1;
margin-top:10%;
	width: 50%;
    height: 30%; 
    background-color:rgba(191, 191, 191, 0.79);
    border-radius: 15%;
}

.login_container {
    margin: auto;
    z-index: 1;
    overflow: auto; /* Enable scroll if needed */
    padding: 1px;
    
}
.img_container{
width:50%;
 margin: auto;
}
.img_container>img{
width:100%; 
position:relative;
filter:opacity(30%); 
}
.btn_container{

position:relative;
top: 100%;
}
.fa {
  padding: 15px;
  font-size: 30%;
  width: 50%;
  text-align: center;
  text-decoration: none;
  margin: 2px 2px;
}

.fa:hover {
    opacity: 0.8;
}

.fa-facebook {
	background: #3b5998;
	border-color:#172d5e;
	color: white;
}

.fa-twitter {
	background: #00aced;
	border-color:#043d52;
	color: white;
}
.fa-google{
  	background: #c32f10;
	border-color:#6b1301;
  	color: white;
}
.fa-github{
	background: #666666;
	border-color:#333333;
	color: white;
}
.btn_container>div{
	text-align: center;
}
/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {

}
</style>
</head>
<body>
<h1>WELCOME Jeung Hae Jwo</h1>
<div class="default_container">
<div class="login_container">
<h1>Login or Sign Up</h1>
<div class="img_container">
	<img src="../resources/imgs/login/tree.png">
</div>
 	<!-- 버튼 -->
    <div class="btn_container">
    <button class="btn"> 
	<div id="btn_facebook">        
    	<img  src="${root}/resources/imgs/login/facebook.ico" width="30" height="30"/></div>
    	<span> Login with FaceBook</span>
      </button>
      <button class="btn"> 
      <div id="btn_twitter">
                      
    	<img  src="${root}/resources/imgs/login/twitter.ico" width="30" height="30"/></div>
    	<span> Login with Twitter</span>
      </button>
      <button class="btn">
      <div id="btn_google">
                       
    	<img  src="${root}/resources/imgs/login/google.ico" width="30" height="30"/></div>
    	<span>Login with Google</span>
      </button>
      <button class="btn">  
      <div id="btn_github">
                     
    	<img  src="${root}/resources/imgs/login/git.ico" width="30" height="30"/></div>
    	<span>Login with GitHub</span>
      </button>

</div>
</div>
</div>

<script>
$(document).ready(function(){
	$(".default_container").fadeIn("slow");
});   
</script>
</html>
