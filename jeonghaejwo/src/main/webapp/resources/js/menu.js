$(document).ready(menuFuc())

	$(window).bind("pageshow", function(event){
		if(event.originalEvent.persisted){
			
		}else{
			$('#menu_checkbox')[0].checked=false
			menuFuc();
		}
	})
	
function menuFuc(){
	var navStatus=false;
	$('#menu_checkbox').click(function(){
	    if(navStatus==false){
	    	navStatus=true;
	    	$('.menu_grid2').stop().animate({
	            width: "17vw"
	        },600);
	    	$('#mySidenav').stop().animate({
	            right: "0"
	        },600);
	    	$("#mySidenav").css('background-color', "white");
	    }else{
	    	navStatus=false;
	    	$('.menu_grid2').stop().animate({
	            width: "0"
	        },600);
	    	$('#mySidenav').stop().animate({
	            right: "-12vw"
	        },600);
	    	$("#mySidenav").css('background-color', "");
	    }
	});
}	
