/**
 * 
 */
var confirm=false;
 function keyup(){
	mobileNumber=document.getElementById('mobilePhone');
	phone_check=document.getElementById('phone_check');
	mobileNumber.value=mobileNumber.value.replace(/[^0-9]/g,'');
	var regExp = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/
	if(regExp.test(mobileNumber.value)&&mobileNumber.value.length==11){
		console.log("here");
		phone_check.disabled=false;
	}else phone_check.disabled=true;
			confirm=false;
	
}

function sendNum(){
	phone_check=document.getElementById('phone_check');
	confirmNumber=document.getElementById('confirmNumber');
	confirmNumberButton=document.getElementById('confirmNumberButton');
	confirmphonebox=document.getElementById('confirmphonebox');
	if(confirm==false){
		confirm=true;
		phone_check.value="재전송";
		confirmphonebox.style.display="block";
		
	}
}
connum_check=false;
function conkeyup(){
	connum=false;
	confirmNumber=document.getElementById('confirmNumber');
	confirmNumberButton=document.getElementById('confirmNumberButton');
	confirmNumber.value=confirmNumber.value.replace(/[^0-9]/g,'');
	var regExp = /^[0-9]{4}$/
	if(regExp.test(confirmNumber.value)&&confirmNumber.value.length==4){
		confirmNumberButton.disabled=false;
		
	}else confirmNumberButton.disabled=true;
}
function connum1(){
	confirmNumber=document.getElementById('confirmNumber');
	confirmNumberButton=document.getElementById('confirmNumberButton');
	mobilebutton=document.getElementById('mobilebutton');
	
	if(confirmNumber.value=="1234"){
		connum_check=true;
		
	}else{
		alert("인증번호가 틀렸습니다");
	}
	if(confirm==true&&connum_check==true){
		mobilebutton.style.display="block";
		mobilebutton.disabled=false;
	}else{
		alert("인증을 다시 해 주세");
	}
}