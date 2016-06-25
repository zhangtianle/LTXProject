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
<link href="./css/main.css" rel="stylesheet" />
<link href="./css/index.css" rel="stylesheet" />
<script type="text/javascript" src="./js/newsPHO.js"></script>
<title>重庆邮电大学离退休工作处</title>
</head>
<body>
	<!--header-->
	<div class="header">
		<div class="logo fl">
			<img src="img/logo.png">
		</div>
		<div id="search_box">
			<form action="indexSearch.do" class="search_form fr" method="post">
				<input type="text" class="search_text" value="" name="articleTitle" />
				<input type="image" src="img/search_btn.gif" class="search_btn"
					alt="查找" title="search" />
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
		<div class="sight comwidth"></div>
		<!--newsPHO-->
		<div class="news_pho fl">
			<div id="list" style="left: -284px;">
				<c:forEach items="${images }" var="image" varStatus="i">
					<a href="four/${image.getArticleId() }.do"><img
						src="${image.getImgUrl() }" alt="${i.index+1 }" /></a>
				</c:forEach>
			</div>
			<div id="buttons">
				<span index="1" class="on"></span> <span index="2"></span> <span
					index="3"></span> <span index="4"></span> <span index="5"></span>
			</div>
			<a href="javascript:;" id="prev" class="arrow">&lt;</a> <a
				href="javascript:;" id="next" class="arrow">&gt;</a>
		</div>
		<!--通知公告-->
		<div class="announcement fl">
			<div class="title">
				<h1>
					<a href="tlist/14.do">查看更多+</a>通知公告
				</h1>
			</div>
			<div id="announcement" class="content fl clear">
				<ul>
					<c:forEach items="${tzgg}" var="article">
						<li><span class="fr ar">${article.getUploadTime() }</span><a
							href="four/${article.getArticleId()}.do">${article.getArticleTitle()}</a></li>
					</c:forEach>
				</ul>
			</div>
			<!--<div id="announcement_date" class="date fr clear">
                <ul>
                    <li>10-27</li>
                    <li>10-22</li>
                    <li>10-27</li>
                    <li>10-23</li>
                    <li>10-22</li>
                    <li>10-22</li>
                    <li>10-22</li>
                    <li>10-22</li>
                </ul>
            </div>-->
		</div>
		<!--动态新闻-->
		<div class="news fl">
			<div class="title">
				<h1>
					<a href="slist/2.do">查看更多+</a>动态新闻
				</h1>
			</div>
			<div id="news" class="content fl clear">
				<ul>
					<c:forEach items="${dtxw}" var="article">
						<li><span class="fr ar">${article.getUploadTime() }</span><a
							href="four/${article.getArticleId()}.do">${article.getArticleTitle()}</a></li>
					</c:forEach>
				</ul>
			</div>
			<!--<div id="news_date" class="date fr clear">
                <ul>
                    <li>09-10</li>
                    <li>07-28</li>
                    <li>07-10</li>
                    <li>07-10</li>
                    <li>07-09</li>
                    <li>07-10</li>
                    <li>07-04</li>
                    <li>07-09</li>
                </ul>
            </div>-->
		</div>
		<!--党建工作-->
		<div class="party_building fl">
			<div class="title_1">
				<h1>
					<a href="tlist/18.do">查看更多+</a>党建动态
				</h1>
			</div>
			<div id="party_building" class="content_1 fl clear">
				<ul>
					<c:forEach items="${djdt}" var="article">
						<li><span class="fr ar">${article.getUploadTime() }</span><a
							href="four/${article.getArticleId()}.do">${article.getArticleTitle()}</a></li>
					</c:forEach>
				</ul>
			</div>
			<!--<div id="party_building_date" class="date fr clear">
                <ul>
                    <li>10-27</li>
                    <li>10-26</li>
                    <li>10-19</li>
                    <li>10-17</li>
                    <li>10-26</li>
                    <li>10-14</li>
                    <li>10-10</li>
                    <li>10-17</li>
                </ul>
            </div>-->
		</div>
		<!--关心下一代-->
		<div class="care_generation fl">
			<div class="title">
				<h1>
					<a href="tlist/22.do">查看更多+</a>关心下一代
				</h1>
			</div>
			<div id="care_generation" class="content fl clear">
				<ul>
					<c:forEach items="${gxxyd}" var="article">
						<li><span class="fr ar">${article.getUploadTime() }</span><a
							href="four/${article.getArticleId()}.do">${article.getArticleTitle()}</a></li>
					</c:forEach>
				</ul>
			</div>
			<!--<div id="care_generation_date" class="date fr clear">
                <ul>
                    <li>06-19</li>
                    <li>06-18</li>
                    <li>06-18</li>
                    <li>06-16</li>
                    <li>06-18</li>
                    <li>06-16</li>
                    <li>06-13</li>
                    <li>06-13</li>
                </ul>
            </div>-->
		</div>
		<!--老来乐-->
		<div class="entertainment fl">
			<div class="title">
				<h1>
					<a href="tlist/24.do">查看更多+</a>老来乐
				</h1>
			</div>
			<div id="entertainment" class="content fl clear">
				<ul>
					<c:forEach items="${lll}" var="article">
						<li><span class="fr ar">${article.getUploadTime() }</span><a
							href="four/${article.getArticleId()}.do">${article.getArticleTitle()}</a></li>
					</c:forEach>
				</ul>
			</div>
			<!--<div id="entertainment_date" class="date fr clear">
                <ul>
                    <li>06-18</li>
                    <li>06-17</li>
                    <li>06-13</li>
                    <li>06-12</li>
                    <li>06-09</li>
                    <li>06-17</li>
                    <li>06-13</li>
                    <li>05-24</li>
                </ul>
            </div>-->
		</div>
		<!---->
		<div class="health fl">
			<div class="title_1">
				<h1>
					<a href="slist/6.do">查看更多+</a>百家讲坛
				</h1>
			</div>
			<div id="x" class="content_1 fl clear">
				<ul>
					<c:forEach items="${bjjt}" var="article">
						<li><span class="fr ar">${article.getUploadTime() }</span><a
							href="four/${article.getArticleId()}.do">${article.getArticleTitle()}</a></li>
							
					</c:forEach>
				</ul>
			</div>
			<!--<div id="x_date" class="date fr clear">
                <ul>
                    <li>01-15</li>
                    <li>01-13</li>
                    <li>01-02</li>
                    <li>12-13</li>
                    <li>10-08</li>
                    <li>01-13</li>
                    <li>01-02</li>
                    <li>09-22</li>
                </ul>
            </div>-->
		</div>

		<!--友情链接-->
		<div class="link fl">
			<div class="title_2">
				<h1>
					<a href="#">查看更多+</a>友情链接
				</h1>
			</div>
			<p>
				<a href="http://www.cqupt.edu.cn/">重庆邮电大学主页</a> <a
					href="http://oa.cqupt.edu.cn/">数字校园门户</a> <a
					href="http://www.cqupt.edu.cn/rsc/">人事处</a> <br /> <a
					href="http://ltx.bupt.edu.cn/">北邮离退休工作处</a> <a
					href="http://ltxzgc.njupt.edu.cn/">南邮离退休工作处</a> <br /> <a href="#">离退休人员管理系统</a>
				<a href="#">定点联系空巢老人</a>
			</p>
		</div>
		<!--管理系统入口-->
		<div class="enter fl">
			<a href="bglogin.do"> <img src="img/msBtn.png" />
			</a>
		</div>
	</div>
	<!--footer-->
	<div id="footer" class="comwidth">
		<p>版权声明 Copyrights</p>
	</div>
</body>
</html>
