<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>My JSP 'MyJsp.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="./js/editor/themes/default/default.css" />
<script charset="utf-8" src="./js/editor/kindeditor-min.js"></script>
<script>
	KindEditor.ready(function(K) {
		var uploadbutton = K.uploadbutton({
			button : K('#uploadButton')[0],
			fieldName : 'imgFile',
			url : 'upLoad.do?dir=file',
			afterUpload : function(data) {
				if (data.error === 0) {
					var url = K.formatUrl(data.origin_name, 'absolute');
					K('#url').val(url);
					alert("上传成功（可在页面方框内查看上传文件名哦~）");
				} else {
					alert(data.message);
				}
			},
		});
		uploadbutton.fileBox.change(function(e) {
			uploadbutton.submit();
		});
	});
</script>
</head>

<body>
	<div class="upload">
		<input class="ke-input-text" type="text" id="url" value=""
			readonly="readonly" /> <input type="button" id="uploadButton"
			value="Upload" />
	</div>
</body>
</html>
