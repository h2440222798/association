<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理员登录</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.12.2.min.js"></script>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo">网上书城</div>
	<div id="navbar">
		<form method="get" name="search" action="">
			搜索：<input class="input-text" type="text" name="keywords" /><input class="input-btn" type="submit" name="submit" value="" />
		</form>
	</div>
</div>
<div id="login">
	<h2>管理员登陆</h2>
	<form id = "rootloginform" method="post" action="" onsubmit="return false;">
		<dl>
			<dt>管理员名：</dt>
			<dd><input id = "rootId" class="input-text" type="text" name="rootName" /><span id="rootTip">请输入管理员名</span></dd>
			<dt>密　    码：</dt>
			<dd><input class="input-text" type="password" name="passWord" /><span>请输入密码！</span></dd>
			<dt></dt>
			<dd class="button"><input class="input-btn" type="submit" name="submit" value="" /></dd>
		</dl>
	</form>
</div>
<div id="footer" class="wrap">
	XXXXXXXXX &copy; 版权所有

</div>
<script type="text/javascript">
    //jquery.
	$("#rootloginform").submit(function(){
		
		var name = $("#rootId").val();
		//alert(name);
		if(name == null || name.length==0){
			//alert(name);
			$("#rootTip").html("必须输入管理员名");
			return;
		}
		
		
		$.ajax({
			type:"post",
			url:"rootlogin",
			data:$("#rootloginform").serialize(),
			dataType:"json",
			success:function(data){
				if(data.code == 1){
					window.location.href = "rootindex.jsp";
				}else{
					alert(data.msg);
					$("#rootTip").html("请输入用户名");
				}
			}
		})
	})
</script>
</html>