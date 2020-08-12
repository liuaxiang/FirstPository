<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>账户管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.9.5/themes/default/easyui.css" >
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.9.5/themes/icon.css" >
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.9.5/themes/color.css" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.9.5/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.9.5/jquery.easyui.min.js"></script>

<style>
  .fitem{
      margin-top:12px;
      
  }
</style>


</head>
<body>
<table id="brand_dg" class="easyui-datagrid" title="品牌管理" style="width:100%;height:500px"
            toolbar="#goods_brand_tb"
			data-options="pagination:true,singleSelect:true,url:'${pageContext.request.contextPath}/sys/goodsBrand/list',method:'get'">
		<thead>
			<tr>
				<th data-options="field:'brandNo',width:120,align:'center'">品牌编号</th>
				<th data-options="field:'brandName',width:150,align:'center'">品牌名称</th>							
				<th field="provider" formatter="brandProviderFormatter" width="150" align="center">供应商</th>
			</tr>
		</thead>
	</table>
	
	<div id="goods_brand_tb">
	<div>
	  <a href="#" class="easyui-linkbutton" onclick="newGoodsBrand()" data-options="iconCls:'icon-add',plain:true">新增</a>
	  <a href="#" class="easyui-linkbutton" onclick="editGoodsBrand()" data-options="iconCls:'icon-edit',plain:true">修改</a>
	  <a href="#" class="easyui-linkbutton" onclick="destroyGoodsBrand()" data-options="iconCls:'icon-remove',plain:true">删除</a>
	</div>
	    <div>
			&nbsp;品牌名称：
			<input type="text" id="brandNameText" size="20" onkeydown="if(event.keyCode == 13) searchGoodsBrandInfo()" />
			<a href="javascript:searchGoodsBrandInfo()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	
	
	<div id="brand_dlg" class="easyui-dialog" style="width:750px;height:300px;padding:10px 20px" closed="true" buttons="#brand_dlg_buttons">
		<form id="brand_fm"  enctype="multipart/form-data" method="post">
			<table cellspacing="15px">
				<tr>
					<td>品牌名称：</td>
					<td>
						<input type="text" id="brand_goodsName" name="brandName" class="easyui-validatebox" required="true" />&nbsp;<font color="red">*</font>
					</td>
					
					<td>供应商：</td>
					<td>
						<input id="brand_type" name="provider.providerNo" class="easyui-combobox" data-options="panelHeight:'auto',editable:false,valueField:'providerNo',textField:'providerName',
						url:'${pageContext.request.contextPath}/sys/Provider/providerList'" />&nbsp;<font color="red">*</font>
					</td>
				</tr>
				
			</table>
		</form>
		
	</div>
</div>
	<div id="brand_dlg_buttons">
		<a href="javascript:saveGoodsBrandInformation()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:resetValue()" class="easyui-linkbutton" iconCls="icon-reset">重置</a>
		<a href="javascript:closeGoodsBrandInformationDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

<script type="text/javascript">



	function brandProviderFormatter(value, row, index){
	    return value.providerName;
	 }
	
/* 	$(function(){
        $('#s_typeid').combobox({ 
            url:'/hotspot/questionstype/typelist?t=' + new Date().getTime(),
              valueField:'providNo',   
              textField:'providerName'  
     });
 */
	
	//点击新增按钮时调用，弹出新增对话框
	function newGoodsBrand(){
		$('#brand_dlg').dialog('open').dialog('setTitle','新增商品');
		$('#brand_fm').form('clear');
		url = '${pageContext.request.contextPath}/sys/goodsBrand/add';
		loadProviderSuccess(0);
	}

	//关闭按钮
	function closeGoodsBrandInformationDialog() {
		$("#brand_dlg").dialog("close");
		resetValue();
	}

	
	//重置按钮
	function resetValue() {
		$("#brand_goodsName").val("");
		$("#brand_type").combobox("setText","");
		$("#brand_brand").combobox("setText","");
		$("#brand_mainFigure").val("");
		$("#brand_goodsPrice").val("");
		$("#brand_goodsNumber").val("");
		$("#brand_goodsRemark").val("");
	}
		

	
	//更改商品品牌
 	 function editGoodsBrand(){
		//brand_dg是表格里的内容，为表格id
			var row = $('#brand_dg').datagrid('getSelected');
			if (row){
				$('#brand_dlg').dialog('open').dialog('setTitle','编辑商品类型名称');
				$('#brand_fm').form('load',row);
				url = '${pageContext.request.contextPath}/sys/goodsBrand/edit?brandNo='+row.brandNo
				
				loadProviderSuccess(row.provider.providerNo);
			}else{
			$.messager.show({
				title:"Info",
				msg:"请先选中一条需要编辑的数据！"
			});
			}
		}  
		
	
	//保存按钮
	function saveGoodsBrandInformation(){
		$('#brand_fm').form('submit',{
			url: url,
			onSubmit: function(){
				return $(this).form('validate');//进行表单验证
			},
			success: function(result){//成功返回结果
			var result = eval('('+result+')');
			if(result.success) {
				$.messager.show({
				title:"系统提示",
				msg:"保存成功！"
			});
				resetValue();
				$("#brand_dlg").dialog("close");
				$("#brand_dg").datagrid("reload");
			} else {	
				$.messager.show({
					title:"系统提示",
					msg:"保存失败！"
				});			
				return;
			}

			}
		});
	}
	
	//搜索按钮
	function searchGoodsBrandInfo() {
		$("#brand_dg").datagrid('load',{
			"brandName":$("#brandNameText").val()
		});
	}
	


	//删除商品信息
	function destroyGoodsBrand() {
		var selectedRows = $("#brand_dg").datagrid("getSelections");
		if(selectedRows.length == 0) {
			$.messager.show({
				title:"系统提示",
				msg:"请选择需要删除的数据！"
			});			
			return;
		}
				
		  $.messager.confirm("系统提示","您确定要删除这<font color='red'>" + selectedRows.length + "</font>条数据吗？",function(r) {  
			if(r) {
				$.post("../sys/goodsBrand/delete",{brandNo:selectedRows[0].brandNo},function(result){
					if(result.success) {
						$.messager.show({
							title:"系统提示",
							msg:"删除成功！"
						});			
						$("#brand_dg").datagrid("reload");
					} else {
						$.messager.show({
							title:"系统提示",
							msg:"数据删除失败，请联系系统管理员！"
						});			
					}
				},"json");
			}
		});
	 } 
	
	 //下拉列表反选 - 供应商类型 
    function loadProviderSuccess(value) {
  	   var data = $("#brand_type").combobox("getData");
  	    if (data && data.length > 0) { 
  		    if (value == 0) {
  			     $("#brand_type").combobox("setValue", data[0].providerNo);
  			     } else { 
  				     $("#brand_type").combobox("setValue", value);
  				  } 
  		      } 
  	      }

	
</script>

</body>
</html>