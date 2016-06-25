<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<link href="css/main.css" rel="stylesheet" />
<link href="css/sidebar.css" rel="stylesheet" />
<link href="css/third.css" rel="stylesheet" />
<script type="text/javascript" src="js/newsPHO.js"></script>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>

<title>重庆邮电大学离退休工作处</title>

</head>
<body>
	<!--header-->
	<div class="header">
		<div class="logo fl">
			<img src="img/logo.png">
		</div>
		<div id="search_box">
			<form action="../indexSearch.do" class="search_form fr" method="post">
				<input type="text" class="search_text" value="" /> <input
					type="image" src="img/search_btn.gif" class="search_btn" alt="查找"
					title="search" />
			</form>
		</div>
	</div>
	<!--nav-->
	<div id="nav" class="clear">
		<ul class="navbar">
			<li><a href="index.do">首&nbsp;页</a></li>
			<li><a href="four2/bmgk.do">部门概况</a></li>
			<li><a href="slist/1.do">政策法规</a></li>
			<li><a href="slist/2.do">动态新闻</a></li>
			<li><a href="slist/3.do">党建工作</a></li>
			<li><a href="slist/4.do">关工委</a></li>
			<li><a href="slist/5.do">文体娱乐</a></li>
			<li><a href="slist/6.do">百家讲坛</a></li>
			<li><a href="four2/bszl.do">办事指南</a></li>
			<li><a href="slist/8.do">下载中心</a></li>
		</ul>
	</div>
	<!--main-->
	<div id="main" class="comwidth clear">
		<!--sight-->
		<div class="sidebar fl">
			<div class="sub_nav">
				<div class="nav_title">
					<h1>部门概况</h1>
				</div>
				<div class="sub_nav_list">
					<ul>
						
					</ul>
				</div>
			</div>
			
		</div>

		<div class="columns fl">
			<div class="menu_tree fl">
				<ul>
					<li>首页</li>
					<li>>>部门概况</li>
					
				</ul>
			</div>
			<div id="col1" class="column fl">
				<div id="title1" class="column_title">
					<h2>
						
						<li>部门概况</li>
					</h2>
				</div>
				<div class="total">
					<div id="col_content1" class="column_content fl">
				

							

								<p>静态内容</p>
							

				
					
					</div>

					<!--<div id="col_content_date1" class="column_content_date fr">
                    <ul>
                        <li>2014-10-24</li>
                        <li>2014-10-17</li>
                        <li>2014-10-10</li>
                        <li>2014-10-07</li>
                        <li>2014-09-29</li>
                        <li>2014-10-24</li>
                        <li>2014-10-17</li>
                        <li>2014-10-10</li>
                        <li>2014-10-07</li>
                        <li>2014-09-29</li>
                    </ul>
                </div>-->
				</div>
				<div style="clear: both;"></div>
			</div>
		</div>
	</div>
	<!--footer-->
	<div id="footer" class="comwidth">
		<p>版权声明 Copyrights</p>
	</div>
</body>
</html>
