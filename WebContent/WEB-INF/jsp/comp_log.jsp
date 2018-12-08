<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录页面</title>
<script type="text/javascript" src="/WEB-INF/js/jquery.min.js"></script>
<script>
	$()
</script>
</head>
<body>
	<form action="log" method="POST">
		<b>用户名：</b><input type="text" name="comp_name"/><br/>
		<b>密码：</b><input type="password" name="comp_passwrod"/><br/>
		<b>验证码：</b><input type="text" name="comp_identify_code"/><img src="toIdentify" width="50" height="40"/><a href="">看不清</a><br/>	
		<input type="submit" value="登录"/>	
	</form>
</body>
</html>