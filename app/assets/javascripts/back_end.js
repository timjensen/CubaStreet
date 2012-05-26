
var ContentHeight = 400;
var TimeToSlide = 400.0;
var openAccordion = '';

function runAccordion(index)
{
  var nID = "Accordion" + index + "Content";
  if(openAccordion == nID)
    nID = '';
   
  setTimeout("animate(" + new Date().getTime() + "," + TimeToSlide + ",'"
      + openAccordion + "','" + nID + "')", 33);
 
  openAccordion = nID;
}

function animate(lastTick, timeLeft, closingId, openingId)
{  
  var curTick = new Date().getTime();
  var elapsedTicks = curTick - lastTick;
 
  var opening = (openingId == '') ? null : document.getElementById(openingId);
  var closing = (closingId == '') ? null : document.getElementById(closingId);
 
  if(timeLeft <= elapsedTicks)
  {
    if(opening != null)
      opening.style.height = ContentHeight + 'px';
   
    if(closing != null)
    {
      closing.style.display = 'none';
      closing.style.height = '0px';
    }
    return;
  }
 
  timeLeft -= elapsedTicks;
  var newClosedHeight = Math.round((timeLeft/TimeToSlide) * ContentHeight);

  if(opening != null)
  {
    if(opening.style.display != 'block')
      opening.style.display = 'block';
    opening.style.height = (ContentHeight - newClosedHeight) + 'px';
  }
 
  if(closing != null)
    closing.style.height = newClosedHeight + 'px';

  setTimeout("animate(" + curTick + "," + timeLeft + ",'"
      + closingId + "','" + openingId + "')", 33);
}
function up() {
  var info = document.getElementById('lbx_pro');
  var image = info.options[info.selectedIndex].text;
  document.getElementById('newinner').innerHTML = 
  '<center><label for="product_New Image:">New image:</label><img alt="'+image+'" id="newpic" src="/assets/products/'+image+'" /><label for="product_image" id="newlabel">'+image+'</label></center>'
  document.getElementById('product_pro_image').value = image;
}
function ups() {
  var info = document.getElementById('lbx_pro');
  var image = info.options[info.selectedIndex].text;
  document.getElementById('newinner').innerHTML = 
  '<center><label for="staff_New Image:">New image:</label><img alt="'+image+'" id="newpic" src="/assets/staffs/'+image+'" /><label for="staff_image" id="newlabel">'+image+'</label></center>'
  document.getElementById('staff_image').value = image;
}
