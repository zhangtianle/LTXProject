<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'search.jsp' starting page</title>

<meta http-equiv="Content-Type"
	content="application/json; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="description" content="This is my page">
<link href="js/lib/ligerUI/skins/Aqua/css/ligerui-all.css"
	rel="stylesheet" type="text/css" />
<script src="js/lib/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>
<script src="js/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath %>js/json2.js"></script>
<style type="text/css">
#table {
	font-size: 13px;
}

#title {
	font-size: 14px;
	height: 40px;
}
</style>
<script type="text/javascript">
	
	var manager, deleteRow, updateRow, lookContent;
	$(function() {

		updateRow = function updateRow() {
			var typeId = request("typeId");
			var row = manager.getSelectedRow();
			var articleId = row.articleId;

			window.location.href = "goUpdateArticle.do?typeId=" + typeId
					+ "&articleId=" + articleId;
		};

		//删除文章
		deleteRow = function deleteRow(rowindex) {

			var row = manager.getSelectedRow();
			if (row) {
				$.ligerDialog.confirm('确定要删除？', function(a) {
				if (a == true) {
					manager.deleteRow(rowindex);
					//后台删除
					$.ajax({
							url : 'deleteArticle.do?articleId='+ row.articleId,
									type : 'get',
									contentType : "text/html"

								});
						getdata();
					}
				});
			}

		};

		//显示文章内容

		lookContent = function lookContent(rowindex) {
			var row = manager.getSelectedRow();
			$.ligerDialog.open({
				content : row.articleContext,
				height : 450,
				isResize : false,
				title : '文章内容',
				width : 600
			});
		};

		//获取超链接的值

		function request(paras) {
			var url = location.href;
			var paraString = url.substring(url.indexOf("?") + 1, url.length)
					.split("&");
			var paraObj = {};
			for (var i = 0; j = paraString[i]; i++) {
				paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j
						.substring(j.indexOf("=") + 1, j.length);
			}
			var returnValue = paraObj[paras.toLowerCase()];
			if (typeof (returnValue) == "undefined") {
				return "";
			} else {
				return returnValue;
			}
		};

		function display(data1) {

			manager = $("#test").ligerGrid(
					{columns : [        
					                    {name : 'articleType',
											display : '文章类型',
											width : '10%'
										},
										{
											name : 'articleTitle',
											display : '文章标题',
											width : '25%'
										},
										{
											name : 'articleAuthor',
											display : '文章作者',
											width : '25%'
										},
										{
											name : 'uploadTime',
											display : '发布时间',
											width : '10%',
											type : 'date'
										},
										{
											display : '操作',
											isSort : false,
											width : '30%',
											render : function(rowdata,
													rowindex, value) {
												return  '<span class="a" style="cursor: pointer;" onclick="lookContent('+rowindex+')">显示内容</span>&nbsp;&nbsp;<span class="a" style="cursor: pointer;" onclick="updateRow()">修改</span>&nbsp;&nbsp;<span class="a" style="cursor: pointer;" onclick="deleteRow('+rowindex+')">删除</span>';
								 
											}
										} ],
								height : 350,
								rownumbers : true,
								pageSize : 10,
								data : data1
							});
		};

		//为搜索按钮绑定Enter按键
		document.onkeydown = function(e) {
			var theEvent = window.event || e;
			var code = theEvent.keyCode || theEvent.which;
			if (code == 13) {
				$("#submit").click();
			}
		}

		$("#submit").click(function getdata() {
			var articleTitle = $("#articleTitle").val();
			var articleAuthor = $("#articleAuthor").val();
			var createTimes = $("#createTimes").val();
			var uploadTime = $("#uploadTime").val();
			var article = {
				articleTitle : articleTitle,
				articleAuthor : articleAuthor,
				createTime : createTimes,
				uploadTime : uploadTime
			};
			$.ajax({
				url : "searchResult.do",
				//传送的方式
				type : "post",
				//返回类型text或者JSON
				data : JSON.stringify(article),
				dataType : "json",
				contentType : "application/json",
				success : function(data) {
					display(data);
				}
			});
		});

	})
</script>

</head>

<body>
	<form>
		<table id="table" align="center" height="120" width="650">
			<tr id="title">
				<td><h4>输入搜索条件：</h4></td>
			</tr>
			<tr>
				<td>文章标题：<input type="text" id="articleTitle" /></td>
				<td>作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;者：<input type="text"
					id="articleAuthor" /><br /></td>
			</tr>
			<tr>
				<td>创建时间：<input type="text" id="createTimes" /><br /></td>
				<td>上传时间：<input type="text" id="uploadTime" /><br /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button id="submit" type="button">搜索</button>
				</td>
			</tr>
		</table>
	</form>
	<div id="test"></div>
</body>
</html>
