



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
	
		
		$.ligerDialog.open({ content:row.articleContext,height: 450, isResize:false,title:'文章内容',width:600});

	
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
	                         
	                	 	return  '<span class="a" style="cursor: pointer;" onclick="lookContent('+rowindex+')">显示内容</span>&nbsp;&nbsp;<span class="a" style="cursor: pointer;" onclick="updateRow()">修改</span>&nbsp;&nbsp;<span class="a" style="cursor: pointer;" onclick="deleteRow('+rowindex+')">删除</span>'; 
	                	 				
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



