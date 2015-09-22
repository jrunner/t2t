<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<html>
	<head>
		<title>发布新留言</title>

		<script language="javascript">
			function checkForm(){
				with(document.form1){
					if(txtName.value==""){
						alert("姓名不能为空");
						txtName.focus();
						return false;
					}
					if(txtTitle.value==""){
						alert("标题不能为空");
						txtTitle.focus();
						return false;
					}
					if(txtContent.value==""){
						alert("内空不能为空");
						txtContent.focus();
						return false;
					}
				}
				return true;
			}
			
	//回车换行
	function changeFocus(){
		if(event.srcElement.type!=""&&event.keyCode==13&&event.srcElement.type!="button"&&event.srcElement.type!="submit"){
			event.keyCode=9;
		}
	}
	document.onkeydown=changeFocus;
		</script>
		<link href="styles/css.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<table width="757" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="757">
					<img src="image/welcome.jpg" width="750" height="135">
				</td>
			</tr>
			<tr>
				<td height="12" align="right">
					<strong class="d02"> 
					<marquee direction="left" width="750"
							scrolldelay="150">
							欢迎您使用 留言本
					</marquee>				
				  </td>
			</tr>
			<tr>
				<td height="17" align="left">
					<table width="90" border="0" cellpadding="0" cellspacing="0">						<tr><td width="13" height="25" align="right"><img src="image/titlemu_1.gif" width="12" height="25"></td><td width="65" align="center" background="image/titlemu_2.gif"><strong class="g01">留言</strong>							</td><td width="12"><img src="image/titlemu_3.gif" width="12" height="25"></td></tr>
					</table>

				</td>
			</tr>
			<tr>
				<td height="211" align="right" valign="top">
					<form name="form1" method="post" action="saveMessage.jsp" onSubmit="return checkForm();">
						<table width="100%" border="0" align="center" cellpadding="0"
							cellspacing="0" class="tableborderMes">

							<tr>
								<td height="23" colspan="2" align="center"
									background="image/title.gif" class="d02">
									<strong class="g01">新 留 言</strong>
								</td>
							</tr>
							<tr>
								<td width="10%" height="31" align="center">
									<span class="g01">姓名:</span>
								</td>
								<td width="90%" valign="middle">
									<input name="txtName" type="text" id="txtName">
								</td>
							</tr>
							<tr>
								<td height="27" align="center">
									<span class="g01">标题:</span>
								</td>
								<td valign="middle">
									<input name="txtTitle" type="text" id="txtTitle">
								</td>
							</tr>
							<tr>
								<td height="115" align="center" valign="top">
									<span class="g01">内容:</span>
								</td>
								<td valign="top">
									<textarea name="txtContent" cols="70" rows="8" id="txtContent"></textarea>
								</td>
							</tr>
							<tr>
								<td height="32" valign="top">&nbsp;								</td>
								<td valign="middle">
									<input name="btnSub" type="submit" class="mouseOutStyle"
										id="btnSub" onMouseOver="this.className='mouseOverStyle'"
										onMouseOut="this.className='mouseOutStyle'" value="提 交">							  </td>
							</tr>
						</table>
				  </form>
				</td>
			</tr>
		</table>
	</body>
</html>
