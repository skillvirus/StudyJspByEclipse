function confirmPopup(message) {
	var result = confirm(message);
	
	if (result) {
		return true;
	} else {
		return false;
	}
}

function confirmSubmitPopup(message, frmName) {
	var result = confirm(message);
	
	if (result) {
		document.getElementById(frmName);
	} else {
		return false;
	}
}
