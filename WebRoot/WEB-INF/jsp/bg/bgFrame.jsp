<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>重庆邮电大学离退休处后台管理</title>
<link href="js/lib/ligerUI/skins/Aqua/css/ligerui-all.css"
	rel="stylesheet" type="text/css" />
<script src="js/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="js/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
<script src="js/lib/ligerUI/js/plugins/ligerTree.js"
	type="text/javascript"></script>
<script src="./js/lib/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
<script src="js/lib/ligerUI/js/plugins/ligerGrid.js"
	type="text/javascript"></script>
<script src="js/lib/ligerUI/js/plugins/ligerTab.js"
	type="text/javascript"></script>
<script src="js/lib/ligerUI/js/plugins/ligerDrag.js"
	type="text/javascript"></script>

<script src="js/lib/ligerUI/js/plugins/ligerLayout.js"
	type="text/javascript"></script>
<script src="js/lib/ligerUI/js/plugins/ligerMenu.js"
	type="text/javascript"></script>
<script type="text/javascript">
	var tab = null;
	$(function() {
		//整体布局的初始化
		$("#layout").ligerLayout({
			leftWidth : 200,
			heightDiff : -50
		});

		//左树
		$("#tree").ligerTree({
			checkbox : false,
			isExpand : 2,
			onSelect : onSelect,
		});

		//Tab
		$("#framecenter").ligerTab({
			showSwitchInTab : true,
			showSwitch : true,

		});

		tab = $("#framecenter").ligerGetTabManager();

		//控制跳转
		function onSelect(node) {
	    console.log(node);
			//判断是否tab存在，若存在则刷新。
			if (tab.isTabItemExist(node.data.id) == true) {
				tab.reload(node.data.id);
				tab.selectTabItem(node.data.id);
			} else {
				//发布新闻
				if (node.data.text == '发布新闻') {
					addTab('fbxw', node.data.text, 'myform.do');
				}

				//查看新闻
				//查看新闻二级
				if (node.data.text == '政策法规') {
					addTab('dzjs', node.data.text, 'lookArticle.do?typeId=1');
				}
				if (node.data.text == '动态新闻') {
					addTab('dtxw', node.data.text, 'lookArticle.do?typeId=2');
				}
				
				if (node.data.text == '党政工作') {
					addTab('dzgz', node.data.text, 'lookArticle.do?typeId=3');
				}
				if (node.data.text == '关工委') {
					addTab('ggw', node.data.text, 'lookArticle.do?typeId=4');
				}
				if (node.data.text == '文体娱乐') {
					addTab('wtyl', node.data.text, 'lookArticle.do?typeId=5');
				}
				if (node.data.text == '百家讲坛') {
					addTab('bjjt', node.data.text, 'lookArticle.do?typeId=6');
				}
				if (node.data.text == '办事指南') {
					addTab('bszl', node.data.text, 'lookArticle.do?typeId=7');
				}
				if (node.data.text == '下载中心') {
					addTab('xzzx', node.data.text, 'lookAccessory.do');
				}
				//查看新闻三级

				//**********政策法规*************
				if (node.data.text == '国家政策') {
					addTab('gjzc', node.data.text, 'lookArticle.do?typeId=10');
				}

				if (node.data.text == '重庆市政策') {
					addTab('cqszc', node.data.text, 'lookArticle.do?typeId=11');
				}

				if (node.data.text == '学校政策') {
					addTab('xxzc', node.data.text, 'lookArticle.do?typeId=12');
				}
				//**********动态新闻*************
				if (node.data.text == '工作计划') {
					addTab('gzjh', node.data.text, 'lookArticle.do?typeId=13');
				}

				if (node.data.text == '通知公告') {
					addTab('tzgg', node.data.text, 'lookArticle.do?typeId=14');
				}

				if (node.data.text == '专题报告') {
					addTab('ztbg', node.data.text, 'lookArticle.do?typeId=15');
				}

				if (node.data.text == '追忆堂') {
					addTab('zyt', node.data.text, 'lookArticle.do?typeId=16');
				}
				//查找新闻
				if (node.data.text == '查找新闻') {
					addTab('czxw', node.data.text, 'search.do');
				}
				//上传文件
				if (node.data.text == '上传文件') {
					addTab('f_upload', node.data.text, 'uploadFile.do');
				}
				
				//**********党政工作*************
				if (node.data.text == '组织机构'&&node.data.id=='zzjg1') {
					addTab('zzjg', node.data.text, 'lookArticle.do?typeId=17');
				}

				if (node.data.text == '党建动态') {
					addTab('djgz', node.data.text, 'lookArticle.do?typeId=18');
				}

				if (node.data.text == '理论中心组') {
					addTab('llzxz', node.data.text, 'lookArticle.do?typeId=19');
				}
				
				//**********关工委*************
				if (node.data.text == '组织机构'&&node.data.id=='zzjg2') {
					addTab('zzjg', node.data.text, 'lookArticle.do?typeId=20');
				}

				if (node.data.text == '文件汇编') {
					addTab('wjhb', node.data.text, 'lookArticle.do?typeId=21');
				}

				if (node.data.text == '工作动态') {
					addTab('gzdt', node.data.text, 'lookArticle.do?typeId=22');
				}
				
				
				//**********文体娱乐*************
				if (node.data.text == '组织设置') {
					addTab('zzsj', node.data.text, 'lookArticle.do?typeId=23');
				}

				if (node.data.text == '工作动态') {
					addTab('gzdt', node.data.text, 'lookArticle.do?typeId=24');
				}

				if (node.data.text == '老年风采') {
					addTab('lnfc', node.data.text, 'lookArticle.do?typeId=25');
				}
				

			}
		}
	});

	function addTab(tabid, text, url) {
		tab.addTabItem({
			tabid : tabid,
			text : text,
			url : url
		});

	}
</script>
</head>

<body>

	<div position="top">
		<div
			style="height:30px;line-height:25px;color:#E7E7E7;font-size:14px;padding-left:35px;
      		border-top:1px solid #1D438B;background:url('images/top.jpg') repeat-x bottom;">离退休处网站后台管理</div>
	</div>
	<div id="layout">
		<%--左侧--%>
		<div position="left" title="后台管理">
			<div
				style="width:200px; height:100%; margin:10px; float:left; border:1px solid #ccc; overflow:auto;">
				<ul id="tree">
					<li id="htgl"><span>后台管理</span>
						<ul>
							<%--发布新闻节点--%>
							<li id="fbxw"><span>发布新闻</span></li>
							<%--查看新闻节点--%>
							<li id="ckxw"><span>查看新闻</span> <%-- 查看新闻2级节点，对应2级标题 --%>
								<ul>
									<li id="dzjs"><span>政策法规</span> <%-- 查看新闻3级节点，对应3级标题 --%>
										<ul>
											<li id="gjzc"><span>国家政策</span></li>
											<li id="cqszc"><span>重庆市政策</span></li>
											<li id="xxzc"><span>学校政策</span></li>
										</ul></li>
									<li id="dtxw"><span>动态新闻</span>
										<ul>
											<li id="gzjh"><span>工作计划</span></li>
											<li id="tzgg"><span>通知公告</span></li>
											<li id="ztbg"><span>专题报告</span></li>
											<li id="zyt"><span>追忆堂</span></li>
										</ul></li>

									<li id="dzgz"><span>党政工作</span>
										<ul>
											<li id="zzjg1"><span>组织机构</span></li>
											<li id="djdt"><span>党建动态</span></li>
											<li id="llzxz"><span>理论中心组</span></li>

										</ul></li>


									<li id="ggw"><span>关工委</span>
										<ul>
											<li id="zzjg2"><span>组织机构</span></li>
											<li id="wjhb"><span>文件汇编</span></li>
											<li id="gzdt"><span>工作动态</span></li>

										</ul></li>


									<li id="wtyl"><span>文体娱乐</span>
										<ul>
											<li id="zzsz"><span>组织设置</span></li>
											<li id="gzdt"><span>工作动态</span></li>
											<li id="lnfc"><span>老年风采</span></li>

										</ul></li>


									<li id="bjjt"><span>百家讲坛</span></li>

<li id="bszl"><span>办事指南</span></li>

									<li id="xzzx"><span>下载中心</span></li>

									




								</ul></li>
							<li id="czxw"><span>查找新闻</span></li>
							<li id="f_upload"><span>上传文件</span></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<%--中部--%>
		<div id="framecenter" position="center">
			<div tabid="home" title="我的主页"
				style="background-image:url('images/index.gif');
      			background-repeat:no-repeat;background-color:rgb(43,110,154);background-position: 150px 150px;">
				<div></div>
			</div>
		</div>
	</div>
	<div id="footer" align="center">
		<P>
			<br />Copy Right@2014 科睿工作室
		</P>
	</div>
</body>
</html>
