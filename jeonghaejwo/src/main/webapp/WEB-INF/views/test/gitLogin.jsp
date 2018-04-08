<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>
      Well, hello there!
    </p>
    <p>
      We're going to now talk to the GitHub API. Ready?
      <a href="https://github.com/login/oauth/authorize?scope=user:email&client_id=e713fb43e596cf78eaaa">Click here</a> to begin!</a>
    </p>
    <p>
      If that link doesn't work, remember to provide your own <a href="/api/test">Client ID</a>!
    </p>
    <a href="https://api.github.com/user?access_token=8fb71e156a2412abdd9a">hi</a>
    <a href="https://developer.github.com/apps/building-oauth-apps/authorization-options-for-oauth-apps/">find with docs</a>
    <a href="https://api.github.com/user?access_token=f2d162923b6e10ca583562a5396eedd8bba344d3">userInfo</a>
    <script>
    //https://github.com/login/oauth/access_token?client_id=e713fb43e596cf78eaaa&client_secret=e958d215f05d422e5d60d9c07ce12e201ebf750e&code=f8ebda18ea771529185c&redirect_uri=https://localhost/api/test
   $.ajax({
    	url : "https://api.github.com/user?access_token=f2d162923b6e10ca583562a5396eedd8bba344d3",  
    	success : function(res){  
    		console.log(res);
    	} 
    });
    </script>
</body>
</html>