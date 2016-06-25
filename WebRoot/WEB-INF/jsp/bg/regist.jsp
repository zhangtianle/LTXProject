<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ltx.model.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆界面</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
 <script src="./js/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
 <script src="./js/lib/ligerUI/js/ligerui.all.js" type="text/javascript"></script>  

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
//该方法为提交前的验证
function validate () {
	
	var userName = document.getElementById("userName").value;
	var password = document.getElementById("password").value;
	
	if(userName == ""){
		alert("请输入用户名！");
		return false;
	}
	
	if(password == ""){
		alert("请输入密码！");
		return false;
	}
		frm.submit();	   
}
</script>

</head>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="147" background="images/login/top02.gif" align="center" style="font-size:60px;font-family: 微软雅黑 Arial, sans-serif;color:#FFFFFF;">
    后台管理注册页面
</td>
  </tr>
</table>
<table width="562" border="0" align="center" cellpadding="0" cellspacing="0" class="right-table03">
  <tr>
    <td width="221"><table width="95%" border="0" cellpadding="0" cellspacing="0" class="login-text01">      
      <tr>
        <td width="600px">
        <form action="login.do" method="post"  name="frm">
		<input type="hidden" name="login" value="login"/>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td  class="login-text02" style="text-align: left; width: 200px" >
			用户名：
			</td>
			<td>
			<input name="username" type="text" size="30" style="width:150px;" id="userName"/>
			</td>
		  </tr>
		  <tr>
			<td  class="login-text02" style="text-align: left;">密码：</td>
			<td><input name="password" type="password" size="30" style="width:150px;" id="password" /></td>
		  </tr>
		  <tr>
		  <td  class="login-text02" style="text-align: left;">确认密码：</td>
		  <td>
		  <input name="confirm" type="password" size="30" style="width:150px;" id="confirm" />
		  </td>
		  </tr>
		  <tr>
			<td height="35">&nbsp;</td>
			<td>
			  <input name="Submit2" type="button" class="right-button01" value="确认注册" onClick="validate()" />
			  <input name="Submit232" type="reset" class="right-button02" value="重 置" />&nbsp;&nbsp;
			</td>
		  </tr>
		</table>
	</form>
        </td>
        <td><img src="images/login/line01.gif" style="margin-left: 150px" width="5" height="292" /></td>
      </tr>
    </table>
	</td>
    <td>
    <!-- 2 -->
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="login-text01">
          <tr>
            <td align="center"><img src="images/login/ico16.gif" width="107" height="97" /></td>
          </tr>
          <tr>
            <td height="40" align="center">&nbsp; </td>
          </tr>          
        </table>
	
	<!-- 2 -->
	</td>
  </tr>
</table>
</body>
</html>