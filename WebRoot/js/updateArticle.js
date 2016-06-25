var form;

var selectValues = [];

KindEditor.ready(function(K) {

	K.create('textarea[name="articleContext"]', {
		allowPreviewEmoticons : true,
		allowImageUpload : true,
		allowFileUpload : true,
		autoHeightMode : true,
		allowFlashUpload : false,
		allowMediaUpload : false,
		// 这是图片和文件上传的处理链接
		uploadJson : "file_upload.do",
		height : "400",
		// 以下是自定义的按钮
		items : [ 'source', '|', 'undo', 'redo', '|', 'template', 'cut',
				'copy', 'paste', 'plainpaste', 'wordpaste', '|', 'justifyleft',
				'justifycenter', 'justifyright', 'justifyfull',
				'insertorderedlist', 'insertunorderedlist', 'indent',
				'outdent', 'subscript', 'superscript', 'quickformat',
				'selectall', '|', 'fullscreen', '/', 'formatblock', 'fontname',
				'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic',
				'underline', 'strikethrough', 'lineheight', 'removeformat',
				'|', 'image', 'insertfile', 'table', 'hr', 'baidumap',
				'pagebreak', '|', 'about' ],
		afterBlur : function() {
			this.sync();
		},
	});

});

// img.width=200px;

// 获取超链接的值

function request(paras) {
	var url = location.href;
	var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
	var paraObj = {};
	for (var i = 0; j = paraString[i]; i++) {
		paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j
				.indexOf("=") + 1, j.length);
	}
	var returnValue = paraObj[paras.toLowerCase()];
	if (typeof (returnValue) == "undefined") {
		return "";
	} else {
		return returnValue;
	}
};

// 返回查看新闻页面
function back() {
	var updateform = liger.get("updateForm");

	var typeId = request("typeId");
	if (typeId) {
		window.location.href = 'lookArticle.do?typeId=' + typeId;
	} else {
		window.location.href = 'search.do';
	}

}

function updateSubmit() {

	if (form.valid()) {

		var updateform = liger.get("updateForm");

		var article = {};
		article.articleId = $('#articleId1').val();
		article.articleTitle = updateform.getData().articleTitle;
		article.articleType = updateform.getData().articleType;
		article.articleContext = updateform.getData().articleContext;
		article.articleAuthor = updateform.getData().articleAuthor;
		article.uploadTime = updateform.getData().uploadTime;
		article.createTime = $('#createTIme1').val();

		// 后台修改
		$.ajax({

			// 请求到某个servlet或者其它
			url : "updateArticle.do",
			// 传送的方式
			type : "post",
			// 传送数据
			dataType : 'json',
			contentType : 'application/json',
			data : JSON.stringify(article),
			success : function(data) {
				$.ligerDialog.alert(data.update, function() {
					// 修改成功返回查看页面
					back();

				});

			}
		});

	}

};

$(function() {

	var i = 0;

	$("#Types option").each(function() {
		selectValues[i] = {};
		selectValues[i].id = $(this).val();
		selectValues[i].text = $(this).text();
		i++;

	});

	form = $("#updateForm").ligerForm({
		inputWidth : 170,
		labelWidth : 100,
		space : 40,
		validate : true,
		fields : [

		{
			display : "文章名",
			name : "articleTitle",
			newline : true,
			type : "text",
			validate : {
				required : true
			},

		}, {
			display : "作者",
			name : "articleAuthor",
			newline : true,
			type : "text",
			validate : {
				required : true
			},

		}, {
			display : "发布时间",
			name : "uploadTime",
			newline : true,
			type : "date",
			validate : {
				required : true
			},

		}, {
			display : "类别",
			name : "articleType",
			newline : true,

			type : "select",
			editor : {
				data : selectValues
			},
			validate : {
				required : true
			}
		}, {
			display : "内容",
			name : "articleContext",
			spaceCss : "content",
			type : "textarea",
			validate : {
				required : true
			},

			newline : true,
			width : 800,

		}

		]
	});

	form.setData({
		articleTitle : $('#articleTitle1').val(),
		articleContext : $('#articleContext1').val(),
		articleAuthor : $('#articleAuthor1').val(),
		articleType : $('#articleType1').val(),
		uploadTime : new Date($('#uploadTime1').val())
	});

});
