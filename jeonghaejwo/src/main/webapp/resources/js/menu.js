var navStatus=false;

function nav(){
	if(navStatus==false){
		openNav();
		navStatus=true;
	}else{
		closeNav();
		navStatus=false;
	}
}

function openNav() {
   /* document.getElementById("mySidenav").style.width = "25%";*/
	$('#mySidenav').css('right', '0px');
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
    document.getElementById("mySidenav").style.backgroundColor = "#cacaca";
}

function closeNav() {
    /*document.getElementById("mySidenav").style.width = "6%";*/
	$('#mySidenav').css('right', '-155px');
    document.body.style.backgroundColor = "";
    document.getElementById("mySidenav").style.backgroundColor = "";
}

