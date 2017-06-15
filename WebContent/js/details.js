function downloadResume(){
	//获取电化
	var phonenumber=$("#phonenumber").text();
	window.location.href=("/RMS/download?phonenumber="+phonenumber);
};