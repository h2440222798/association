<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.12.2.min.js"></script>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo">网上书城</div>
	<div id="navbar">
		<div class="userMenu">
			<ul>
				<li><a href="index.jsp">首页</a></li>
				<li class="current"><a href="orderlist.jsp">我的订单</a></li>
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
<div id="content" class="wrap">
	<div class="list orderList">

			<table id="listid">
<!-- 				<tr class="title"> -->
<!-- 					<th class="orderId">订单编号</th> -->
<!-- 					<th>订单商品</th> -->
<!-- 					<th class="userName">收货人</th> -->
<!-- 					<th class="price">订单金额</th> -->
<!-- 					<th class="createTime">下单时间</th> -->
<!-- 					<th class="status">订单状态</th> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>10010</td> -->
<!-- 					<td class="thumb"><img src="images/book/book_01.gif" /></td> -->
<!-- 					<td>王五</td> -->
<!-- 					<td>￥18.00 x 1</td> -->
<!-- 					<td>2012-12-21 12:00:00</td> -->
<!-- 					<td>未完成</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>10010</td> -->
<!-- 					<td class="thumb"><img src="images/book/book_02.gif" /></td> -->
<!-- 					<td>马六</td> -->
<!-- 					<td>￥18.00 x 2</td> -->
<!-- 					<td>2012-12-21 12:00:00</td> -->
<!-- 					<td>未完成</td> -->
<!-- 				</tr> -->

<!-- 				<tr> -->
<!-- 					<td colspan="6" align="right"> -->
<!-- 						总计金额：￥54.00元 -->
<!-- 						<button>确认收货</button> -->
<!-- 					</td> -->

<!-- 				</tr> -->
			</table>
			<!-- <div class="button"><input class="input-gray" type="submit" name="submit" value="查看一个月前的订单" /><input class="input-gray" type="submit" name="submit" value="查看一个月前的订单" /></div> -->
	</div>
	<div value="1 0"></div>
    <div id="page" class="page_div"></div>
</div>
<div id="footer" class="wrap">
	软件工程16-1胡西庆  &copy; 版权所有
</div>
<script type="text/javascript" src="js/paging.js"></script>
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
<script type="text/javascript">
		ajaxTest(1);
		function ajaxTest(num) {
			//alert("进去了吗？");
			
			$.ajax({
				type: "post",
				url: "orderlist",
				data:{"Num": num},
				dataType: "json",
				success: function(data) {
					//alert("提交成功");
					//console.log(data);
					//分页
					$("#listid").empty();
  					//alert(num);
// 	 				 var cnt = 0;
					var temp="<tr class=\"title\"><th class=\"orderId\">订单编号</th><th>订单商品</th><th class=\"userName\">收货人</th><th class=\"price\">订单金额</th><th class=\"createTime\">下单时间</th><th class=\"status\">订单状态</th></tr>";	
					$("#listid").append($(temp));
					var cnt = 0;
					var allprice = 0.0;
					$(data.lists).each(function() {
	 					        // alert(data.lists.book.url);
	 					        //alert(data.books[cnt].url);
	 					        var html="<tr><td>"+this.id+"</td><td class=\"thumb\"><img  src=\""+data.books[cnt].url+"\" /></td><td>"+this.username+"</td><td>￥"+this.bookprice+" x "+this.booknum+"</td><td>"+this.time+"</td><td>"+this.stat+"</td></tr>";
	 					         $("#listid").append($(html));
	 					         cnt++;
	 					         allprice = allprice + this.bookprice;
	 						})
	 					//alert(allprice);
					var di = "<tr><td colspan=\"6\" align=\"right\">总计金额：￥"+allprice+"元<button>确认收货</button></td></tr>";
					 $("#listid").append($(di));
					 
					
// 	 					$(data.books).each(function() {
// 	 						//var cc = document.getElementByClassName("tupian").src;
// 	 						//document.getElementById(this.bookname).src=this.url;
	 						
// 							alert(this.url);
// 						})
// 	 					var hh= "<div class=\"button\"><input class=\"input-btn\" type=\"submit\" name=\"submit\" value=\"\" /></div>";
// 	 					$("#tableid").append($(hh));
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
</body>
</html>