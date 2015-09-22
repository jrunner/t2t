var oPopup = window.createPopup();
var popTop=50;
function popmsg(msgstr){
	var winstr="<table style=\"border: 1 solid #6D93C8\" width=\"241\" height=\"172\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" >";
	winstr+="<tr><td height=\"30\"> </td></tr><tr><td align=\"center\"><table width=\"90%\" height=\"110\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">";
	winstr+="<tr><td valign=\"top\" style=\"font-size:12px; color: #6D93C8; face: Tahoma\">"+msgstr+"</td></tr></table></td></tr></table>";
	oPopup.document.body.innerHTML = winstr;
	popshow();
}
function popshow(){
	if(popTop>1720){
		clearTimeout(mytime);
		oPopup.hide();
		return;
	}else if(popTop>1520&&popTop<1720){
		oPopup.show(screen.width-250,screen.height,241,1720-popTop);
	}else if(popTop>1500&&popTop<1520){
		oPopup.show(screen.width-250,screen.height+(popTop-1720),241,172);
	}else if(popTop<180){
		oPopup.show(screen.width-250,screen.height,241,popTop);
	}else if(popTop<220){
		oPopup.show(screen.width-250,screen.height-popTop,241,172);
	}
		popTop+=10;
		var mytime=setTimeout("popshow();",50);
	}
var ms;
function getTimeNow(){
	var days=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
	var tm=new Date();
	var year=tm.getYear();
	var month=tm.getMonth();
	var date=tm.getDate();
	var day=tm.getDay();
	var hours=tm.getHours();
	var minutes=tm.getMinutes();
	var seconds=tm.getSeconds();
    ms=year+"年"+month+"月"+date+"日"+hours+":"+minutes+":"+seconds+"&nbsp;"+days[day];
}
getTimeNow();
popmsg("<DIV align='center'><br><br>欢迎您光临  <a href='#'>http://localhost:8080/company</a><br><br>"+ms+"<br><br><font color=red>在本站投放广告0.2元/点击</font></DIV><br></br></br>");




