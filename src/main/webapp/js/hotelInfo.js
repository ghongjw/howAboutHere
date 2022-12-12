/**
 * 
 */
function reservationPage(){
	reservations = document.getElementById('reservations');
	reservations.style.display="block";
	informations = document.getElementById('informations');
	informations.style.display="none";
	reviewsA = document.getElementById('reviewsA');
	reviewsA.style.display="none";
	
}
function lodgeInfo(){
	reservations = document.getElementById('reservations');
	reservations.style.display="none";
	informations = document.getElementById('informations');
	informations.style.display="block";
	reviewsA = document.getElementById('reviewsA');
	reviewsA.style.display="none";
	
}
function reviewset(){
	reservations = document.getElementById('reservations');
	reservations.style.display="none";
	informations = document.getElementById('informations');
	informations.style.display="none";
	reviewsA = document.getElementById('reviewsA');
	reviewsA.style.display="block";
	
}
function image_click0(){
	main_image=document.getElementById('main_image');
	sub_image0=document.getElementById('sub_image0');
	main_image.src=sub_image0.src;
}
function image_click1(){
	main_image=document.getElementById('main_image');
	sub_image1=document.getElementById('sub_image1');
	main_image.src=sub_image1.src;
}
function image_click2(){
	main_image=document.getElementById('main_image');
	sub_image2=document.getElementById('sub_image2');
	main_image.src=sub_image2.src;
}
function image_click3(){
	main_image=document.getElementById('main_image');
	sub_image3=document.getElementById('sub_image3');
	main_image.src=sub_image3.src;
}




