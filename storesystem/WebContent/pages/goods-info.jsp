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
<table id="goods_info_dg" class="easyui-datagrid" title="商品管理" style="width:100%;height:500px"
            toolbar="#goods_tb"
			data-options="pagination:true,singleSelect:true,url:'${pageContext.request.contextPath}/sys/goods/list',method:'get'">
		<thead>
			<tr>
				<th data-options="field:'goodsNo',width:120,align:'center'">商品编号</th>
				<th data-options="field:'goodsName',width:140,align:'center'">商品名称</th>							
				<th field="goods_type" formatter="goodsTypeFormatter" width="140" align="center">类型名称</th>
				<th field="goods_brand" formatter="goodsBrandFormatter" width="140" align="center">商品品牌</th>								
				<th data-options="field:'goodsPrice',width:140,align:'center'">商品价格</th>
				<th data-options="field:'goodsNumber',width:140,align:'center'">商品数量</th>				
				<th field="mainFigure" formatter="imageFormatter" width="200" align="center">商品配图</th>				
				<th data-options="field:'goodsRemark',width:235,align:'center'">备注</th>
			</tr>
		</thead>
	</table>
	
	<div id="goods_tb">
	<div>
	  <a href="#" class="easyui-linkbutton" onclick="newGoods()" data-options="iconCls:'icon-add',plain:true">新增</a>
	  <a href="#" class="easyui-linkbutton" onclick="editGoods()" data-options="iconCls:'icon-edit',plain:true">修改</a>
	  <a href="#" class="easyui-linkbutton" onclick="destroyGoods()" data-options="iconCls:'icon-remove',plain:true">删除</a>
	</div>
	    <div>
			&nbsp;商品名称：
			<input type="text" id="goodsNameText" size="20" onkeydown="if(event.keyCode == 13) searchGoodsInfo()" />
			<a href="javascript:searchGoodsInfo()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	
	
	<div id="goods_info_dlg" class="easyui-dialog" style="width:750px;height:400px;padding:10px 20px" closed="true" buttons="#goods_info_dlg_buttons">
		<form id="goods_info_fm"  enctype="multipart/form-data" method="post">
			<table cellspacing="15px">
				<tr>
					<td>商品名称：</td>
					<td>
						<input type="text" id="goods_info_goodsName" name="goodsName" class="easyui-validatebox" required="true" />&nbsp;<font color="red">*</font>
					</td>
					
					<td>商品配图:</td>
					<td>
						<input id="goods_info_mainFigure" name="imageFile" class="easyui-filebox" />
					</td>
				</tr>
				
				
				<tr>
					<td>商品价格：</td>
					<td>
						<input id="goods_info_goodsPrice" name="goodsPrice" class="easyui-validatebox validatebox-text" validtype="price" maxlength='7' title="" required="true">&nbsp;<font color="red">*</font>
					</td>
					
					<td>商品数量:</td>
					<td>
						<input id="goods_info_goodsNumber" name="goodsNumber" class="easyui-validatebox validatebox-text" validtype="number" maxlength='7' title="" required="true">&nbsp;<font color="red">*</font>
					</td>
				</tr>
										
			
				<tr>
					<td>商品类型：</td>
					<td>
						<input id="goods_info_type" name="goods_type.typeNo" class="easyui-combobox" data-options="panelHeight:'auto',editable:false,valueField:'typeNo',textField:'typeName',
						url:'${pageContext.request.contextPath}/sys/goodsType/goodstypelist'" />&nbsp;<font color="red">*</font>
					</td>
					<td>商品品牌：</td>
					<td>
						<input id="goods_info_brand" name="goods_brand.brandNo" class="easyui-combobox" data-options="panelHeight:'auto',editable:false,valueField:'brandNo',textField:'brandName',
						url:'${pageContext.request.contextPath}/sys/goodsBrand/goodsBrandList'" />&nbsp;<font color="red">*</font>
					</td>
				</tr>
				
			
				<tr>
					<td>&nbsp;备注：</td>
					<td colspan="3">
						<textarea type="text" id="goods_info_goodsRemark" name="goodsRemark" rows="5" cols="46"></textarea>
					</td>
				</tr>
			</table>
		</form>
		
	</div>
</div>
	<div id="goods_info_dlg_buttons">
		<a href="javascript:saveGoodsInformation()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:resetValue()" class="easyui-linkbutton" iconCls="icon-reset">重置</a>
		<a href="javascript:closeGoodsInformationDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

<script type="text/javascript">

	
	function imageFormatter(value, row, index){
		 if(value && value!=null){
			  return "<img width='120' height='120' src='${pageContext.request.contextPath}/"+value+"' />'";
		  }
	}
	 
	function goodsTypeFormatter(value, row, index){
	    return value.typeName;
	 }
	 
	
	function goodsBrandFormatter(value, row, index){
	      return value.brandName;
	  }   

	
	//下拉框实时刷新
	$('#goods_info_type').combobox({ 
		onShowPanel : function(){
		var s=$(this).combobox('getData');
		$(this).combobox('options').url= '${pageContext.request.contextPath}/sys/goodsType/goodstypelist?t=' + new Date().getTime();
	    $(this).combobox('reload');
		}
	 });
		
	
	//点击新增按钮时调用，弹出新增对话框
	function newGoods(){
		$('#goods_info_dlg').dialog('open').dialog('setTitle','新增商品');
		$('#goods_info_fm').form('clear');
		url = '${pageContext.request.contextPath}/sys/goods/add';
		loadTypeSuccess(0);
		loadBrandSuccess(0);
	}

	//关闭按钮
	function closeGoodsInformationDialog() {
		$("#goods_info_dlg").dialog("close");
		resetValue();
	}

	
	//重置按钮
	function resetValue() {
		$("#goods_info_goodsName").val("");
		$("#goods_info_type").combobox("setText","");
		$("#goods_info_brand").combobox("setText","");
		$("#goods_info_mainFigure").val("");
		$("#goods_info_goodsPrice").val("");
		$("#goods_info_goodsNumber").val("");
		$("#goods_info_goodsRemark").val("");
	}
		

	
	//更改商品
 	 function editGoods(){
		//goods_info_dg是表格里的内容，为表格id
			var row = $('#goods_info_dg').datagrid('getSelected');
			if (row){
				$('#goods_info_dlg').dialog('open').dialog('setTitle','编辑商品类型名称');
				$('#goods_info_fm').form('load',row);
				url = '${pageContext.request.contextPath}/sys/goods/edit?goodsNo='+row.goodsNo;
				loadTypeSuccess(row.goods_type.typeNo);
				loadBrandSuccess(row.goods_brand.brandNo);
			}else{
			$.messager.show({
				title:"Info",
				msg:"请先选中一条需要编辑的数据！"
			});
			}
		}  
		
	
	//保存按钮
	function saveGoodsInformation(){
		$('#goods_info_fm').form('submit',{
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
				$("#goods_info_dlg").dialog("close");
				$("#goods_info_dg").datagrid("reload");
			} else {	
				$.messager.show({
					title:"系统提示",
					msg:"商品名已存在！"
				});			
				return;
			}

			}
		});
	}
	
	//搜索按钮
	function searchGoodsInfo() {
		$("#goods_info_dg").datagrid('load',{
			"goodsName":$("#goodsNameText").val()
		});
	}
	


	//删除商品信息
	function destroyGoods() {
		var selectedRows = $("#goods_info_dg").datagrid("getSelections");
		if(selectedRows.length == 0) {
			$.messager.show({
				title:"系统提示",
				msg:"请选择需要删除的数据！"
			});			
			return;
		}
				
		  $.messager.confirm("系统提示","您确定要删除这<font color='red'>" + selectedRows.length + "</font>条数据吗？",function(r) {  
			if(r) {
				$.post("../sys/goods/delete",{goodsNo:selectedRows[0].goodsNo},function(result){
					if(result.success) {
						$.messager.show({
							title:"系统提示",
							msg:"删除成功！"
						});			
						$("#goods_info_dg").datagrid("reload");
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
	
	//输入价格格式验证
	$.extend($.fn.validatebox.defaults.rules, {//添加验证规则
		price: {//value值为文本框中的值
	           validator: function (value) {
				var reg= /^[0-9]+(.[0-9]{0,2})?$/;
	         /*  var reg = /^\d+(\.\d+)?$/; */
	           return reg.test(value);
	       },
	       message: '请输入正确格式'
	  }
	});
	
	//输入商品数量格式验证
	$.extend($.fn.validatebox.defaults.rules, {//添加验证规则
		number: {//value值为文本框中的值
	           validator: function (value) {
	          var reg = /^\d+(\d+)?$/;
	           return reg.test(value);
	       },
	       message: '请输入非负整数'
	  }
	});


	
	 //下拉列表反选 - 商品类型 
    function loadTypeSuccess(value) {
  	   var data = $("#goods_info_type").combobox("getData");
  	    if (data && data.length > 0) { 
  		    if (value == 0) {
  			     $("#goods_info_type").combobox("setValue", data[0].typeNo);
  			     } else { 
  				     $("#goods_info_type").combobox("setValue", value);
  				  } 
  		      } 
  	      }


	//下拉列表反选 - 品牌
	 function loadBrandSuccess(value) { 
		   var data = $("#goods_info_brand").combobox("getData");
		    if (data && data.length > 0) { 
			    if (value == 0) { $("#goods_info_brand").combobox("setValue", data[0].brandNo);
			     } else {
				      $("#goods_info_brand").combobox("setValue", value); 
				      } 
			      } 
		 }

	
</script>

</body>
</html>