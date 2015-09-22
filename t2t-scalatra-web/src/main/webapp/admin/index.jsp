<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ include file="checkAdmin.jsp"%>

<html>
  <head>
    
    <title>管理员首页</title>
    <script type="text/javascript">
		function isShow() {
			if(document.getElementById("leftTD").style.display=='none')
     			document.getElementById("leftTD").style.display='';
   			else
     			document.getElementById("leftTD").style.display='none';
		}
	</script>

    <link href="../styles/admin.css" rel="stylesheet" type="text/css">
  </head>
  
	<body scroll=no topmargin="0" leftmargin="0">
		<table width="100%" height="100%" border="0" align="center"
			cellpadding="0" cellspacing="0">
			<tr>
				<td id="leftTD" width="162" height="100%">
					<iframe frameBorder="0" id="left" name="left" src="left.jsp"
						height="100%" width="162" target="main">					</iframe>				</td>
				<td align="center"  onClick="isShow();" height="100%">
					<table width="100%" height="100%" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td bgcolor="#3A5F94">
								<font color="#ffffff">点击此处切换</font><br></td>
						</tr>
					</table>				</td>
			  <td width="100%" height="100%" ><iframe frameborder="0" id="main" name="main" scrolling="yes"
						src="right.jsp" height="100%" width="100%"></iframe></td>
			</tr>
		</table>
	</body>

</html>
