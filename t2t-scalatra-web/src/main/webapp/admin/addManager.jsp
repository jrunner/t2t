<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>

<html>
	<head>

		<title>添加管理员</title>

		<link rel="stylesheet" type="text/css" href="../styles/admin.css">

		<script type="text/javascript">
		function checkForm() {
			//with 语句通常用来缩短特定情形下必须的代码
			 with(document.form1){
				if (txtUserName.value == "") {
					alert("用户名不能为空");
					txtUserName.focus();
					return false;
				} 
 				if (txtPassword.value == "") {
					alert("密码不能为空");
					txtPassword.focus();
					return false;
				} 
			   if (txtRePassword.value != txtPassword.value) {
					alert("输入的密码不一致");
					txtPassword.focus();
					return false;
				}
				return true;
			 }
		}
		
	//回车换行
	function changeFocus(){
		if(event.srcElement.type!=""&&event.keyCode==13&&event.srcElement.type!="button"&&event.srcElement.type!="submit"){
			event.keyCode=9;
		}
	}
	document.onkeydown=changeFocus;
	</script>

	</head>

	<body>
		<form name="form1" action="doAddManager.jsp" method="post"
			onSubmit="return checkForm()">
			<table cellspacing="1" cellpadding="4" width="100%"
				class="tableborder" id="table3">

				<tr>
					<td colspan="12" class="header">
						管理员-添加
					</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#FFFFFF">
						管理员名称：
					</td>
					<td colspan="11" bgcolor="#FFFFFF">
						<input name="txtUserName" type="text" id="txtUserName" size="34">
					</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#FFFFFF">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码：
					</td>
					<td colspan="11" bgcolor="#FFFFFF">
						<input type="password" name="txtPassword" size="34">
					</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#FFFFFF">
						&nbsp;&nbsp;确认密码：
					</td>
					<td colspan="11" bgcolor="#FFFFFF">
						<input name="txtRePassword" size="34" type="password">
					</td>
				</tr>


				<tr>
					<td bgcolor="#FFFFFF">
					</td>
					<td colspan="11" bgcolor="#FFFFFF">
						<input name="btnSub" type="submit" class="mouseOutStyle"
							id="btnSub" onMouseOver="this.className='mouseOverStyle'"
							onMouseOut="this.className='mouseOutStyle'" value="提 交">
						&nbsp;&nbsp;
						<input name="btnReset" type="reset" class="mouseOutStyle"
							id="btnReset" onMouseOver="this.className='mouseOverStyle'"
							onMouseOut="this.className='mouseOutStyle'" value="重 置">
					</td>
				</tr>

			</table>
		</form>
	</body>

</html>
