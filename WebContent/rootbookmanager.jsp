<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理图书</title>
<!-- <link type="text/css" rel="stylesheet" href="css/style.css" /> -->
<script type="text/javascript" src="js/jquery-1.12.2.min.js"></script>
<style type="text/css">
	#divid{
		width: 300px;
		height: 300px;
		background: white;
		align-content: right;
	    border: 2px solid #0000FF;
	    float: left;
	}
	#divid2{
		width: 300px;
		height: 300px;
		background: white;
		align-content: right;
	    border: 2px solid #FF0000;
	    float: left;
	}
		#divid3{
		width: 300px;
		height: 300px;
		background: white;
		align-content: right;
	    border: 2px solid #00FF00;
	    float: left;
	}
</style>
</head>
<body>

<table  width = "1000" border = "1" id="booktableid">
		<tr>
			<th>id</th>
			<th>bookname</th>
			<th>price</th>
			<th>url</th>
			<th>num</th>
			<th>图书改正</th>
			<th>图书删除</th>
		</tr>
		<tr>
			<th>id</th>
			<th>bookname</th>
			<th>price</th>
			<th>url</th>
			<th>num</th>
			<th><button id = "chage1" class="bookchange" value="4" onclick="btnclick2(this.value)">图书改正</button></th>
			<th><button id = "delete1" class="bookdelete" value="2" onclick="btnclick1(this.value)">图书删除</button></th>
		</tr>
</table>
查询结果：
<table  width = "1000" border = "1" id="bookfindid">
		<tr>
			<th>id</th>
			<th>bookname</th>
			<th>price</th>
			<th>url</th>
			<th>num</th>
		</tr>
		<tr>
			<th id="find1"></th>
			<th id="find2"></th>
			<th id="find3"></th>
			<th id="find4"></th>
			<th id="find5"></th>
		</tr>
</table>
	<div id = "divid">
	<div>点击图书改正在此改正！</div>
	<form id = "bookform" method="post" action="" onsubmit="return false;">
		<dl>
		    <dd><input id="bookid" class="input-text" type="hidden" name="bookId" /></dd>
			<dt>图书名   ：</dt>
			<dd><input id="book" class="input-text" type="text" name="bookName" /></dd>
			<dt>图书价格：</dt>
			<dd><input id="bookprice" class="input-text" type="text" name="bookprice"/></dd>
			<dt>图书库存：</dt>
			<dd><input id="booknum" class="input-text" type="text" name="booknum" /></dd>
			<dt></dt>
			
			<dd class="button"><input class="input-reg" type="submit" name="register" value="修改" /></dd>
		</dl>
	</form>
	</div>
	<div id="divid2">
	<div>点击图书添加在此添加！</div>
	<form id = "bookaddform" method="post" action="" onsubmit="return false;">
		<dl>
<!-- 		    <dt>图书号   ：</dt> -->
<!-- 		    <dd><input id="bookid1" class="input-text" type="text" name="bookId" /></dd> -->
			<dt>图书名   ：</dt>
			<dd><input id="book1" class="input-text" type="text" name="bookName" /></dd>
			<dt>图书价格：</dt>
			<dd><input id="bookprice1" class="input-text" type="text" name="bookprice"/></dd>
			<dt>图书图片地址：</dt>
			<dd><input id="bookurl1" class="input-text" type="text" name="bookurl" /></dd>
			<dt>图书库存：</dt>
			<dd><input id="booknum1" class="input-text" type="text" name="booknum"/></dd>
			<dt></dt>
			
			<dd class="button"><input class="input-reg" type="submit" name="register" value="添加" /></dd>
		</dl>
	</form>
	</div>
<div id="divid3">
	<div>点击图书查询在此查询！</div>
	<form id = "bookfindform" method="post" action="" onsubmit="return false;">
		<dl>
<!-- 		    <dt>图书号   ：</dt> -->
<!-- 		    <dd><input id="bookid1" class="input-text" type="text" name="bookId" /></dd> -->
			<dt>图书名   ：</dt>
			<dd><input id="book2" class="input-text" type="text" name="bookName" /></dd>
			<dd class="button"><input class="input-reg" type="submit" name="register" value="查询" /></dd>
		</dl>
	</form>
	</div>
<script type="text/javascript">
$(function() {
$.ajax({
	type : "post",
	url :  "booklist",
	dataType : "json",
	success : function(data) {
		$(data).each(function() {
			   //alert("出书！");
				var html = "<tr><th>"+this.id+"</th><th>"+this.bookName+"</th><th>"+this.price+"</th><th>"+this.url+"</th><th>"+this.num+"</th><th>"+
				"<button id = \"chage"+this.id+"\" class=\"bookchange\" value=\""+this.id+"\" onclick=\"btnclick2(this.value)\">图书改正</button>"+
				"</th><th>"+
				"<button id = \"delete"+this.id+"\" class=\"bookdelete\" value=\""+this.id+"\" onclick=\"btnclick1(this.value)\">图书删除</button>"+"</th></tr>";
				$("#booktableid").append($(html));
				
		})
	    }
       })
	})
</script>

<script type="text/javascript">
function btnclick1(value) {
	alert(value);
	$.ajax({
		type:"post",
		url:"bookdelete",
		data:{"userid":value},
		dataType: "json",
		success:function(data){
			if(data.code == 1){
				alert("该图书已经被删除！");
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
	//alert(value);
	$.ajax({
		type:"post",
		url:"bookchange",
		data:{"userid":value},
		dataType: "json",
		success:function(data){
				//alert("该用户已经获取！");
				//alert(data.user.userName);
				//alert(data.code);
				//alert(data.book.bookName);
				document.getElementById("bookid").setAttribute("value", data.book.id);
				document.getElementById("book").setAttribute("value", data.book.bookName);
				document.getElementById("bookprice").setAttribute("value", data.book.price);
				document.getElementById("booknum").setAttribute("value", data.book.num);
				//window.location.href="userform.jsp";
		}
	})
}
</script>
<script type="text/javascript">
        $("#bookform").submit(function(){
			$.ajax({
				type:"post",
				url:"bookformchange",
				data:$("#bookform").serialize(),
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
<script type="text/javascript">
        $("#bookaddform").submit(function(){
			$.ajax({
				type:"post",
				url:"bookformadd",
				data:$("#bookaddform").serialize(),
				dataType:"json",
				success:function(data){
					if(data.code == 1){
						alert("添加成功");
						window.location.reload();
						//window.location.href = "register_success.html";
					}else{
						alert(data.msg);
					}
				}
			})	
		
	});
</script>
<script type="text/javascript">
        $("#bookfindform").submit(function(){
			$.ajax({
				type:"post",
				url:"bookfindByName",
				data:$("#bookfindform").serialize(),
				dataType:"json",
				success:function(data){
					if(data.code == 1){
						alert("查询成功");
						//alert(data.book.bookName);
						$("#find1").html(data.book.id);
						$("#find2").html(data.book.bookName);
						$("#find3").html(data.book.price);
						$("#find4").html(data.book.url);
						$("#find5").html(data.book.num);
						
						//window.location.reload();
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