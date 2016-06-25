<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./js/lib/ligerUI/skins/Aqua/css/ligerui-all.css"
	rel="stylesheet" type="text/css" />
<link href="./js/lib/ligerUI/skins/Tab/css/form.css" rel="stylesheet"
	type="text/css" />
<script src="./js/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="./js/lib/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>
<script src="./js/lib/jquery-validation/jquery.validate.min.js"></script>
<script src="./js/lib/jquery-validation/jquery.metadata.js"
	type="text/javascript"></script>
<script src="./js/lib/jquery-validation/messages_cn.js"
	type="text/javascript"></script>
<script charset="utf-8" src="./js/editor/kindeditor.js"></script>
<script charset="utf-8" src="./js/editor/lang/zh_CN.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/updateArticle.js"></script>
<style type="text/css">

	#bottom {
		height: 100px;
		width: 350px;
		margin-top: 20px;
		margin-left: 106px;
	}
</style>

</head>


<body style="padding:10px;">
	<input type="hidden" name="articleId1" value="${article.articleId}" id="articleId1"/>
	<input type="hidden" name="articleTitle1" value="${article.articleTitle}" id="articleTitle1"/>
	<input type="hidden" name="articleType1" value="${article.articleType}" id="articleType1"/>
	<input type="hidden" name="articleContext1" value="${article.articleContext}" id="articleContext1"/>
	<input type="hidden" name="articleAuthor1" value="${article.articleAuthor}" id="articleAuthor1"/>
	<input type="hidden" name="uploadTime1" value="${article.uploadTime}" id="uploadTime1"/>
	<input type="hidden" name="createTIme1" value="${article.createTime}" id="createTIme1"/>
	<select name="Types" id="Types" style="display: none;">
	<c:forEach items="${TypeNames}" var="type">
		<option value="${type.articleType}">${type.typeName}</option>
	</c:forEach>
	</select>
	<div id="returnMsg" style="color: red"></div>
	
	<form id="updateForm">
	
	</form>
	<div id="bottom">
	<div class="liger-button" data-click="updateSubmit" data-width="150" style="float: left;">修改</div>
	<div class="liger-button" data-click="back" data-width="150" style="float: right;">上一页面</div>
	</div>
</body>
</html>




