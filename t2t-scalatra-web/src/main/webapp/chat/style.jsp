<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	request.setCharacterEncoding("GBK");
	
	String select= request.getParameter("select");
	
	session.setAttribute("style","background-color: "+select);	
%>
<html>
	<head>
	<script type="text/javascript">
		function runChange(){ 
			document.form1.submit();
		 }
	
	</script>
	</head>

	<body onLoad="run('<%=select %>')" style="<%=(String) session.getAttribute("style")%>">
		<span class="d02"> 选择界面风格:
			<form action="style.jsp" method="post" name="form1">
				<SELECT id="select" name="select" onChange="runChange()">
					<OPTION value="#FFFFFF">
						默认风格
					</OPTION>
					<OPTION value="red">
						粉红风情
					</OPTION>
					<OPTION value="green">
						绿色地带
					</OPTION>
					<OPTION value="blue">
						蓝色港湾
					</OPTION>
				</SELECT>
			</form> </span>
		<br>
	</body>
	
		<script type="text/javascript">
		function run(st){ 
			with(document.form1){
			if(st=="#FFFFFF")
				select.options[0].selected="selected";
			if(st=="red")
				select.options[1].selected="selected";
			if(st=="green")
				select.options[2].selected="selected";
			if(st=="blue")
				select.options[3].selected="selected";
			}
		 }
	</script>
</html>
