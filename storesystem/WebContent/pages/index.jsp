<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>系统首页</title>
<!-- 下载并引入jquery easyUI -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/jquery-easyui-1.9.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/jquery-easyui-1.9.5/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/jquery-easyui-1.9.5/themes/color.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-easyui-1.9.5/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-easyui-1.9.5/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/context-menu.js"></script>
	
	<style type="text/css">
	
	.top {
    	height:100px;
    	border-bottom:1px #95b8e7 solid;
    	background:url(${pageContext.request.contextPath}/images/top1.jpg) no-repeat;
    	background-size:100% 100%;
    	
	}
	.button-tools {
	    float:right;
	    margin-right:10px;
	    margin-top:0px;
	}
	
	.exit-system {
	    float:right;
	    margin-right:10px;
	    margin-left:10px;
	}
	.curUserInfo{
	font-size:20px;
	font-weight:bold;
	color:red;
	}
	#title{
	   background:url(../images/cor.jpg) no-repeat;
	   background-size:100% 100%; 
	}
	</style>
	
</head>
<body class="easyui-layout">
	<script type="text/javascript">
		if (window.top != window.self) {
			window.top.location = "./index.jsp";
		}
	</script>

	<div id="cc" class="easyui-layout"
		style="width: 100%; heith: 100%; min-height: 600px;"
		data-options="fit:true">


		<div data-options="region:'north',border:false"   style="overflow: hidden; height: 100px;">
	        <div class="top">
	        <h3 style="width: 250px;heith: 50px;font-size:28px;font-weight: bold;margin-left:30px;float:left;">商店管理系统</h3>
	            <div class="button-tools">
	                <div class="exit-system"><a id="exitSystem" target="_top" class="easyui-linkbutton"  href="${pageContext.request.contextPath}/sys/usermessage/logout" data-options="iconCls:'icon-no'">安全退出</a></div>
	                <div class="exit-system"><a id="modifyPassSystem" onclick="updatepass()" class="easyui-linkbutton" data-options="iconCls:'icon-large-clipart'">修改密码</a></div>
	                <div class="exit-system">
	                    <div class="curUserInfo">当前登录用户是：${login_user.name}</div>
	                </div>
	            </div>
	        </div>
	    </div>
		
		<div data-options="iconCls:'icon-bill',region:'west',title:'管理菜单',split:true,selected:true"
			style="width: 200px;overflow: auto; ">
			<div id="aa" class="easyui-accordion"
				data-options="fit:true,border:false">

				<div title="商品管理" data-options="iconCls:'icon-save',selected:true"
					style="overflow: auto; padding: 10px;">

					<a id="btn" href="javascript:void(0);" class="easyui-linkbutton" 
						data-options="plain:true,"
						onclick="open_menu('商品类型','${pageContext.request.contextPath}/pages/goodsType-info.jsp')">商品类型</a><br>

					<a id="btn" href="javascript:void(0);" class="easyui-linkbutton"
						data-options="plain:true"
						onclick="open_menu('供应商管理','${pageContext.request.contextPath}/pages/goodsProvide-info.jsp')">供应商管理</a><br>
						
					<a id="btn" href="javascript:void(0);" class="easyui-linkbutton"
						data-options="plain:true"
						onclick="open_menu('商品品牌','${pageContext.request.contextPath}/pages/goodsBrand-info.jsp')">商品品牌</a><br>
					<a id="btn" href="javascript:void(0);" class="easyui-linkbutton"
						data-options="plain:true"
						onclick="open_menu('商品信息','${pageContext.request.contextPath}/pages/goods-info.jsp')">商品信息</a>
				</div>
				<div title="订单管理" data-options="iconCls:'icon-save1',selected:true"
					style="overflow: auto; padding: 10px;">

					<a id="btn" href="javascript:void(0);" class="easyui-linkbutton" 
						data-options="plain:true,"
						onclick="open_menu('销售订单信息','saleManager.html')">销售订单信息</a><br>

					<a id="btn" href="javascript:void(0);" class="easyui-linkbutton"
						data-options="plain:true"
						onclick="open_menu('进货单','sale_return_Manager.html')">进货单</a>
				</div>
				<div title="客户管理" data-options="iconCls:'icon-save2',selected:true"
					style="overflow: auto; padding: 10px;">

					<a id="btn" href="javascript:void(0);" class="easyui-linkbutton" 
						data-options="plain:true,"
						onclick="open_menu('客户信息','outputRecord.html')">客户信息</a><br>
				</div>
				<div title="财务管理" data-options="iconCls:'icon-save3',selected:true"
					style="overflow: auto; padding: 10px;">

					<a id="btn" href="javascript:void(0);" class="easyui-linkbutton" 
						data-options="plain:true,"
						onclick="open_menu('销售信息','purchasingManager.html')">销售信息</a><br>
				</div>
				

				<div title="系统管理" data-options="iconCls:'icon-reload'"
					style="padding: 10px;">
					<a id="btn" href="javascript:void(0);" class="easyui-linkbutton" 
						data-options="plain:true,"
						onclick="open_menu('账号管理','purchasingManager.html')">账号管理</a><br>
					<a href="javascript:void(0);" class="easyui-linkbutton"
						data-options="plain:true"
						onclick="updatepass()">修改密码</a>
					<br> <a
						href="${pageContext.request.contextPath}/sys/usermessage/logout"
						class="easyui-linkbutton" data-options="plain:true">退出系统</a>
				</div>

			</div>
		</div>

		<div data-options="region:'center',border:false,plain:true">
			<div id="tt" class="easyui-tabs" data-options="fit:true"
				data-options="tools:'#tab-tools'">
				<div id="title" title="首页" style="text-align: center; font-size: 24px;">
					<p>欢迎来到商店后台管理系统</p>
				</div>
			</div>
		</div>

		<div id="tab-tools">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon-reload'" onclick="reload()"></a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon-delete'" onclick="closecur()"></a>
		</div>

		<div id="mm" class="easyui-menu" style="width: 150px;">
			<div data-options="iconCls:'icon-reload'" id="refresh">刷新</div>
			<div class="menu-sep"></div>
			<div data-options="iconCls:'icon-delete0'" id="closecur">关闭当前</div>
			<div data-options="iconCls:'icon-delete0'" id="closeall">全部关闭</div>
			<div data-options="iconCls:'icon-delete0'" id="closeother">除此之外全部关闭</div>
			<div class="menu-sep"></div>
			<div data-options="iconCls:'icon-delete0'" id="closeright">当前页右侧全部关闭</div>
			<div data-options="iconCls:'icon-delete0'" id="closeleft">当前页左侧全部关闭</div>
		</div>


		<div data-options="region:'south',border:false,plain:true"
			style="height: 40px; text-align: center; font-size: 12px;">
			<p>版权所有,&copy;2020-2021</p>
		</div>
	</div>
	
	
	<div id="win" class="easyui-window" title="修改密码" style="width:400px;height:260px;" closed="true" data-options="collapsible:false,minimizable:false,resizable:false,maximizable:false"  buttons="#updatepass_dlg-buttons">
		<form style="padding:10px 20px 10px 40px;">
			<p>旧密码: <input  name="opassword" style="width: 260px;"
					class="easyui-passwordbox " 
					prompt="请输入旧密码" required="true" ></p>
			<p>新密码: <input name="npassword" style="width: 260px;"
					class="easyui-passwordbox " prompt="请输入新密码" required="true" ></p>
			<div id="updatepass_dlg-buttons" style="text-align: center; margin-top:50px;">
				<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
					onclick="saveUsers()">保存</a> <a href="#" class="easyui-linkbutton"
					iconCls="icon-cancel" style="margin-left:50px;"
					onclick="javascript:$('#win').dialog('close')">取消</a>
			</div>
		</form>
	</div>
	
	

	<script type="text/javascript">
		function open_menu(titleName, menuUrl) {
			if ($("#tt").tabs("exists", titleName)) {
				$("#tt").tabs("select", titleName);
			} else {
				$('#tt').tabs('add', {
					title : titleName,
					href : menuUrl,
					closable : true
				});
			}
		}

		$(function() {
			bindContextMenu('#tt');
		});


		function updatepass(){
			$('#win').window('open');
		}
	</script>

</body>
</html>