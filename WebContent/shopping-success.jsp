<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
<div id="header" class="wrap">
	<div id="logo">网上书城</div>
	<div id="navbar">
		<div class="userMenu">
			<ul>
				<li><a href="index.jsp">首页</a></li>
				<li><a href="orderlist.jsp">我的订单</a></li>
				<li class="current"><a href="shopping.jsp">购物车</a></li>
			    <li><a href="#" onclick="btnclick()" id ="loginoutid">注销</a></li>
				<li>${sessionScope.name}</li>
			</ul>
		</div>
		<form method="get" name="search" action="">
			搜索：<input class="input-text" type="text" name="keywords" /><input class="input-btn" type="submit" name="submit" value="" />
		</form>
	</div>
</div>
<div id="content" class="wrap">
	<div class="success">
		<div class="information">
			<p>恭喜：购买成功！</p>
			<p><a href="orderlist.jsp">点此查看订单详情&gt;&gt;</a></p>
		</div>
	</div>
</div>
<div id="footer" class="wrap">
	XXXXXXXXX &copy; 版权所有

</div>
<script type="text/javascript">
      function btnclick() {
		alert("注销");
		$.ajax({
			type:"post",
			url:"loginout",
			success:function(data){
				if(data.code == 1){
					window.location.href = "login.html";
				}else{
					alert(data.msg);
					$("#userTip").html("请输入用户名");
				}
			}
		})
		//window.location.href="login.html";
	}
   
</script>
</body>
</html>