<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<link href="css/main.css" rel="stylesheet" />
<link href="css/sidebar.css" rel="stylesheet" />
<link href="css/columns.css" rel="stylesheet" />
<script type="text/javascript" src="js/newsPHO.js"></script>
<title>重庆邮电大学离退休工作处</title>
</head>
<body>
    <!--header-->
    <div class="header">
        <div class="logo fl">
            <img src="img/logo.png">
        </div>
        <div id="search_box">
            <form action="indexSearch.do"  class="search_form fr" method="post">
                <input type="text" class="search_text" value="" name="articleTitle"/>
                <input type="image" src="img/search_btn.gif" class="search_btn" alt="查找" title="search"/>
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
		<!--sidebar-->
		<div class="sidebar fl">
			<div class="sub_nav">
				<div class="nav_title">
					<h1>${parentName}</h1>
				</div>
				<div class="sub_nav_list">
					<ul>
						<c:forEach items="${typeNames}" var="type">
							<c:choose>
								<c:when test="${type.typeName==name}">
									<li><b>${type.typeName}</b></li>
								</c:when>
								<c:otherwise>
									<li><a href="tlist/${type.articleType}.do">${type.typeName}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="search_box">
					<form action="indexSearch.do" class="search_bar" method="post">
					<input type="text" hidden="hidden" name="articleType"
						value="${parentName}"> <input type="text"
						class="search_bar_text" value="" name="articleTitle" /> <input
						type="submit" class="search_bar_btn" value="站内搜索" />
				</form>
			</div>
		</div>
		<!--columns-->
		<div class="columns fl">
			<div class="menu_tree">
				<ul>
					<li>首页</li>
					<li>>>${parentName}</li>
					<c:if test="${parentName!=name }">
					<li>>>${name}</li>
					</c:if>
				</ul>
			</div>
			<div class="menu_content">
				<p class="content_title">${article.articleTitle}</p>
				<p class="content_mini">编辑：${article.articleAuthor}时间：${article.uploadTime}</p>
				<div class="content_content">${article.articleContext}</div>
			</div>
		</div>
	</div>

	<!--footer-->
	<div id="footer" class="comwidth">
		<p>版权声明 Copyrights</p>
	</div>
</body>
</html>