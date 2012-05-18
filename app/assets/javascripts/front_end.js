function vertAlign(pImg) {
	var lHeight = pImg.clientHeight;
	var lParentHeight = pImg.parentNode.clientHeight;
	pImg.style.marginTop = (lParentHeight - lHeight)/2 + "px"; }