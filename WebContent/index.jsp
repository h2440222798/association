<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
			* {
				padding: 0;
				margin: 0;
			}
			/*
			  * 外面盒子样式---自己定义
			  */
			
			.page_div {
				margin-top: 20px;
				margin-bottom: 20px;
				font-size: 15px;
				font-family: "microsoft yahei";
				color: #666666;
				margin-right: 10px;
				padding-left: 20px;
				box-sizing: border-box;
			}
			/*
			 * 页数按钮样式
			 */
			
			.page_div a {
				min-width: 30px;
				height: 28px;
				border: 1px solid #dce0e0!important;
				text-align: center;
				margin: 0 4px;
				cursor: pointer;
				line-height: 28px;
				color: #666666;
				font-size: 13px;
				display: inline-block;
			}
			
			#firstPage,
			#lastPage {
				width: 50px;
				color: #0073A9;
				border: 1px solid #0073A9!important;
			}
			
			#prePage,
			#nextPage {
				width: 70px;
				color: #0073A9;
				border: 1px solid #0073A9!important;
			}
			
			.page_div .current {
				background-color: #0073A9;
				border-color: #0073A9;
				color: #FFFFFF;
			}
			
			.totalPages {
				margin: 0 10px;
			}
			
			.totalPages span,
			.totalSize span {
				color: #0073A9;
				margin: 0 5px;
			}
		</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>主页面</title>

<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.12.2.min.js"></script>

</head>
<body>
<h1>asdasd</h1><br>

<img alt="" src="images\book\book_01.gif">
<div id="header" class="wrap">
	<div id="logo">网上书城</div>
	<div id="navbar">
		<div class="userMenu">
			<ul>
				<li class="current"><a href="index.jsp">首页</a></li>
				<li><a href="orderlist.jsp">我的订单</a></li>
				<li><a href="shopping.jsp">购物车</a></li>
				<li><a href="#" onclick="btnclick()" id ="loginoutid">注销</a></li>
				<li>${sessionScope.name}</li>
			</ul>
		</div>
		<form method="get" name="search" action="">
			搜索：<input class="input-text" type="text" name="keywords" /><input class="input-btn" type="submit" name="submit" value="" />
		</form>
	</div>
</div>
 <input type="hidden" name="Box" id="box">

<div id="content" class="wrap">
	<div class="list bookList">
		<form method="post" name="shopping" action="" onsubmit="return false;">
			<table id="tableid">
				<tr class="title">
					<th class="checker"></th>
					<th>书名</th>
					<th class="price">价格</th>
					<th class="store">库存</th>
					<th class="view">图片预览</th>
				</tr>
			</table>
		</form>
	</div>
	<div value="1 0"></div>
    <div id="page" class="page_div"></div>
<!-- 	<div class="button"><input class="input-btn" type="submit" name="submit" value="" /></div> -->
</div>
<div id="footer" class="wrap">
		软件工程16-1胡西庆  &copy; 版权所有

</div>

<script type="text/javascript">
      function btnclick() {
		alert("注销");
		window.location.href = "login.html";
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
<script type="text/javascript" src="js/paging.js"></script>
<script type="text/javascript">
		ajaxTest(1);
		function ajaxTest(num) {
			//alert("进去了吗？");
			
			$.ajax({
				type: "post",
				url: "ListServelet",
				data:{"Num": num},
				dataType: "json",
				success: function(data) {
					//alert("提交成功");
					//console.log(data);
					//分页
					 $("#tableid").empty();
					var hp = "<tr class=\"title\"><th class=\"checker\"></th><th>书名</th><th class=\"price\">价格</th><th class=\"store\">库存</th><th class=\"view\">图片预览</th></tr>"
					$("#tableid").append(hp);
					//alert(num);
	 				 var cnt = 0;
	 				$(data.books).each(function() {
	 					         cnt = cnt +1;
	 					         if(cnt % 2 == 0){
	 					        	 var html = "<tr class=\"odd\"><td><input type=\"checkbox\" name=\"bookId\" value="+this.id+" /></td><td class=\"title\">" + this.bookName +"</td><td>￥"
	 								   + this.price + "</td><td>" + this.num + "</td><td class=\"thumb\"><img src="+ this.url + "/></td></tr>" ;
							        
	 					         }else{
	 					        	 var html = "<tr><td><input type=\"checkbox\" name=\"bookId\" value="+this.id+" /></td><td class=\"title\">" + this.bookName +"</td><td>￥"
	 								   + this.price + "</td><td>" + this.num + "</td><td class=\"thumb\"><img src="+ this.url + "/></td></tr>" ;
							        
	 					        	 }
	 					         //alert(html);
	 					         $("#tableid").append($(html));
								
	 						})
	 					var hh= "<div class=\"button\"><input class=\"input-btn\" type=\"submit\" name=\"submit\" value=\"\" onclick=\"bbclick()\" /></div>";
	 					$("#tableid").append($(hh));
					$("#page").paging({
						pageNo: num,
						totalPage: data.page.totalPage,
						totalSize: data.page.totalSize,
						callback: function(num) {
							ajaxTest(num);
						}
					})
				},
				error:function(){
					alert("提交失败");
				}
			   
			})
		}
	
	</script>

<script type="text/javascript">
      function bbclick() {
		//alert("放入购物车");
		var bb="";
		var temp="";
 		var a = document.getElementsByName("bookId");
 		//alert(a[0].value);
		for(var i =0 ; i < a.length; i++){
			if(a[i].checked){
				temp = a[i].value;
				bb = bb +"," +temp;
			}
		}
		//alert(bb);
		document.getElementById("box").value = bb.substring(1,bb.length);
		
		//window.location.href = "login.html";
		$.ajax({
			type:"post",
			url:"getbook",
			data:$("#box").serialize(),
			dataType:"json",
			success:function(data){
				alert("成功放入购物车！");
				
			}
		})
		//window.location.href="login.html";
	}
   
</script>

</html>