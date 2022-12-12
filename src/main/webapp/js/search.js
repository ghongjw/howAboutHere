/**
 * 
 */
function listPop() {
	area_list = document.getElementById("area_list");

	$("#area_list").fadeIn(100);
}
function listhold() {
	area_list = document.getElementById("area_list");
	$("#area_list").fadeOut(100);
}
function display(a) {
	const city_child = [];

	for (i = 1; i < 17; i++) {
		b = "city_child" + i
		console.log(b);
		city_child[i] = document.getElementById(b);
		if (i == a) {
			city_child[i].style.display = "block";
		} else city_child[i].style.display = "none";
	}
}
function city1() {
	display(1);
}
function city2() {
	display(2);
}
function city3() {
	display(3);
}
function city4() {
	display(4);
}
function city5() {
	display(5);
}
function city6() {
	display(6);
}
function city7() {
	display(7);
}
function city8() {
	display(8);
}
function city9() {
	display(9);
}
function city10() {
	display(10);
}
function city11() {
	display(11);
}
function city12() {
	display(12);
}
function city13() {
	display(13);
}
function city14() {
	display(14);
}
function city15() {
	display(15);
}
function city16() {
	display(16);
}
function cf_pop() {
	pop = document.getElementById('cfPopup');
	$("#cfPopup").fadeIn(100).delay(1000).fadeOut(100);
}
function all_reset() {
	timeRoom = document.getElementById('timeRoom');
	sleepRoom = document.getElementById('sleepRoom');
	discount = document.getElementById('discount');

	t1 = document.getElementById('t1');
	t2 = document.getElementById('t2');
	t3 = document.getElementById('t3');
	t4 = document.getElementById('t4');
	t5 = document.getElementById('t5');
	t6 = document.getElementById('t6');
	t7 = document.getElementById('t7');
	t8 = document.getElementById('t8');
	t9 = document.getElementById('t9');
	t10 = document.getElementById('t10');

	s1 = document.getElementById('s1');
	s2 = document.getElementById('s2');
	s3 = document.getElementById('s3');
	s4 = document.getElementById('s4');
	s5 = document.getElementById('s5');
	s6 = document.getElementById('s6');
	s7 = document.getElementById('s7');

	p1 = document.getElementById('p1');
	p2 = document.getElementById('p2');
	p3 = document.getElementById('p3');
	p4 = document.getElementById('p4');
	p5 = document.getElementById('p5');
	p6 = document.getElementById('p6');
	p7 = document.getElementById('p7');
	p8 = document.getElementById('p8');
	p9 = document.getElementById('p9');

	b1 = document.getElementById('b1');
	b2 = document.getElementById('b2');
	b3 = document.getElementById('b3');

	min_price = document.getElementById('min_price');
	max_price = document.getElementById('max_price');


	timeRoom.checked = false;
	sleepRoom.checked = false;
	discount.checked = false;

	t1.checked = false;
	t2.checked = false;
	t3.checked = false;
	t4.checked = false;
	t5.checked = false;
	t6.checked = false;
	t7.checked = false;
	t8.checked = false;
	t9.checked = false;
	t10.checked = false;

	s1.checked = false;
	s2.checked = false;
	s3.checked = false;
	s4.checked = false;
	s5.checked = false;
	s6.checked = false;
	s7.checked = false;

	p1.checked = false;
	p2.checked = false;
	p3.checked = false;
	p4.checked = false;
	p5.checked = false;
	p6.checked = false;
	p7.checked = false;
	p8.checked = false;
	p9.checked = false;

	b1.checked = false;
	b2.checked = false;
	b3.checked = false;

	min_price.value = "10000";
	max_price.value = "300000";
}
function all_reset_hf() {
	available = document.getElementById('available');
	promotion = document.getElementById('promotion');
	type1 = document.getElementById('type1');
	type2 = document.getElementById('type2');
	type3 = document.getElementById('type3');
	bed1 = document.getElementById('bed1');
	bed2 = document.getElementById('bed2');
	bed3 = document.getElementById('bed3');
	bed4 = document.getElementById('bed4');
	c1 = document.getElementById('c1');
	c2 = document.getElementById('c2');
	c3 = document.getElementById('c3');
	c4 = document.getElementById('c4');
	c5 = document.getElementById('c5');
	c6 = document.getElementById('c6');
	c7 = document.getElementById('c7');
	c8 = document.getElementById('c8');
	c9 = document.getElementById('c9');
	c10 = document.getElementById('c10');
	c11 = document.getElementById('c11');
	c12 = document.getElementById('c12');
	c13 = document.getElementById('c13');
	c14 = document.getElementById('c14');
	c15 = document.getElementById('c15');
	c16 = document.getElementById('c16');
	c17 = document.getElementById('c17');
	c18 = document.getElementById('c18');
	c19 = document.getElementById('c19');
	c20 = document.getElementById('c20');
	c21 = document.getElementById('c21');
	c22 = document.getElementById('c22');
	c23 = document.getElementById('c23');
	c24 = document.getElementById('c24');

	fac1 = document.getElementById('fac1');
	fac2 = document.getElementById('fac2');
	fac3 = document.getElementById('fac3');
	fac4 = document.getElementById('fac4');
	fac5 = document.getElementById('fac5');
	fac6 = document.getElementById('fac6');
	fac7 = document.getElementById('fac7');
	fac8 = document.getElementById('fac8');
	fac9 = document.getElementById('fac9');
	fac10 = document.getElementById('fac10');
	fac11 = document.getElementById('fac11');
	fac12 = document.getElementById('fac12');

	ex1 = document.getElementById('ex1');
	ex2 = document.getElementById('ex2');
	ex3 = document.getElementById('ex3');
	ex4 = document.getElementById('ex4');
	ex5 = document.getElementById('ex5');
	ex6 = document.getElementById('ex6');
	ex7 = document.getElementById('ex7');
	ex8 = document.getElementById('ex8');
	ex9 = document.getElementById('ex9');
	ex10 = document.getElementById('ex10');
	ex11 = document.getElementById('ex11');
	ex12 = document.getElementById('ex12');
	ex13 = document.getElementById('ex13');
	ex14 = document.getElementById('ex14');

	available.checked = false;
	promotion.checked = false;
	type1.checked = false;
	type2.checked = false;
	type3.checked = false;

	bed1.checked = false;
	bed2.checked = false;
	bed3.checked = false;
	bed4.checked = false;

	c1.checked = false;
	c2.checked = false;
	c3.checked = false;
	c4.checked = false;
	c5.checked = false;
	c6.checked = false;
	c7.checked = false;
	c8.checked = false;
	c9.checked = false;
	c10.checked = false;
	c11.checked = false;
	c12.checked = false;
	c13.checked = false;
	c14.checked = false;
	c15.checked = false;
	c16.checked = false;
	c17.checked = false;
	c18.checked = false;
	c19.checked = false;
	c21.checked = false;
	c22.checked = false;
	c23.checked = false;
	c24.checked = false;

	fac1.checked = false;
	fac2.checked = false;
	fac3.checked = false;
	fac4.checked = false;
	fac5.checked = false;
	fac6.checked = false;
	fac7.checked = false;
	fac8.checked = false;
	fac9.checked = false;
	fac10.checked = false;
	fac11.checked = false;
	fac12.checked = false;
	fac13.checked = false;

	ex1.checked = false;
	ex2.checked = false;
	ex3.checked = false;
	ex4.checked = false;
	ex5.checked = false;
	ex6.checked = false;
	ex7.checked = false;
	ex8.checked = false;
	ex9.checked = false;
	ex10.checked = false;
	ex11.checked = false;
	ex12.checked = false;
	ex13.checked = false;
	ex14.checked = false;
}
function all_reset_pf() {
	Pen_available = document.getElementById('Pen_available');
	Pen_type1 = document.getElementById('Pen_type1');
	Pen_type2 = document.getElementById('Pen_type2');
	Pen_type3 = document.getElementById('Pen_type3');

	Pen_c1 = document.getElementById('Pen_c1');
	Pen_c2 = document.getElementById('Pen_c2');
	Pen_c3 = document.getElementById('Pen_c3');
	Pen_c4 = document.getElementById('Pen_c4');
	Pen_c5 = document.getElementById('Pen_c5');
	Pen_c6 = document.getElementById('Pen_c6');
	Pen_c7 = document.getElementById('Pen_c7');
	Pen_c8 = document.getElementById('Pen_c8');
	Pen_c9 = document.getElementById('Pen_c9');
	Pen_c10 = document.getElementById('Pen_c10');
	Pen_c11 = document.getElementById('Pen_c11');
	Pen_c12 = document.getElementById('Pen_c12');
	Pen_c13 = document.getElementById('Pen_c13');
	Pen_c14 = document.getElementById('Pen_c14');
	Pen_c15 = document.getElementById('Pen_c15');
	Pen_c16 = document.getElementById('Pen_c16');
	Pen_c17 = document.getElementById('Pen_c17');
	Pen_c18 = document.getElementById('Pen_c18');
	Pen_c19 = document.getElementById('Pen_c19');
	Pen_c20 = document.getElementById('Pen_c20');
	Pen_c21 = document.getElementById('Pen_c21');
	Pen_c22 = document.getElementById('Pen_c22');
	Pen_c23 = document.getElementById('Pen_c23');
	Pen_c24 = document.getElementById('Pen_c24');

	Pen_fac1 = document.getElementById('Pen_fac1');
	Pen_fac2 = document.getElementById('Pen_fac2');
	Pen_fac3 = document.getElementById('Pen_fac3');
	Pen_fac4 = document.getElementById('Pen_fac4');
	Pen_fac5 = document.getElementById('Pen_fac5');
	Pen_fac6 = document.getElementById('Pen_fac6');
	Pen_fac7 = document.getElementById('Pen_fac7');
	Pen_fac8 = document.getElementById('Pen_fac8');
	Pen_fac9 = document.getElementById('Pen_fac9');
	Pen_fac10 = document.getElementById('Pen_fac10');
	Pen_fac11 = document.getElementById('Pen_fac11');
	Pen_fac12 = document.getElementById('Pen_fac12');
	Pen_fac13 = document.getElementById('Pen_fac13');

	Pen_ex1 = document.getElementById('Pen_ex1');
	Pen_ex2 = document.getElementById('Pen_ex2');
	Pen_ex3 = document.getElementById('Pen_ex3');
	Pen_ex4 = document.getElementById('Pen_ex4');
	Pen_ex5 = document.getElementById('Pen_ex5');
	Pen_ex6 = document.getElementById('Pen_ex6');
	Pen_ex7 = document.getElementById('Pen_ex7');
	Pen_ex8 = document.getElementById('Pen_ex8');
	Pen_ex9 = document.getElementById('Pen_ex9');
	Pen_ex10 = document.getElementById('Pen_ex10');
	Pen_ex11 = document.getElementById('Pen_ex11');
	Pen_ex12 = document.getElementById('Pen_ex12');
	Pen_ex13 = document.getElementById('Pen_ex13');
	Pen_ex14 = document.getElementById('Pen_ex14');

	Pen_available.checked = false;
	Pen_type1.checked = false;
	Pen_type2.checked = false;
	Pen_type3.checked = false;

	Pen_c1.checked = false;
	Pen_c2.checked = false;
	Pen_c3.checked = false;
	Pen_c4.checked = false;
	Pen_c5.checked = false;
	Pen_c6.checked = false;
	Pen_c7.checked = false;
	Pen_c8.checked = false;
	Pen_c9.checked = false;
	Pen_c10.checked = false;
	Pen_c11.checked = false;
	Pen_c12.checked = false;
	Pen_c13.checked = false;
	Pen_c14.checked = false;
	Pen_c15.checked = false;
	Pen_c16.checked = false;
	Pen_c17.checked = false;
	Pen_c18.checked = false;
	Pen_c19.checked = false;
	Pen_c20.checked = false;
	Pen_c21.checked = false;
	Pen_c22.checked = false;
	Pen_c23.checked = false;
	Pen_c24.checked = false;

	Pen_fac1.checked = false;
	Pen_fac2.checked = false;
	Pen_fac3.checked = false;
	Pen_fac4.checked = false;
	Pen_fac5.checked = false;
	Pen_fac6.checked = false;
	Pen_fac7.checked = false;
	Pen_fac8.checked = false;
	Pen_fac9.checked = false;
	Pen_fac10.checked = false;
	Pen_fac11.checked = false;
	Pen_fac12.checked = false;
	Pen_fac13.checked = false;

	Pen_ex1.checked = false;
	Pen_ex2.checked = false;
	Pen_ex3.checked = false;
	Pen_ex4.checked = false;
	Pen_ex5.checked = false;
	Pen_ex6.checked = false;
	Pen_ex7.checked = false;
	Pen_ex8.checked = false;
	Pen_ex9.checked = false;
	Pen_ex10.checked = false;
	Pen_ex11.checked = false;
	Pen_ex12.checked = false;
	Pen_ex13.checked = false;
	Pen_ex14.checked = false;

}
function all_reset_gf() {
	Gu_available = document.getElementById('Gu_available');
	Gu_promotion = document.getElementById('Gu_promotion');
	
	Gu_bed1 = document.getElementById('Gu_bed1');
	Gu_bed2 = document.getElementById('Gu_bed2');
	Gu_bed3 = document.getElementById('Gu_bed3');
	Gu_bed4 = document.getElementById('Gu_bed4');
	
	Gu_c1 = document.getElementById('Gu_c1');
	Gu_c2 = document.getElementById('Gu_c2');
	Gu_c3 = document.getElementById('Gu_c3');
	Gu_c4 = document.getElementById('Gu_c4');
	Gu_c5 = document.getElementById('Gu_c5');
	Gu_c6 = document.getElementById('Gu_c6');
	Gu_c7 = document.getElementById('Gu_c7');
	Gu_c8 = document.getElementById('Gu_c8');
	Gu_c9 = document.getElementById('Gu_c9');
	Gu_c10 = document.getElementById('Gu_c10');
	Gu_c11 = document.getElementById('Gu_c11');
	Gu_c12 = document.getElementById('Gu_c12');

	Gu_fac1 = document.getElementById('Gu_fac1');
	Gu_fac2 = document.getElementById('Gu_fac2');
	Gu_fac3 = document.getElementById('Gu_fac3');
	Gu_fac4 = document.getElementById('Gu_fac4');
	Gu_fac5 = document.getElementById('Gu_fac5');
	Gu_fac6 = document.getElementById('Gu_fac6');
	Gu_fac7 = document.getElementById('Gu_fac7');
	Gu_fac8 = document.getElementById('Gu_fac8');
	Gu_fac9 = document.getElementById('Gu_fac9');
	Gu_fac10 = document.getElementById('Gu_fac10');

	Gu_ex1 = document.getElementById('Gu_ex1');
	Gu_ex2 = document.getElementById('Gu_ex2');
	Gu_ex3 = document.getElementById('Gu_ex3');
	Gu_ex4 = document.getElementById('Gu_ex4');
	Gu_ex5 = document.getElementById('Gu_ex5');
	Gu_ex6 = document.getElementById('Gu_ex6');
	Gu_ex7 = document.getElementById('Gu_ex7');
	Gu_ex8 = document.getElementById('Gu_ex8');
	

	Gu_available.checked = false;
	Gu_promotion.checked = false;


	Gu_bed1.checked = false;
	Gu_bed2.checked = false;
	Gu_bed3.checked = false;
	Gu_bed4.checked = false;

	Gu_c1.checked = false;
	Gu_c2.checked = false;
	Gu_c3.checked = false;
	Gu_c4.checked = false;
	Gu_c5.checked = false;
	Gu_c6.checked = false;
	Gu_c7.checked = false;
	Gu_c8.checked = false;
	Gu_c9.checked = false;
	Gu_c10.checked = false;
	Gu_c11.checked = false;
	Gu_c12.checked = false;

	Gu_fac1.checked = false;
	Gu_fac2.checked = false;
	Gu_fac3.checked = false;
	Gu_fac4.checked = false;
	Gu_fac5.checked = false;
	Gu_fac6.checked = false;
	Gu_fac7.checked = false;
	Gu_fac8.checked = false;
	Gu_fac9.checked = false;
	Gu_fac10.checked = false;

	Gu_ex1.checked = false;
	Gu_ex2.checked = false;
	Gu_ex3.checked = false;
	Gu_ex4.checked = false;
	Gu_ex5.checked = false;
	Gu_ex6.checked = false;
	Gu_ex7.checked = false;
	Gu_ex8.checked = false;

}
function count(type) {
	// 결과를 표시할 element
	const resultElement = document.getElementById('result');
	const result = document.getElementById('resultid');

	// 현재 화면에 표시된 값
	let number = resultElement.innerText;

	// 더하기/빼기
	if (type === 'plus') {
		if (number < 10) {
			number = parseInt(number) + 1;
		}
	} else if (type === 'minus') {
		if (number > 2) {
			number = parseInt(number) - 1;
		}
	}

	// 결과 출력
	resultElement.innerText = number;
	result.value = number;
}
function all_reset_cf() {
	Cam_available = document.getElementById('Cam_available');
	
	Cam_type1 = document.getElementById('Cam_type1');
	Cam_type2 = document.getElementById('Cam_type2');
	Cam_type3 = document.getElementById('Cam_type3');

	Cam_c1 = document.getElementById('Cam_c1');
	Cam_c2 = document.getElementById('Cam_c2');
	Cam_c3 = document.getElementById('Cam_c3');
	Cam_c4 = document.getElementById('Cam_c4');
	Cam_c5 = document.getElementById('Cam_c5');
	Cam_c6 = document.getElementById('Cam_c6');
	Cam_c7 = document.getElementById('Cam_c7');
	Cam_c8 = document.getElementById('Cam_c8');
	Cam_c9 = document.getElementById('Cam_c9');
	Cam_c10 = document.getElementById('Cam_c10');
	Cam_c11 = document.getElementById('Cam_c11');
	Cam_c12 = document.getElementById('Cam_c12');
	Cam_c13 = document.getElementById('Cam_c13');
	Cam_c14 = document.getElementById('Cam_c14');
	Cam_c15 = document.getElementById('Cam_c15');
	Cam_c16 = document.getElementById('Cam_c16');
	Cam_c17 = document.getElementById('Cam_c17');
	Cam_c18 = document.getElementById('Cam_c18');
	Cam_c19 = document.getElementById('Cam_c19');
	Cam_c20 = document.getElementById('Cam_c20');
	
	Cam_fac1 = document.getElementById('Cam_fac1');
	Cam_fac2 = document.getElementById('Cam_fac2');
	Cam_fac3 = document.getElementById('Cam_fac3');
	Cam_fac4 = document.getElementById('Cam_fac4');
	Cam_fac5 = document.getElementById('Cam_fac5');
	Cam_fac6 = document.getElementById('Cam_fac6');
	Cam_fac7 = document.getElementById('Cam_fac7');
	Cam_fac8 = document.getElementById('Cam_fac8');
	Cam_fac9 = document.getElementById('Cam_fac9');
	Cam_fac10 = document.getElementById('Cam_fac10');
	Cam_fac11 = document.getElementById('Cam_fac11');
	Cam_fac12 = document.getElementById('Cam_fac12');
	Cam_fac13 = document.getElementById('Cam_fac13');

	Cam_ex1 = document.getElementById('Cam_ex1');
	Cam_ex2 = document.getElementById('Cam_ex2');
	Cam_ex3 = document.getElementById('Cam_ex3');
	Cam_ex4 = document.getElementById('Cam_ex4');
	Cam_ex5 = document.getElementById('Cam_ex5');
	Cam_ex6 = document.getElementById('Cam_ex6');
	Cam_ex7 = document.getElementById('Cam_ex7');
	Cam_ex8 = document.getElementById('Cam_ex8');
	Cam_ex9 = document.getElementById('Cam_ex9');
	Cam_ex10 = document.getElementById('Cam_ex10');
	Cam_ex11 = document.getElementById('Cam_ex11');

	Cam_available.checked = false;
	
	Cam_type1.checked = false;
	Cam_type2.checked = false;
	Cam_type3.checked = false;

	Cam_c1.checked = false;
	Cam_c2.checked = false;
	Cam_c3.checked = false;
	Cam_c4.checked = false;
	Cam_c5.checked = false;
	Cam_c6.checked = false;
	Cam_c7.checked = false;
	Cam_c8.checked = false;
	Cam_c9.checked = false;
	Cam_c10.checked = false;
	Cam_c11.checked = false;
	Cam_c12.checked = false;
	Cam_c13.checked = false;
	Cam_c14.checked = false;
	Cam_c15.checked = false;
	Cam_c16.checked = false;
	Cam_c17.checked = false;
	Cam_c18.checked = false;
	Cam_c19.checked = false;
	Cam_c20.checked = false;

	Cam_fac1.checked = false;
	Cam_fac2.checked = false;
	Cam_fac3.checked = false;
	Cam_fac4.checked = false;
	Cam_fac5.checked = false;
	Cam_fac6.checked = false;
	Cam_fac7.checked = false;
	Cam_fac8.checked = false;
	Cam_fac9.checked = false;
	Cam_fac10.checked = false;
	Cam_fac11.checked = false;
	Cam_fac12.checked = false;
	Cam_fac13.checked = false;

	Cam_ex1.checked = false;
	Cam_ex2.checked = false;
	Cam_ex3.checked = false;
	Cam_ex4.checked = false;
	Cam_ex5.checked = false;
	Cam_ex6.checked = false;
	Cam_ex7.checked = false;
	Cam_ex8.checked = false;
	Cam_ex9.checked = false;
	Cam_ex10.checked = false;
	Cam_ex11.checked = false;

}











