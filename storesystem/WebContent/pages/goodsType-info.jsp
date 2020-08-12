<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- seo搜索引擎 -->
<!-- 前端三大技术标准：html页面布局控制，css页面美化，javascript动态效果或人机交互 -->
<title>商品类型</title>
<!-- 在页面中引入框架代码，为本地安装 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.9.5/themes/default/easyui.css" >
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.9.5/themes/icon.css" >
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.9.5/themes/color.css" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.9.5/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.9.5/jquery.easyui.min.js"></script>
</head>
<body>
<!-- 在页面中使用框架进行页面设计 -->
<table id="goods_type_dg" class="easyui-datagrid" title="商品类型管理" style="width:100%;height:500px"
            toolbar="#goodsType_tb"
			data-options="pagination:true,singleSelect:true,url:'${pageContext.request.contextPath}/sys/goodsType/list',method:'get'">
		<thead>
			<tr>
				<th data-options="field:'typeNo',width:120,align:'center'">类型编号</th>
				<th data-options="field:'typeName',width:150,align:'center'">类型名称</th>
			</tr>
		</thead>
	</table>
	
	<div id="goodsType_tb">
	<div>
	  <a href="#" class="easyui-linkbutton" onclick="newGoodsType()" data-options="iconCls:'icon-add',plain:true">新增</a>
	  <a href="#" class="easyui-linkbutton" onclick="editGoodsType()" data-options="iconCls:'icon-edit',plain:true">修改</a>
	  <a href="#" class="easyui-linkbutton" onclick="destroyGoodsType()" data-options="iconCls:'icon-remove',plain:true">删除</a>
	</div>
	    <div>
			&nbsp;商品类型名称：
			<input type="text" id="goods_type_typeNameText" size="20" onkeydown="if(event.keyCode == 13) searchGoodsInformation()" />
			<a href="javascript:searchGoodsInformation()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	
	<div id="goods_type_dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
		closed="true" buttons="#goods_type_dlg-buttons">
	<div class="ftitle" style="text-align:center;margin-bottom:20px;">商品类型名称</div>
	<form id="goods_type_fm" method="post">
		<div class="fitem">
			<label>类型名称</label>
			<input name="typeName" class="easyui-validatebox" required="true">
		</div>
	</form>
</div>
<div id="goods_type_dlg-buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveGoodsType()">保存</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#goods_type_dlg').dialog('close')">取消</a>
</div>

<script type="text/javascript">
//点击新增按钮时调用，弹出新增对话框
function newGoodsType(){
	$('#goods_type_dlg').dialog('open').dialog('setTitle','新增商品类型名称');
	$('#goods_type_fm').form('clear');
	url = '${pageContext.request.contextPath}/sys/goodsType/add';
}


function editGoodsType(){
	//goods_type_dg是表格里的内容，为表格id
		var row = $('#goods_type_dg').datagrid('getSelected');
		if (row){
			$('#goods_type_dlg').dialog('open').dialog('setTitle','编辑用户');
			$('#goods_type_fm').form('load',row);
			url = '${pageContext.request.contextPath}/sys/goodsType/edit?typeNo='+row.typeNo;
		}else{
		$.messager.show({
			title:"系统提示",
			msg:"请先选中数据！"
		});
		}
	}


//保存按钮
function saveGoodsType(){
	$('#goods_type_fm').form('submit',{
		url: url,
		onSubmit: function(){
			return $(this).form('validate');//进行表单验证
		},
		success: function(result){//成功返回结果
			var result = eval('('+result+')');
				$('#goods_type_dlg').dialog('close');		// close the dialog
				$('#goods_type_dg').datagrid('reload');	// reload the user data

				$.messager.show({
					title: '系统提示',
					msg:"添加成功"
				});
		}
	});
}

//搜索按钮
function searchGoodsInformation() {
	$("#goods_type_dg").datagrid('load',{
		"typeName":$("#goods_type_typeNameText").val()
	});
}



//删除按钮的动作
function destroyGoodsType(){
	var row = $('#goods_type_dg').datagrid('getSelected');
	if (row){
		$.messager.confirm('Confirm','是否确认删除选中的数据?！',function(r){
			if (r){
				$.post('${pageContext.request.contextPath}/sys/goodsType/delete',{typeNo:row.typeNo},function(result){//ajax传送数据有两种：get,post(上传的数据不会暴露在url中)
					if (result.success){
						$('#goods_type_dg').datagrid('reload');	// reload the user data
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

</script>
	
</body>
</html>