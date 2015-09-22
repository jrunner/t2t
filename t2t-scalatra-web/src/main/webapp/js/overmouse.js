// JavaScript Document
var nav = (document.layers);
var tmr = null;
var spd = 50;
var x = 0;
var x_offset = 5;
var y = 0;
var y_offset = 15;
if(nav) document.captureEvents(Event.MOUSEMOVE);
document.onmousemove = get_mouse; 
function get_mouse(e)
{    
  x = (nav) ? e.pageX : event.clientX+document.body.scrollLeft;
  y = (nav) ? e.pageY : event.clientY+document.body.scrollTop;
  x += x_offset;
  y += y_offset;
  beam(1);     
}
function beam(n)
{
  if(n<5)
  {
    if(nav)
    { 
      eval("document.div"+n+".top="+y);
      eval("document.div"+n+".left="+x);
      eval("document.div"+n+".visibility='visible'");
    }  
    else
    {
      eval("div"+n+".style.top="+y);
      eval("div"+n+".style.left="+x);
      eval("div"+n+".style.visibility='visible'");
    }
    n++;
    tmr=setTimeout("beam("+n+")",spd);
  }
  else
  {
     clearTimeout(tmr);
     fade(4);
  }   
} 
function fade(n)
{
  if(n>0) 
  {
    if(nav)eval("document.div"+n+".visibility='hidden'");
    else eval("div"+n+".style.visibility='hidden'"); 
    n--;
    tmr=setTimeout("fade("+n+")",spd);
  }
  else clearTimeout(tmr);
} 
