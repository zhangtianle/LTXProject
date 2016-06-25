<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="../css/main.css" rel="stylesheet" />
<link href="../css/sidebar.css" rel="stylesheet" />
<link href="../css/second.css" rel="stylesheet" />
<script type="text/javascript" src="../js/newsPHO.js"></script>
<title>重庆邮电大学离退休工作处</title>
</head>
<body>
	<!--header-->
	<div class="header">
		<div class="logo fl">
			<img src="../img/logo.png">
		</div>
		<div id="search_box">
			 <form action="../indexSearch.do"  class="search_form fr" method="post">
                <input type="text" class="search_text" value="" name="articleTitle"/>
                <input type="image" src="../img/search_btn.gif" class="search_btn" alt="查找" title="search"/>
            </form>
		</div>
	</div>
	<!--nav-->
	<div id="nav" class="clear">
		<ul class="navbar">
			<li><a href="../index.do">首&nbsp;页</a></li>
			<li><a href="../four2/bmgk.do">部门概况</a></li>
			<li><a href="1.do">政策法规</a></li>
			<li><a href="2.do">动态新闻</a></li>
			<li><a href="3.do">党建工作</a></li>
			<li><a href="4.do">关工委</a></li>
			<li><a href="5.do">文体娱乐</a></li>
			<li><a href="6.do">百家讲坛</a></li>
			<li><a href="../four2/bszl.do">办事指南</a></li>
			<li><a href="8.do">下载中心</a></li>
		</ul>
	</div>
	<!--main-->
	<div id="main" class="comwidth clear">
		<!--sidebar-->
		<div class="sidebar fl">
			<div class="sub_nav">
				<div class="nav_title">
					<h1>${theTitle }</h1>
				</div>
				<div class="sub_nav_list">
					<ul>
						<c:if test="${page==null }">
							<c:forEach items="${list }" var="articleType">
								<li><a href="../tlist/${articleType.getArticleType()}.do">${articleType.getTypeName() }</a></li>
							</c:forEach>
						</c:if>
					</ul>
				</div>
			</div>
			<div class="search_box">
				<form action="../indexSearch.do" class="search_bar" method="post">
					<input type="text" hidden="hidden" name="articleType"
						value="${theTitle}"> <input type="text"
						class="search_bar_text" value="" name="articleTitle" /> <input
						type="submit" class="search_bar_btn" value="站内搜索" />
				</form>
			</div>
		</div>
		<!--columns-->
		<div class="columns fl">
			<div class="menu_tree fl">
				<ul>
					<li>当前位置：</li>
					<li>首页</li>
					<li>>>${theTitle }</li>
				</ul>
			</div>
			<!-- 读取内容 -->
			<c:if test="${page==null }">
				<c:forEach var="oneList" items="${allList }" varStatus="i">
					<div id="" class="column fl">
						<div id="title" class="column_title">
							<h2>
								<c:forEach items="${list }" var="articleType" begin="${i.index}"
									end="${i.index }">
									<a href="../tlist/${articleType.getArticleType()}.do">查看更多+</a>
									<li>${articleType.getTypeName() }</li>
								</c:forEach>

							</h2>
						</div>
						<div id="" class="column_content fl">
							<ul>
								<c:forEach items="${oneList }" var="aList">
									<li><span class="fr ar">${aList.getUploadTime()}</span><a
										href="../four/${aList.getArticleId() }.do">${aList.getArticleTitle() }</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${page!=null }">
				<div id="" class="column fl">
					<div id="title" class="column_title">
						<h2>
							<li>${theTitle }</li>
						</h2>
					</div>
					<div id="" class="column_content fl">
						<ul>
							<c:forEach items="${onelist }" var="aList">
								<li><span class="fr ar">${aList.getUploadTime()}</span><a
									href="../four/${aList.getArticleId() }.do">${aList.getArticleTitle() }</a></li>
							</c:forEach>
						</ul>
						<div id="page">

							<font size="2">共有 ${page.totalCount} 篇文章</font> <font size="2">每页
								${page.pageSize} 篇</font> <font size="2">共
								${page.totalPageCount} 页</font> <font size="2">第
								${page.getPageNum()} 页</font>
							<c:choose>
								<c:when test="${page.pageNum - 1 > 0}">
									<a class="page"
										href="/LTXProject/slist/${sessionScope.typeId}.do?pageNum=${page.pageNum - 1}">[上一页]</a>
								</c:when>

							</c:choose>
							<c:choose>
								<c:when test="${page.pageNum != page.totalPageCount}">
									<a class="page"
										href="/LTXProject/slist/${sessionScope.typeId}.do?pageNum=${page.pageNum + 1}">[下一页]</a>
								</c:when>

							</c:choose>

							直接转到第 <select name="demo" onchange="cha();">
								<c:forEach var="s" begin="1" end="${page.totalPageCount}">

									<c:choose>
										<c:when test="${page.pageNum==s}">
											<option value="${s}" selected="selected">${s}</option>
										</c:when>
										<c:otherwise>
											<option value="${s}">${s}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select> 页

						</div>

					</div>
				</div>
			</c:if>
		</div>
	</div>
	<!--footer-->
	<div id="footer" class="comwidth">
		<p>版权声明 Copyrights</p>
	</div>
</body>
</html>
