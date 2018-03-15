/* 라디오 버튼 활성 비활성 조정 */
function radioAble(){
	if(count<2){
		document.getElementById("radio1").disabled = false;
		 document.getElementById("radio2").disabled = false;
		document.getElementById("radio3").disabled = true;
		 document.getElementById("radio4").disabled = true;
	}else{
		document.getElementById("radio3").disabled = false;
		 document.getElementById("radio4").disabled = false;
	}
}


/* 시간 설정 */

var count = 0;
var countEl = document.getElementById("time_count");
function plus(){
	if(count<6){
	    count++;
	    countEl.value = count+" 시간";
	    radioAble();
	   
	}
}
function minus(){
  if (count > 1) {
    count--;
    countEl.value = count+" 시간";
    radioAble();
  }  
}

