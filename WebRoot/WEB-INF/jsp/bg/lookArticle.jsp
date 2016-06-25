<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="<%=basePath %>js/lib/jquery/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/lib/ligerUI/js/ligerui.min.js"></script>
	
	<script type="text/javascript" src="<%=basePath %>js/json2.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>js/lib/ligerUI/skins/Aqua/css/ligerui-grid.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>js/lib/ligerUI/skins/Aqua/css/ligerui-dialog.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>js/lib/ligerUI/skins/Aqua/css/ligerui-common.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>js/lib/ligerUI/skins/Aqua/css/ligerui-form.css">
	<style type="text/css">
	 #content img{
	 	width: 510px;
	 }
	</style>
	<script type="text/javascript">
		



var manager,deleteRow,updateRow,lookContent;

updateRow= function updateRow(){
	
	var typeId = request("typeId");
	var row = manager.getSelectedRow();
	var articleId = row.articleId;
	
	window.location.href="goUpdateArticle.do?typeId="+typeId+"&articleId="+articleId;
	};
	
//删除文章
deleteRow=function deleteRow(rowindex){
	
	var row = manager.getSelectedRow();
	if(row){
	$.ligerDialog.confirm('确定要删除？', function (a) { 
		
		if(a==true){
			
			manager.deleteRow(rowindex);
			//后台删除
			
			$.ajax({
			    url: 'deleteArticle.do?articleId='+row.articleId,
			    type: 'get',
			    contentType:"text/html"
			   
			  });
		
			getdata();
			
			
		}
		
		
	});
	}
	
};


//显示文章内容

lookContent = function lookContent(rowindex){
	
	var row = manager.getSelectedRow();
	
		

	$.ligerDialog.open({ content:row.articleContext,height: 450, isResize:false,title:'文章内容',width:600,id:"content"});



	
};
	
//获取超链接的值

function request(paras){ 
	var url = location.href;  
	var paraString = url.substring(url.indexOf("?")+1,url.length).split("&");  
	var paraObj = {};
	for (var i=0; j=paraString[i]; i++){  
	paraObj[j.substring(0,j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=")+1,j.length);  
	}  
	var returnValue = paraObj[paras.toLowerCase()];  
	if(typeof(returnValue)=="undefined"){  
	return "";  
	}else{  
	return returnValue; 
	}
	};
	

	
	//初始化文章
	
		
		function getdata(){
		var typeId = request("typeId");
		manager=$("#test").ligerGrid({
	             columns: [
	                 { name: 'articleTypeName', display: '文章类型', width: '10%'},
	                
	                 { name: 'articleTitle', display: '文章标题', width: '25%'},
	                 { name: 'articleAuthor', display: '文章作者', width: '25%'},
	                
	                 { name: 'uploadTime', display: '发布时间', width: '10%' ,type:'date'},
	                 
	                
                 
	                
	                 { display: '操作', isSort: false, width: '30%', render: function (rowdata, rowindex, value)
	                       
	                         {
	                         
	                	 	return  '<a  href="javascript:lookContent('+rowindex+')">显示内容</a>&nbsp;&nbsp;<a  href="javascript:updateRow()">修改</a>&nbsp;&nbsp;<a href="javascript:deleteRow('+rowindex+')">删除</a>'; 
	                	 				
	                     }
	                 }
	             ],
	             
	           
	             enabledEdit: true, clickToEdit: false, isScroll: true,  
	             height: '95%',
	             width:'100%',
	             rownumbers:true,
	             pageSize: 10,
	             
	             url: "getdata/"+typeId+".do"

		}); 
		
		}
		
		$(function(){
			
			getdata();
		});



		
	</script>
	
</head>
<body>


<div id="test"></div>

</body>
</html>