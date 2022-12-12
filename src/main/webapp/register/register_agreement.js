function checked() {
	checkall = document.getElementById('checkAll');
	checkagree1 = document.getElementById('checkagree1');
	checkagree2 = document.getElementById('checkagree2');
	checkagree3 = document.getElementById('checkagree3');
	checkagree4 = document.getElementById('checkagree4');
	checkagree5 = document.getElementById('checkagree5');
	checkagree6 = document.getElementById('checkagree6');
	console.log("here");
	if (checkall.checked) {
		checkall.checked = false;
		checkagree1.checked = false;
		checkagree2.checked = false;
		checkagree3.checked = false;
		checkagree4.checked = false;
		checkagree5.checked = false;
		checkagree6.checked = false;

	} else {
		checkall.checked = true;
		checkagree1.checked = true;
		checkagree2.checked = true;
		checkagree3.checked = true;
		checkagree4.checked = true;
		checkagree5.checked = true;
		checkagree6.checked = true;
	}
	if (checkagree1.checked && checkagree2.checked && checkagree3.checked) {
		login_button.disabled = false;
	} else login_button.disabled = true;
}
function checked1() {
	checkagree1 = document.getElementById('checkagree1');
	checkagree2 = document.getElementById('checkagree2');
	checkagree3 = document.getElementById('checkagree3');
	login_button = document.getElementById('login_button');
	console.log("here");
	if (checkagree1.checked) {
		checkagree1.checked = false;
	} else checkagree1.checked = true;
	if (checkagree1.checked && checkagree2.checked && checkagree3.checked) {
		login_button.disabled = false;
	} else login_button.disabled = true;


}
function checked2() {
	checkagree1 = document.getElementById('checkagree1');
	checkagree2 = document.getElementById('checkagree2');
	checkagree3 = document.getElementById('checkagree3');
	login_button = document.getElementById('login_button');
	if (checkagree2.checked) {
		checkagree2.checked = false;
	} else checkagree2.checked = true;
	if (checkagree1.checked && checkagree2.checked && checkagree3.checked) {
		login_button.disabled = false;
	} else login_button.disabled = true;
}
function checked3() {
	checkagree1 = document.getElementById('checkagree1');
	checkagree2 = document.getElementById('checkagree2');
	checkagree3 = document.getElementById('checkagree3');
	login_button = document.getElementById('login_button');
	if (checkagree3.checked) {
		checkagree3.checked = false;
	} else checkagree3.checked = true;
	if (checkagree1.checked && checkagree2.checked && checkagree3.checked) {
		login_button.disabled = false;
	} else login_button.disabled = true;
}
function checked4() {
	checkagree4 = document.getElementById('checkagree4');
	if (checkagree4.checked) {
		checkagree4.checked = false;
	} else checkagree4.checked = true;
}
function checked5() {
	checkagree5 = document.getElementById('checkagree5');
	if (checkagree5.checked) {
		checkagree5.checked = false;
	} else checkagree5.checked = true;
}
function checked6() {
	checkagree6 = document.getElementById('checkagree6');
	if (checkagree6.checked) {
		checkagree6.checked = false;
	} else checkagree6.checked = true;
}