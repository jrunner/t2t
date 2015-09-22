<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ include file="checked.jsp"%>

<html>
	<head>

		<title>main.jsp</title>
	</head>
<script language="javascript">
window.onbeforeunload=function(){window.location="removeUser.jsp";}
</script>
	<frameset rows="*" cols="*,156" framespacing="5" frameborder="no"
		border="5" bordercolor="#66FF99" >
		
		<frameset rows="*,124" cols="*" framespacing="0" frameborder="no"	border="0" bordercolor="#66FF99">
			<frame src="message.jsp" name="mainFrame" id="mainFrame"scrolling="yes"
				title="mainFrame" />
			<frame src="sendMessage.jsp" name="bottomFrame" scrolling="No"noresize="noresize" id="bottomFrame" title="bottomFrame" />
	  </frameset>
	  
		<frame src="userList.jsp" name="rightFrame" scrolling="No" 
			noresize="noresize" id="rightFrame" title="rightFrame"/>
</frameset>
	<noframes></noframes>


</html>
