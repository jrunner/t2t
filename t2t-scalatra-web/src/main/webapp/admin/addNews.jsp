<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>

<html>
	<head>

		<title>添加新闻</title>


		<link rel="stylesheet" type="text/css" href="../styles/admin.css">

		<script type="text/javascript">
		function checkForm() {
			//with 语句通常用来缩短特定情形下必须的代码
			with(document.form1){
					if (txtTitle.value == "") {
						alert("新闻标题不能为空");
						txtTitle.focus();
						return false;
					} 
		 			if (txtContent.value == "") {
						alert("新闻内容不能为空");
						txtContent.focus();
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
		<form name="form1" action="../admin/doAddNews.jsp" method="post"
			onSubmit="return checkForm();">
			<table cellspacing="1" cellpadding="4" width="100%"
				class="tableborder" id="table3">

				<tr>
					<td colspan="12" class="header">
						添加新闻信息
					</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#FFFFFF">
						新闻标题：
					</td>
					<td colspan="11" bgcolor="#FFFFFF">
						<input name="txtTitle" type="text" id="txtTitle" size="34">
					</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#FFFFFF">
						新闻内容：
					</td>
					<td colspan="11" bgcolor="#FFFFFF">
						<textarea name="txtContent" cols="60" rows="5" id="txtContent"></textarea>
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
