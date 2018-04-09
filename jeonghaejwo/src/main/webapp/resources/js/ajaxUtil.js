function ajax(url, callback , data, enctype){ 
	if(data){
		$.ajax({
			url : url,
			data : data,
			success : callback
		});
	}else if(enctype){
		$.ajax({
			url : url,
			data : data,
			enctype=enctype,
			success : callback
		});
	}
	else{
		$.ajax({
			url : url,
			success : callback
		});
	}
}