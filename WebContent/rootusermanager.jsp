<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理用户</title>
<!-- <link type="text/css" rel="stylesheet" href="css/style.css" /> -->
<script type="text/javascript" src="js/jquery-1.12.2.min.js"></script>
</head>
<body>
	<table  width = "1000" border = "1" id="roottableid">
		<tr>
			<th>id</th>
			<th>username</th>
			<th>password</th>
			<th>email</th>
			<th>regdate</th>
			<th>islock</th>
			<th>用户改正</th>
			<th>去除锁定</th>
			<th>用户删除</th>
		</tr>
<!-- 		<tr> -->
<!-- 			<th>id</th> -->
<!-- 			<th>username</th> -->
<!-- 			<th>password</th> -->
<!-- 			<th>email</th> -->
<!-- 			<th>regdate</th> -->
<!-- 			<th>islock</th> -->
<!-- 			<th><button id = "chage1" class="userchange" value="4" onclick="btnclick2(this.value)">用户改正</button></th> -->
<!-- 			<th><button id = "lock1" class="lockdelete" value="1"  onclick="btnclick(this.value)">去除锁定</button></th> -->
<!-- 			<th><button id = "delete1" class="userdelete" value="1" onclick="btnclick1(this.value)">用户删除</button></th> -->
<!-- 		</tr> -->
	</table>
	<form id = "rootform" method="post" action="" onsubmit="return false;">
		<dl>
		    <dd><input id="userid" class="input-text" type="hidden" name="userId" /></dd>
			<dt>用 户 名：</dt>
			<dd><input id="user" class="input-text" type="text" name="userName" /></dd>
			<dt>密　　码：</dt>
			<dd><input id="password" class="input-text" type="text" name="passWord"/></dd>
			<dt>Email地址：</dt>
			<dd><input id="emailid" class="input-text" type="text" name="email" /></dd>
			<dt></dt>
			
			<dd class="button"><input class="input-reg" type="submit" name="register" value="修改" /></dd>
		</dl>
	</form>
	
<script type="text/javascript">
$(function() {
$.ajax({
	type : "post",
	url :  "userlist",
	dataType : "json",
	success : function(data) {
		$(data).each(function() {
				var html = "<tr><th>"+this.id+"</th><th>"+this.userName+"</th><th>"+this.password+"</th><th>"+this.email+"</th><th>"+this.regDate+"</th><th>"+this.isLock+"</th><th>"+
				"<button id = \"chage"+this.id+"\" class=\"userchange\" value=\""+this.id+"\" onclick=\"btnclick2(this.value)\">用户改正</button>"+
				"</th><th>"+"<button id = \"lock"+this.id+" \" class=\"lockdelete\" value=\""+this.id+"\"  onclick=\"btnclick(this.value)\">去除锁定</button>"+"</th><th>"+
				"<button id = \"delete"+this.id+"\" class=\"userdelete\" value=\""+this.id+"\" onclick=\"btnclick1(this.value)\">用户删除</button>"+"</th></tr>";
				$("#roottableid").append($(html));
				
		})
	    }
       })
	})
</script>
<script type="text/javascript">
function btnclick(value) {
	alert(value);
	
	$.ajax({
		type:"post",
		url:"lockdelete",
		data:{"userid":value},
		dataType: "json",
		success:function(data){
			if(data.code == 1){
				window.location.reload();
				alert("去除该用户的锁定！");
			}else{
				alert(data.msg);
			}
		}
	})
	//window.location.href="login.html";
}
</script>
<script type="text/javascript">
function btnclick1(value) {
	alert(value);
	
	$.ajax({
		type:"post",
		url:"userdelete",
		data:{"userid":value},
		dataType: "json",
		success:function(data){
			if(data.code == 1){
				alert("该用户已经被删除！");
				window.location.reload();
				
			}else{
				alert(data.msg);
			}
		}
	})
	//window.location.href="login.html";
}
</script>
<script type="text/javascript">
function btnclick2(value) {
	alert(value);
	
	$.ajax({
		type:"post",
		url:"userchange",
		data:{"userid":value},
		dataType: "json",
		success:function(data){
				//alert("该用户已经获取！");
				//alert(data.user.userName);
				
				document.getElementById("userid").setAttribute("value", data.user.id);
				document.getElementById("user").setAttribute("value", data.user.userName);
				document.getElementById("password").setAttribute("value", data.user.password);
				document.getElementById("emailid").setAttribute("value", data.user.email);
				//window.location.href="userform.jsp";
		}
	})
}
</script>
<script type="text/javascript">
        $("#rootform").submit(function(){
			$.ajax({
				type:"post",
				url:"rootchange",
				data:$("#rootform").serialize(),
				dataType:"json",
				success:function(data){
					if(data.code == 1){
						alert("修改成功");
						window.location.reload();
						//window.location.href = "register_success.html";
					}else{
						alert(data.msg);
					}
				}
			})	
		
	});
</script>
</body>

</html>