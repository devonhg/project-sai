document.getElementById("date-time").innerHTML = formatAMPM();

function formatAMPM() {
var d = new Date(),
    minutes = d.getMinutes().toString().length == 1 ? '0'+d.getMinutes() : d.getMinutes(),
    //hours = d.getHours().toString().length == 1 ? '0'+d.getHours() : d.getHours(),
    hours = d.getHours(),
    ampm = d.getHours() >= 12 ? 'pm' : 'am',
    months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'],
    days = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];

    if( hours >= 12 ){
        hours = hours - 12; 
    }if( hours == 0 ){ hours = 12; }

return days[d.getDay()]+' '+months[d.getMonth()]+' '+d.getDate()+' '+d.getFullYear()+' '+hours+':'+minutes+ampm;
}

// Cache the div so that the browser doesn't have to find it every time the window is resized.
var $div = $('.content');

// Run the following when the window is resized, and also trigger it once to begin with.
$(window).resize(function () {
   // Get the current height of the div and save it as a variable.
   var height = $div.height();
   // Set the font-size and line-height of the text within the div according to the current height.
   $div.css({
      'font-size': (height/4) + 'px',
      'line-height': height + 'px'
   })
}).trigger('resize');