<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="sysjsp.bysj.dao.impl.*"%>
<%@ page import="sysjsp.bysj.entity.*"%>
<%@ page import="syjsp.bysj.dao.MessageDao"%>
<%@ page  import="syjsp.bysj.dao.RevertDao"%>
<%
try{
	/*设置符集*/
	request.setCharacterEncoding("gb2312");
	
	/*获取数据*/
	if (request.getParameter("messageId") == null) {
		response.sendRedirect("messageBoard.jsp");
		return;
	}
	int messageId=Integer.parseInt(request.getParameter("messageId"));
	System.out.println(request.getParameter("messageId"));
	int p=(request.getParameter("p")==null)?1:Integer.parseInt(request.getParameter("p"));
	
	/*业务处理*/
	MessageDao messageDao = new MessageDaoImpl();
	Message message = messageDao.findMessage(messageId);
	
	RevertDao revertDao = new RevertDaoImpl();// 实例化RevertDao
	List list=revertDao.findReplyList(p,messageId);
	
	int last=(p>1)?p-1:p;
	int next=(list.size()==5)?p+1:p;
%>
<html>
	<head>
		<title>回复页面</title>
		<link href="styles/css.css" rel="stylesheet" type="text/css">
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body {
	background-image: url(image/bookbg.gif);
}
.STYLE1 {	color: #FF0000;
	font-size: 12px;
}
-->
    </style>
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
</head>
	<body >
		<table width="756" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
			  <td height="38"><img src="image/welcome.jpg" width="750" height="135"></td>
		  </tr>
			<tr>
				<td width="756" height="38">
					<strong class="d02"><marquee direction="left" width="750" scrolldelay="150">
							欢迎您使用 留言本
						</marquee></strong></td>
			</tr>
			<tr>
				<td height="28" class="g01">主题:<%=message.getTitle() %></td>
			</tr>
			<tr>
				<td height="25"><table width="86" border="0" cellpadding="0" cellspacing="0">
						<tr><td width="13" height="25" align="right"><img src="image/titlemu_1.gif" width="12" height="25"></td>
						  <td width="61" align="center" background="image/titlemu_2.gif"><a href="newMessage.jsp" class="dong02"><strong>留言</strong></a></td><td width="12"><img src="image/titlemu_3.gif" width="12" height="25"></td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td height="163" valign="top"><table width="756" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td colspan="2" align="center"><img src="image/T_left.gif" width="140" height="21"></td>
							<td width="569" background="image/T_center.GIF">&nbsp;</td>
							<td width="56"><img src="image/T_right.gif" width="56" height="21"></td>
						</tr>
						<tr>
							<td height="128" colspan="4" align="left" valign="top">
								<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"
									class="tableborderMes">
									<tr>
										<td height="122" align="left" valign="top" class="d02">&nbsp;&nbsp;&nbsp;<%=message.getContent() %>										</td>
									</tr>
									<tr>
										<td height="18" class="topMes"><span class="d02">&nbsp;&nbsp;&nbsp;</span><span class="g01"><%=message.getName() %>写于<%=message.getLeaveDate() %>									  </span></td>
									</tr>
								</table></td>
						</tr>
					</table> </td>
			</tr>
			<tr>
				<td height="18" valign="top">
					<table width="756" height="17" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="145" height="17" valign="top"><img src="image/T_bottomleft.gif" width="145" height="17"></td>
							<td width="466" align="center" valign="middle"background="image/T_bottombg.gif">&nbsp;</td>
							<td width="145" align="right"><img src="image/T_bottomright.gif" width="145" height="17"></td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td height="18">&nbsp;</td>
			</tr>
			
			<%
			if(list.size()!=0){
			 %>
			
			<tr>
			  <td height="26"><span class="g01"><strong>回复内容：</strong></span></td>
			</tr>
			<tr>
			  <td height="196" align="center" valign="top">
			  <!--我要开始了-->
			  <%
			  for(int i=0;i<list.size();i++){
			  	Revert revert=(Revert)list.get(i);
			   %>
			  <table width="756" border="0" cellpadding="0">
                              <tr>
                                <td width="752" height="21"><table width="750" border="0" align="right" cellpadding="0" cellspacing="0"><tr><td width="140" height="21" align="center"><img src="image/T_left.gif" width="140" height="21"></td><td width="560" align="center" background="image/T_center.GIF">&nbsp;</td><td width="50"><img src="image/T_right.gif" width="50" height="21"></td></tr></table></td>
                              </tr>
                              <tr>
                                <td valign="top"><table width="752" border="0" cellpadding="0" cellspacing="0"
									class="tableborderMes">
                                  <tr>
                                    <td width="750" height="122" align="left" valign="top" class="d02"> &nbsp;&nbsp;&nbsp;<%=revert.getContent() %> </td>
                                  </tr>
                                  <tr>
                                    <td height="13" class="topMes"> <span class="d02">&nbsp;&nbsp;&nbsp;</span><span class="g01"><%=revert.getName() %>写于<%=revert.getReplyDate() %> </span></td>
                                  </tr>
                                </table></td>
                              </tr>
                              <tr><td height="30"><table width="752" height="30" border="0" cellpadding="0"cellspacing="0"><tr><td width="145" height="17" valign="top"><img src="image/T_bottomleft.gif" width="145" height="17"></td><td width="462" align="center" valign="middle"background="image/T_bottombg.gif"></td><td width="145" align="right"><img src="image/T_bottomright.gif" width="145" height="17"></td></tr>
                                  <tr>
                                    <td height="13" valign="top">&nbsp;</td>
                                    <td align="center" valign="middle">&nbsp;</td>
                                    <td align="right">&nbsp;</td>
                                  </tr>
                                </table></td>
                              </tr>
                </table>
                            <%
                            }
                             %>
			  <!--我要结束了--></td>
			</tr>
			<%
			}
			 %>
			<tr>
			  <td height="15" align="right" valign="top"><a href="revertMessage.jsp?messageId=<%=messageId %>&p=<%=last %>" class="dong05">上一页</a><span class="STYLE1">&nbsp;|&nbsp;</span><a href="revertMessage.jsp?messageId=<%=messageId %>&p=<%=next %>" class="dong05">下一页</a>&nbsp;&nbsp;</td>
		  </tr>
			<tr>
			  <td height="87" valign="top">
			  <!-- 表单提交  -->
			  <form name="form1" method="post" onSubmit="return checkForm();" action="saveRevert.jsp?messageId=<%=messageId %>">
			    <table width="101%" border="0" align="center" cellpadding="0"
						cellspacing="0" class="tableborderMes">
                  <tr>
                    <td height="23" colspan="2" align="center"
								background="image/title.gif" class="d02"><strong class="g01">快速回复</strong> </td>
                  </tr>
                  <tr>
                    <td width="10%" height="31" align="center"><span class="g01">姓名:</span> </td>
                    <td width="90%" valign="middle"><input name="txtName" type="text" id="txtName">                    </td>
                  </tr>
                  <tr>
                    <td height="27" align="center"><span class="g01">标题:</span> </td>
                    <td valign="middle"><input name="txtTitle" type="text" id="txtTitle">                    </td>
                  </tr>
                  <tr>
                    <td height="115" align="center" valign="top"><span class="g01">内容:</span> </td>
                    <td valign="top"><textarea name="txtContent" cols="70" rows="8" id="txtContent"></textarea></td>
                  </tr>
                  <tr>
                    <td height="32" valign="top">&nbsp;</td>
                    <td valign="middle"><input name="btnSub" type="submit" class="mouseOutStyle"
									id="btnSub" onMouseOver="this.className='mouseOverStyle'"
									onMouseOut="this.className='mouseOutStyle'" value="提 交">
					 </td>
                  </tr>
                </table>
            </form>	
            </td>
			</tr>
	</table>
	</body>
</html>
<%
}catch(Exception e){
		response.sendRedirect("messageBoard.jsp");
}
 %>
