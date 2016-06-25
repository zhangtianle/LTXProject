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
	<script type="text/javascript">
		



var manager,deleteRow;


//删除文件
deleteRow=function deleteRow(rowindex){
	
	var row = manager.getSelectedRow();
	if(row){
	$.ligerDialog.confirm('确定要删除？', function (a) { 
		
		if(a==true){
			
			manager.deleteRow(rowindex);
			//后台删除
			
			$.ajax({
			    url: 'deleteAccessory.do?id='+row.id,
			    type: 'get',
			    contentType:"text/html"
			   
			  });
		
			getdata();
			
			
		}
		
		
	});
	}
	
};




	
	//初始化文件
	
		
		function getdata(){
		
		manager=$("#test").ligerGrid({
	             columns: [
	                 { name: 'fileName', display: '文件', w名称idth: '30%'},
	                
	                 { name: 'accName', display: '文件路径', width: '50%'},
	               
	                
	                 { name: 'upLoadTime', display: '上传时间', width: '10%' ,type:'date'},
	                 
	                
                 
	                
	                 { display: '操作', isSort: false, width: '10%', render: function (rowdata, rowindex, value)
	                       
	                         {
	                         
	                	 	return  '<span class="a" style="cursor: pointer;" onclick="deleteRow('+rowindex+')">删除</span>'; 
	                	 				
	                     }
	                 }
	             ],
	             
	           
	             enabledEdit: true, clickToEdit: false, isScroll: true,  
	             height: '95%',
	             width:'100%',
	             rownumbers:true,
	             pageSize: 10,
	             
	             url: "getAccessory.do"

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