<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ltx.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆界面</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
 <script src="../js/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
 <script src="../js/lib/ligerUI/js/ligerui.all.js" type="text/javascript"></script>  


<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.code{
	background-image:url(111.jpg);
	font-family:Arial,宋体;
	font-style:italic;
	color:green;
	border:0;
	padding:2px 3px;
	letter-spacing:3px;
	font-weight:bolder;
}

</style>
<script type="text/javascript">

document.onkeydown=keyListener;

function keyListener(e){
    e = e ? e : event;// 兼容FF
    if(e.keyCode == 13){
    	validate();
    }
}

//该方法为提交前的验证


function validate () {
	
	var userName = document.getElementById("userName").value;
	var passWord = document.getElementById("password").value;
	
	if(userName == null || userName.length==0){
		alert("请输入用户名！");
		return false;
	}
	
	if(passWord == null || passWord.length==0){
		alert("请输入密码！");
		return false;
	}
	
	frm.submit();	   
}

</script>

</head>
<body  onkeydown="BindEnter(event)">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="147" background="images/login/top02.gif" align="center" style="font-size:60px;font-family: 微软雅黑 Arial, sans-serif;color:#7ABFCE;">
    		后&nbsp;台&nbsp;管&nbsp;理&nbsp;系&nbsp;统
</td>
  </tr>
</table>
<table width="562" border="0" align="center" cellpadding="0" cellspacing="0" class="right-table03">
  <tr>
    <td width="221"><table width="95%" border="0" cellpadding="0" cellspacing="0" class="login-text01">      
      <tr>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="login-text01">
          <tr>
            <td align="center"><img src="images/login/ico13.gif" width="107" height="97" /></td>
          </tr>
          <tr>
            <td height="40" align="center">&nbsp; </td>
          </tr>          
        </table></td>
        <td><img src="images/login/line01.gif" width="5" height="292" /></td>
      </tr>
    </table>
	</td>
    <td>
	<form action="login.do" method="post"  name="frm">
	<input type="hidden" name="login" value="login"/>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		  	<td colspan="2" style="ont-size:15px;font-family: 微软雅黑 Arial, sans-serif;color:red; text-align: center;  ">
		  	<% 
		  		String msg=(String)request.getAttribute("msg");
		  		if(msg!=null){
		  	%>
		  		${msg}
		  	<% 
		  		}
		  	%>
		  	</td>
		  </tr>
		  <tr>
			<td width="31%" height="35" class="login-text02">
				用户名：
			</td>
			<td width="69%">
			<input name="username" type="text" size="30" style="width:180px;" id="userName"/>
			</td>
		  </tr>
		  <tr>
			<td height="35" class="login-text02">密　码：<br /></td>
			<td><input name="password" type="password" size="30" style="width:180px;" id="password" /></td>
		  </tr>
		  <tr>
			<td height="35">
			
			</td>
			<td> 
			  <input name="Submit2" type="button" class="right-button01" value="登录" onClick="validate()" />
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input name="Submit232" type="reset" class="right-button01" value="重 置" />
			</td>
		  </tr>
		</table>
	</form>
	</td>
  </tr>
</table>
</body>
</html>
