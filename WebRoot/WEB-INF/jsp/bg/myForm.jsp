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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<link href="./js/lib/ligerUI/skins/Aqua/css/ligerui-all.css"
	rel="stylesheet" type="text/css" />
<link href="./js/lib/ligerUI/skins/Tab/css/form.css" rel="stylesheet"
	type="text/css" />
<script src="./js/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="./js/lib/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
<script src="./js/lib/jquery-validation/jquery.validate.min.js"></script>
<script src="./js/lib/jquery-validation/jquery.metadata.js"
	type="text/javascript"></script>
<script src="./js/lib/jquery-validation/messages_cn.js"
	type="text/javascript"></script>
<script charset="utf-8" src="./js/editor/kindeditor.js"></script>
<script charset="utf-8" src="./js/editor/lang/zh_CN.js"></script>

<script type="text/javascript">
	var form;
	//kindeditor编辑器
	KindEditor.ready(function(K) {
		//获取类别信息
		$.ajax({
			//请求到某个servlet或者其它
			url : "getAllType.do",
			//传送的方式
			type : "post",
			//返回类型text或者JSON
			//sasjkdhka
			dataType : "text",
			contentType : "application/json",
			success : function(data) {

				var datas = eval("(" + data + ")");

				//生成表单
				form = $("#form2").ligerForm({
					inputWidth : 170,
					labelWidth : 60,
					space : 40,
					validate : true,
					fields : [ {
						name : "article",
						type : "hidden"
					}, {
						display : "文章名",
						name : "articleName",
						newline : true,
						type : "text",
						validate : {
							required : true
						}
					}, {
						display : "作者",
						name : "author",
						newline : true,
						type : "text",
						validate : {
							required : true
						}
					}, {
						display : "发布时间",
						name : "anounceTime",
						newline : true,
						type : "date",
						validate : {
							required : true
						}
					}, {
						display : "类别",
						name : "type",
						newline : true,
						type : "select",
						editor : {
							data : datas
						},
						validate : {
							required : true
						}
					}, {
						display : "内容",
						name : "content",
						type : "textarea",
						validate : {
							required : true
						},
						newline : true,
						width : 700
					}

					]
				});
				aeditor = K.create('textarea[name="content"]', {
					allowPreviewEmoticons : true,
					allowImageUpload : true,
					allowFileUpload : true,
					autoHeightMode : true,
					allowFlashUpload : false,
					allowMediaUpload : false,
					//这是图片和文件上传的处理链接
					uploadJson : "file_upload.do",
					height : "400",
					//以下是自定义的按钮
					items : [ 'source', '|', 'undo', 'redo', '|', 'template',
							'cut', 'copy', 'paste', 'plainpaste', 'wordpaste',
							'|', 'justifyleft', 'justifycenter',
							'justifyright', 'justifyfull', 'insertorderedlist',
							'insertunorderedlist', 'indent', 'outdent',
							'subscript', 'superscript', 'quickformat',
							'selectall', '|', 'fullscreen', '/', 'formatblock',
							'fontname', 'fontsize', '|', 'forecolor',
							'hilitecolor', 'bold', 'italic', 'underline',
							'strikethrough', 'lineheight', 'removeformat', '|',
							'image', 'insertfile', 'table', 'hr', 'baidumap',
							'pagebreak', '|', 'about' ],
					afterBlur : function() {
						this.sync();
					},
				});

			},
			//错误提示
			error : function() {
				alert("未能获取内容，请联系管理员");
			}
		});

	});
	//上传 
	function f_upload() {
		if (form.valid()) {
			var articleTitle = document.getElementsByName("articleName")[0].value;
			var articleType = document.getElementsByName("type")[0].value;
			var articleContext = document.getElementsByName("content")[0].value;
			var articleAuthor = document.getElementsByName("author")[0].value;
			var time = document.getElementsByName("anounceTime")[0].value;
			var article = {
				articleTitle : articleTitle,
				articleType : articleType,
				articleContext : articleContext,
				articleAuthor : articleAuthor,
				uploadTime : time

			};

			$.ajax({
				//请求到某个servlet或者其它
				url : "postArticle.do",
				//传送的方式
				type : "post",
				//传送数据
				data : JSON.stringify(article),
				dataType : "text",
				contentType : "application/json",
				success : function() {
					alert("上传成功");
					window.location.reload();
				},
				error : function() {
					alert("上传失败");
				}
			});
		} else {
			alert("请输入完整信息~");
		}
	}

	//预览
	function f_preview() {

		if (form.valid()) {
			var articleTitle = document.getElementsByName("articleName")[0].value;
			var articleContext = document.getElementsByName("content")[0].value;
			var articleAuthor = document.getElementsByName("author")[0].value;
			var time = document.getElementsByName("anounceTime")[0].value;
			//打开一个路径，然后显示（重写前端四级页面）
			article_preview = open("", "预览", "");
			var code = "<html><head><title>预览</title>"
					+ "<link href=\"css/main.cs\" rel=\"stylesheet\" />"
					+ "<link href=\"css/sidebar.css\" rel=\"stylesheet\" />"
					+ "<link href=\"css/columns.css\" rel=\"stylesheet\" />"
					+ "</head><body><center>"
					+ "<div class=\"menu_content\"><p class=\"content_title\">"
					+ articleTitle + "</p>" + "<p class=\"content_mini\">编辑："
					+ articleAuthor + "&nbsp;&nbsp;时间：" + time + "</p>"
					+ "<div class=\"content_content\" align=\"left\">"
					+ articleContext + "</div>" + "</div>"
					+ "</center></body></html>";
			article_preview.document.write(code);
			article_preview.document.close();
		} else {
			alert("请先输入完整信心~");
		}
	}
</script>
<!-- 设置按钮的位置 -->
<style type="text/css">
.floatway {
	float: left;
}

#priview {
	margin: 0px 60px 40px 230px;
}
</style>
</head>
<body style="padding:10px;">
	<div id="returnMsg" style="color:red"></div>
	<form id="form2"></form>

	<div id="priview" class="liger-button floatway" data-click="f_preview"
		data-width="150">预览</div>

	<div class="liger-button floatway" data-click="f_upload"
		data-width="150">提交</div>



	</table>
</body>
</html>