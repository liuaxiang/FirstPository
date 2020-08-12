<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- seo搜索引擎 -->
<!-- 前端三大技术标准：html页面布局控制，css页面美化，javascript动态效果或人机交互 -->
<title>供应商</title>
<!-- 在页面中引入框架代码，为本地安装 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.9.5/themes/default/easyui.css" >
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.9.5/themes/icon.css" >
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.9.5/themes/color.css" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.9.5/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.9.5/jquery.easyui.min.js"></script>
</head>
<body>
<!-- 在页面中使用框架进行页面设计 -->
<table id="goods_provider_dg" class="easyui-datagrid" title="供应商管理" style="width:100%;height:500px"
            toolbar="#provider_tb"
			data-options="pagination:true,singleSelect:true,url:'${pageContext.request.contextPath}/sys/Provider/list',method:'get'">
		<thead>
			<tr>
				<th data-options="field:'providerNo',width:120,align:'center'">供应商编号</th>
				<th data-options="field:'providerName',width:160,align:'center'">供应商名称</th>
				<th data-options="field:'pContact',width:160,align:'center'">联系人</th>
				<th data-options="field:'providerPhone',width:160,align:'center'">电话号码</th>
				<th data-options="field:'providerEmail',width:250,align:'center'">电子邮箱</th>
				<th data-options="field:'providerAddress',width:300,align:'center'">地址</th>
			</tr>
		</thead>
	</table>
	
	<div id="provider_tb">
	<div>
	  <a href="#" class="easyui-linkbutton" onclick="newProvider()" data-options="iconCls:'icon-add',plain:true">新增</a>
	  <a href="#" class="easyui-linkbutton" onclick="editProvider()" data-options="iconCls:'icon-edit',plain:true">修改</a>
	  <a href="#" class="easyui-linkbutton" onclick="destroyProvider()" data-options="iconCls:'icon-remove',plain:true">删除</a>
	</div>
	    <div>
			&nbsp;供应商名称：
			<input type="text" id="goods_provider_typeNameText" size="20" onkeydown="if(event.keyCode == 13) searchGoodsInformation()" />
			<a href="javascript:searchGoodsInformation()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	
	<div id="goods_provider_dlg" class="easyui-dialog" style="width:500px;height:380px;padding:10px 20px" closed="true" buttons="#goods_provider_dlg-buttons">
		<form id="goods_provider_fm" method="post">
			<table cellspacing="15px">
				<tr>
					<td>供应商名称：</td>
					<td>
						<input type="text" id="providerName" name="providerName" class="easyui-validatebox" required="true" />&nbsp;<font color="red">*</font>
					</td>									
				</tr>
				
				<tr>
					<td>联系人：</td>
					<td>
						<input type="text" id="pContact" name="pContact" class="easyui-validatebox" required="true" />&nbsp;<font color="red">*</font>
					</td>
				</tr>
				
				<tr>
					<td>电话号码：</td>
					<td>
						<input type="text" id="providerPhone" name="providerPhone" class="easyui-validatebox" required="true" />&nbsp;<font color="red">*</font>
					</td>
				</tr>
				
				<tr>								
					<td>电子邮箱：</td>
					<td>
						<input type="text" id="providerEmail" name="providerEmail" class="easyui-validatebox" />
					</td>
				</tr>
				
				<tr>								
					<td>地址：</td>
					<td>
						<input type="text" id="providerAddress" name="providerAddress" class="easyui-validatebox" />
					</td>
				</tr>
			</table>
		</form>
		
	</div>
	


<div id="goods_provider_dlg-buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveProvider()">保存</a>
	<a href="javascript:resetValue()" class="easyui-linkbutton" iconCls="icon-reset">重置</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#goods_provider_dlg').dialog('close')">取消</a>
</div>

<script type="text/javascript">

	//点击新增按钮时调用，弹出新增对话框
	function newProvider(){
		$('#goods_provider_dlg').dialog('open').dialog('setTitle','新增商品类型名称');
		$('#goods_provider_fm').form('clear');
		url = '${pageContext.request.contextPath}/sys/Provider/add';
	}
	
	
	function editProvider(){
		//goods_provider_dg是表格里的内容，为表格id
			var row = $('#goods_provider_dg').datagrid('getSelected');
			if (row){
				$('#goods_provider_dlg').dialog('open').dialog('setTitle','编辑用户');
				$('#goods_provider_fm').form('load',row);
				url = '${pageContext.request.contextPath}/sys/Provider/edit?providerNo='+row.providerNo;
			}else{
			$.messager.show({
				title:"系统提示",
				msg:"请先选中数据！"
			});
			}
		}
	
	
	//保存按钮
	function saveProvider(){
		$('#goods_provider_fm').form('submit',{
			url: url,
			onSubmit: function(){
				return $(this).form('validate');//进行表单验证
			},
			success: function(result){//成功返回结果
				var result = eval('('+result+')');
					$('#goods_provider_dlg').dialog('close');		// close the dialog
					$('#goods_provider_dg').datagrid('reload');	// reload the user data
	
					$.messager.show({
						title: '系统提示',
						msg:"添加成功"
					});
			}
		});
	}
	
	//搜索按钮
	function searchGoodsInformation() {
		$("#goods_provider_dg").datagrid('load',{
			"providerName":$("#goods_provider_typeNameText").val()
		});
	}
	
	
	
	//删除按钮的动作
	function destroyProvider(){
		var row = $('#goods_provider_dg').datagrid('getSelected');
		if (row){
			$.messager.confirm('Confirm','是否确认删除选中的数据?！',function(r){
				if (r){
					$.post('${pageContext.request.contextPath}/sys/Provider/delete',{providerNo:row.providerNo},function(result){//ajax传送数据有两种：get,post(上传的数据不会暴露在url中)
						if (result.success){
							$('#goods_provider_dg').datagrid('reload');	// reload the user data
							$.messager.show({	
								title: '系统提示',
								msg: "删除成功"
							});
						} else {
							$.messager.show({	
								title: '系统提示',
								msg: "删除失败"
							});
						}
					},'json');
				}
			});
		}else{
		$.messager.show({
			title:"系统提示",
			msg:"请先选中数据！"
		});
		}
	}
	
	
	//重置按钮
	function resetValue() {
		$("#providerName").val("");
		$("#pContact").val("");
		$("#providerPhone").val("");
		$("#providerEmail").val("");
		$("#providerAddress").val("");
	}

</script>
	
</body>
</html>