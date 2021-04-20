<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>荣耀30</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<link rel="stylesheet" href="http://localhost:8080/ShoppingSystem/document/bootstrap.min.css"/>
		<script src="http://localhost:8080/ShoppingSystem/document/jquery-3.5.1.min.js"></script>
		<script src="http://localhost:8080/ShoppingSystem/document/bootstrap.min.js"></script>
		
		<style>
			body {
				padding-top: 50px;/* 避免文本被导航栏覆盖 */
				background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);/* 设置主题渐变色 */
			}
			
			.container {
				padding-top: 50px;
			}
			
			.picture {
				position:absolute;
				padding-top: 60px;
				padding-left: 160px;
				z-index: -1;
			}
			
			.red {
				color: #ca151d;
			}
			
			.black {
				background-color: #c8c8c8;
			}
			
			.shuliang {
				margin-top: 16px;
			}
			
			.tijiao {
				margin-top: 16px;
			}
		</style>
	</head>
	<body>
		<%
			int login_state = 0;
			String login_name = null; 
			session.setAttribute("phone_number", 3);
			try {
				login_state = (int)session.getAttribute("login_state");
				login_name = (String)session.getAttribute("login_name");
			}
			catch (Exception e){
				// e.printStackTrace();
			}
			finally {
				if (login_state == 0)
					System.out.println("当前为游客登陆");
				else 
					System.out.println("当前为用户" + login_name + "登陆");
			}
		%>
		<!-- 导航栏区域 -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"><!-- <nav class="导航栏 导航栏样式 导航栏位置" 标识这是一个导航容器> -->
			<div class="div">
				<ul class="nav navbar-nav"><!-- 定义无序列表 -->
					<li class="active"><a href="http://localhost:8080/ShoppingSystem/index.jsp">系统首页</a></li>
					<li><a href="#">华为官网</a></li>
					<li><a href="#">荣耀官网</a></li>
					<li><a href="#">花粉俱乐部</a></li>
					<li><a href="#">企业购</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<%
						String str_navbar_right = null;
						if (login_state == 0) {
							str_navbar_right = 
							"<li class=\"dropdown\">" +
								"<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">" +
									"登陆/注册" +
									"<span class=\"caret\"></span>" +
									"&ensp;" +
								"</a>" +
								"<ul class=\"dropdown-menu\">" +
									"<li><a href=\"http://localhost:8080/ShoppingSystem/Login.jsp\">登陆</a></li>" +
									"<li class=\"divider\"></li>" +
									"<li><a href=\"http://localhost:8080/ShoppingSystem/Register.jsp\">注册</a></li>" +
								"</ul>" +
							"</li>";
						}
						else {
							str_navbar_right = 
								"<li><a href=\"#\">" + "当前登录:" + login_name + "</a></li>" +
								"<li><a href=\"http://localhost:8080/ShoppingSystem/Logout.jsp\">注销</a></li>" +
								"<li><a href=\"http://localhost:8080/ShoppingSystem/ShopCar.jsp\">购物车</a></li>" +
								"&ensp;";
						}
					%>
					<%=str_navbar_right %>
				</ul>
			</div>
		</nav>
		<!-- 信息区域 -->
		<img class="picture" src="image/phone3.png">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-5"><h2>荣耀30</h2></div>
			</div>
			<div class="row">
				<div class="col-md-7 col-md-offset-5"><h5>50倍超稳远摄, 超感光高清夜拍, 40W超级快充, 双模5G</h5></div>
			</div>
			
			<br />
			<div class="row">
				<div class="col-md-1 col-md-offset-5 red black"><h5>商品赠券</h5></div>
				<div class="col-md-4 black"><h5>支付后赠花加330元鲜花满减券</h5></div>
			</div>
			<div class="row">
				<div class="col-md-1 col-md-offset-5 red black"><h5>分期免息</h5></div>
				<div class="col-md-4 black"><h5>银联、花呗、掌上生活、工行分期支付可享免息</h5></div>
			</div>
			<div class="row">
				<div class="col-md-1 col-md-offset-5 red black"><h5>赠送积分</h5></div>
				<div class="col-md-4 black"><h5>购买即赠商城积分, 积分可抵现</h5></div>
			</div>
			
			<br />
			<form action="DoPhone" method="post">
				<div class="form-group">
					<div class="col-md-1 col-md-offset-5"><h3>价&ensp;格</h3></div>
					<div class="col-md-4 red"><h3>￥3298.00</h3></div>
				</div>
				<div class="form-group">
					<div class="col-md-1 col-md-offset-5 control-label"><h3>数&ensp;量</h3></div>
					<div class="col-md-1">
						<select class="form-control shuliang" name="number">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-offset-5 col-md-6">
						<br />
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-offset-5 col-md-6">
						<button type="submit" class="btn btn-danger tijiao btn-lg">加入购物车</button>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>