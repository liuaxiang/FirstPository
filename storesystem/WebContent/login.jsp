<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>系统登录</title>
<!-- 下载并引入jquery easyUI -->
<link rel="stylesheet" type="text/css"
	href="./js/jquery-easyui-1.9.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="./js/jquery-easyui-1.9.5/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="./js/jquery-easyui-1.9.5/themes/color.css">
<script type="text/javascript"
	src="./js/jquery-easyui-1.9.5/jquery.min.js"></script>
<script type="text/javascript"
	src="./js/jquery-easyui-1.9.5/jquery.easyui.min.js"></script>

<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

body {
	background: #fff url("./images/login3.jpg") 0 0;
	color: #46b8da;
}

h1 {
	color: rgb(128, 128, 128);
	text-align: center;
}

a:link, a:hover, a:visited, a:active {
	color: rgb(128, 128, 128);
	text-decoration: none;
}

form {
	width: 400px;
	min-width: 400px;
	position: absolute;
	left: 40%;
	top: 15%;
	margin: 0;
	padding: 30px;
	background-color: white;
	border: 2px solid rgba(128, 128, 128, 0.2);
	border-radius: 10px;
}

form div {
	margin-bottom: 10px;
}
#ttt a:hover{
    color:red;

}
</style>

</head>
<body>
	<form id="users_fm" method="post">
		<div>
			<h1 style="color:#6950a1">系统登录</h1>
		</div>
		<div>
			<input name="name" class="easyui-textbox"
				data-options="iconCls:'icon-man',iconWidth:30,iconAlign:'left',prompt:'用户名'"
				style="width: 100%; height: 35px;" required="true" />
		</div>
		<div>
			<input name="password" class="easyui-passwordbox"
				data-options="iconWidth:30,iconAlign:'left',prompt:'密码'"
				style="width: 100%; height: 35px;" required="true" />
		</div>
		<div>
			<input name="validate" class="easyui-textbox"
				data-options="iconCls:'icon-lock',iconWidth:30,iconAlign:'left',prompt:'验证码'"
				style="width: 100%; height: 35px;" required="true" />
			<img
				id="validateImage" style="cursor: pointer; margin: 3px;margin-left: 120px;margin-top: 20px;"
				src="validatecode.jsp" alt="验证码"
				height="32px" width="80px" onclick="resetCode()">
		</div>
		<div>
			<input class="easyui-checkbox" label="记住密码" labelPosition="after"
				labelWidth="70" />
		</div>
		<div style="text-align: center;">

			<a href="#" id="loginbtn" style="width: 40%; height: 35px;"
				class="easyui-linkbutton" iconCls="icon-ok" onclick="login()">登录</a>

			<a href="#" style="width: 40%; height: 35px; margin-left: 30px;"
				class="easyui-linkbutton" iconCls="icon-cancel"
				onclick="clearForm()">重置</a>

		</div>
		<div id="ttt">
			<div style="display: inline;">
				<a href="javascript:void(0)">还未注册？</a>
			</div>
			<div style="display: inline; margin-left: 170px;">
				<a href="javascript:void(0)">忘记密码？</a>
			</div>
		</div>
	</form>

	<script type="text/javascript">
		function resetCode() {
			$("#validateImage").attr('src',"./validatecode.jsp?r="
					+ new Date().getTime());
		}

		function clearForm() {
			$('#users_fm').form('reset');
		}
		function login() {
			//使用ajax进行提交，
			$('#users_fm')
					.form(
							'submit',
							{
								url : './sys/users/login',
								onSubmit : function() {
									return $(this).form('validate');
								},
								success : function(result) {
									var result = eval('(' + result + ')');
									if (!result.success) {
										$.messager.show({
											title : 'Error',
											timeout : 2000,
											msg : result.errorMsg
										});
										$('#users_fm').form('reset');
										resetCode();
									} else {
										$.messager.show({
											title : 'Info',
											timeout : 2000,
											msg : result.errorMsg
										});
										window.location.href = "./pages/index.html";
									}
								}
							});
		}
	</script>
</body>
</html>