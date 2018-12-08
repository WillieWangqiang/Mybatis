<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册页面</title>
</head>
<body>
	<div>
		<form action="reg" method="POST">
			<b>用户名：</b><input type="text" name="comp_name"/><br/>
			<b>昵称：</b><input type="text" name="comp_nicke_name"/><br/>
			<b>密码：</b><input type="password" name="comp_passwrod"/><br/>
			<b>邮箱：</b><input type="email" name="comp_email"/><br/>
			<input type="submit" value="注册"/><br/>
		</form>
	</div>
</body>
</html>