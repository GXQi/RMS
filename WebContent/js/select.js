function edit(e){
	window.location.href=("/RMS/edit?phonenumber="+e.id);
}

function details(e){
	var s=e.id.split("+")[1];
	window.location.href=("/RMS/resumemanage/show?phonenumber="+s);
}

