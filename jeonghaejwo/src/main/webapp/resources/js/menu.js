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
    document.getElementById("mySidenav").style.width = "25%";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
    document.getElementById("mySidenav").style.backgroundColor = "rgba(17, 17, 17, 0.36)";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "6%";
    document.body.style.backgroundColor = "";
    document.getElementById("mySidenav").style.backgroundColor = "";
}

