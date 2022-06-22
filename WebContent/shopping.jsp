<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
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
<input id ="booknum" type="hidden" value=""/>
<input id ="booknum2" name="BookNum" type="hidden" value=""/>
<div id="content" class="wrap">
	<div class="list bookList">
		<form method="post" name="shoping" action="shopping-success.jsp" onsubmit="return false;">
			<table id="shopid1">
				<tr class="title">
					<th class="view">图片预览</th>
					<th>书名</th>
					<th class="nums">数量</th>
					<th class="price">价格</th>
				</tr>
<!-- 				<tr> -->
<!-- 					<td class="thumb"><img src="images/book/book_01.gif" /></td> -->
<!-- 					<td class="title">泰戈尔诗集</td> -->
<!-- 					<td><input class="input-text" type="text" name="nums" value="1" /></td> -->
<!-- 					<td>￥<span>18.00</span></td> -->
<!-- 				</tr> -->
<!-- 				<tr class="odd"> -->
<!-- 					<td class="thumb"><img src="images/book/book_02.gif" /></td> -->
<!-- 					<td class="title">痕记</td> -->
<!-- 					<td><input class="input-text" type="text" name="nums" value="1" /></td> -->
<!-- 					<td>￥<span>22.80</span></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td class="thumb"><img src="images/book/book_03.gif" /></td> -->
<!-- 					<td class="title">天堂之旅</td> -->
<!-- 					<td><input class="input-text" type="text" name="nums" value="1" /></td> -->
<!-- 					<td>￥<span>25.00</span></td> -->
<!-- 				</tr> -->
			</table>
			<div class="button">
				<h4>总价：￥<span id = "allmoney">65.00</span>元</h4>
				<input class="input-chart" type="submit" name="submit" value="" onclick="bcclick()"/>
			</div>
		</form>
	</div>
</div>
<div id="footer" class="wrap">
	软件工程16-1胡西庆 &copy; 版权所有

</div>
<script type="text/javascript">
$(function() {
	$("#shopid1").empty();
	var hh = "<tr class=\"title\"><th class=\"view\">图片预览</th><th>书名</th><th class=\"nums\">数量</th><th class=\"price\">价格</th></tr>";
	$("#shopid1").append($(shopid1));
  $.ajax({
	type : "post",
	url : "shoplist",
	dataType : "json",
	success : function(data) {
		 var cnt = 0;
		 var price = 0;
		$(data).each(function() {
			         cnt = cnt +1;
			         if(cnt % 2 == 0){
			        	 var html ="<tr><td class=\"thumb\"><img src=\""+this.url+"\" /></td><td class=\"title\">"+this.bookName
			        	 +"</td><td><input id=\"input"+cnt+"\" class=\"input-text\" type=\"text\" name=\"nums"+this.id+"\" value=\"1\" onchange=\"bbclick(id)\" /></td><td>￥<span id=\"iinput"+cnt+"\" >"+this.price+"</span></td></tr>" ;
			        
			         }else{
			        	 var html = "<tr class=\"odd\"><td class=\"thumb\"><img src=\""+this.url+"\" /></td><td class=\"title\">"+this.bookName
			        	 +"</td><td><input  id=\"input"+cnt+"\" class=\"input-text\" type=\"text\" name=\"nums"+this.id+"\" value=\"1\" onchange=\"bbclick(id)\" /></td><td>￥<span id=\"iinput"+cnt+"\" >"+this.price+"</span></td></tr>" ;
			        	 }
			         price = price + this.price;
			         $("#shopid1").append($(html));
				})
				document.getElementById("booknum").value = cnt;
				$("#allmoney").html(price);
	         },
	        error:function(){
	        	alert("提交失败！");
	        }
       })
	})
	
</script>

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
      function bbclick(id1) { 
		var va = $("#"+id1).val();
		var vv = $("#i"+id1).html();
		var add = (va-1)*vv;
		//alert("增加的钱"+add);
		var all = $("#allmoney").html();
		//alert("当前全部钱"+all);
		
		var as = all*1.0+add*1.0;
		$("#allmoney").html(as);
		//alert("以后的钱"+as);
	}
   
</script>
<script type="text/javascript">
      function bcclick() { 
    	  var aa = "";
    	  var cnt = $("#booknum").val();
    	  for(var i = 1; i<=cnt; i++){
    		  var iid = "#input"+i;
    		  var iid1 = $(iid).val();
    		  aa = aa +","+iid1;
    	  }
    	  //alert(aa);
    	  document.getElementById("booknum2").value = aa.substring(1,aa.length);
  		$.ajax({
			type:"post",
			url:"booklistadd",
			data:$("#booknum2").serialize(),
			success:function(){
					window.location.href = "shopping-success.jsp";
			}
		})
	}
   
</script>
</body>
</html>