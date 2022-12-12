//닉네임 수정버튼 클릭시 이벤트-------------------------------------------------------
$(function(){
		   $('.btns-wrap__edit-btn').eq('0').click(function(){
	            if($('.modifying-section').eq('0').css('display') == 'none'){
	                $('.modifying-section').eq('0').css('display','block');
	                $('.pw_input__btns-wrap').eq('0').addClass('modifying')
	            }
	        })
	    })
$(function(){
		   $('.btns-wrap__cancel-btn').eq('0').click(function(){
		        if($('.modifying-section').eq('0').css('display') == 'block'){
		            $('.modifying-section').eq('0').css('display','none');
		            $('.pw_input__btns-wrap').eq('0').removeClass('modifying')
		        }
		    })
		})
		
//예약자 이름 수정버튼 클릭시 이벤트----------------------------------------------------
$(function(){
		   $('.btns-wrap__edit-btn').eq('1').click(function(){
	            if($('.modifying-section').eq('1').css('display') == 'none'){
	                $('.modifying-section').eq('1').css('display','block');
	                $('.pw_input__btns-wrap').eq('1').addClass('modifying')
	            }
	        })
	    })
$(function(){
		   $('.btns-wrap__cancel-btn').eq('1').click(function(){
		        if($('.modifying-section').eq('1').css('display') == 'block'){
		            $('.modifying-section').eq('1').css('display','none');
		            $('.pw_input__btns-wrap').eq('1').removeClass('modifying')
		        }
		    })
		})
		
//연락처 수정버튼 클릭시 이벤트--------------------------------------------------------
$(function(){
		   $('.btns-wrap__edit-btn').eq('2').click(function(){
	            if($('.modifying-section').eq('2').css('display') == 'none'){
	                $('.modifying-section').eq('2').css('display','block');
	                $('.pw_input__btns-wrap').eq('2').addClass('modifying')
	            }
	        })
	    })
$(function(){
		   $('.btns-wrap__cancel-btn').eq('2').click(function(){
		        if($('.modifying-section').eq('2').css('display') == 'block'){
		            $('.modifying-section').eq('2').css('display','none');
		            $('.pw_input__btns-wrap').eq('2').removeClass('modifying')
		        }
		    })
		})
//알림 체크박스----------------------------------------------------------------------
$(function(){
		   $('.allcheck').click(function(){
			if($('.allcheck').is(':checked')==true){
				$('.check').prop('checked',true)
			}else{
				$('.check').prop('checked',false)
			}
		})
	})
$(function(){
		   $('.check').click(function(){
			if($('.check').is(':checked')==true){
				$('.allcheck').prop('checked',true)
			}else{
				$('.allcheck').prop('checked',false)
			}
		})
	})
//알림 변경 버튼----------------------------------------------------------
$(function(){
		   $('.noti-confirm-button').click(function(){
			$('.refusal').html("수신거절 : 푸시 알림, 이메일, SMS");
			$('.agree').html("수신동의 : -");
			if($('#push').is(":checked") == true && $('#email').is(":checked") == false && $('#sms').is(":checked") == false){
				$('.refusal').html("수신거절 : 이메일, SMS");
				$('.agree').html('수신동의 : '+$('#push').val());
				}
			if($('#push').is(":checked") == false && $('#email').is(":checked") == true && $('#sms').is(":checked") == false){
				$('.refusal').html("수신거절 : 푸시 알림, SMS");
				$('.agree').html('수신동의 : '+$('#email').val());
				}
			if($('#push').is(":checked") == false && $('#email').is(":checked") == false && $('#sms').is(":checked") == true){
				$('.refusal').html("수신거절 : 푸시 알림, 이메일");
				$('.agree').html('수신동의 : '+$('#sms').val());
				}
			if($('#push').is(":checked") == true && $('#email').is(":checked") == true && $('#sms').is(":checked") == false){
				$('.refusal').html("수신거절 : SMS");
				$('.agree').html('수신동의 : '+$('#push').val() + ',' + $('#email').val());
				}
			if($('#push').is(":checked") == true && $('#email').is(":checked") == false && $('#sms').is(":checked") == true){
				$('.refusal').html("수신거절 : 이메일");
				$('.agree').html('수신동의 : '+$('#push').val() + ',' + $('#sms').val());
				}
			if($('#push').is(":checked") == false && $('#email').is(":checked") == true && $('#sms').is(":checked") == true){
				$('.refusal').html("수신거절 : 푸시 알림");
				$('.agree').html('수신동의 : '+$('#email').val() + ',' + $('#sms').val());
				}
			if($('#push').is(":checked") == true && $('#email').is(":checked") == true && $('#sms').is(":checked") == true){
				$('.refusal').html("수신거절 : -");
				$('.agree').html('수신동의 : '+$('#push').val()+','+$('#email').val() + ',' + $('#sms').val());
				}
			if($('.notimsg').css('display') == 'none'){
				$('.notimsg').css('display','block')
			}
		})
	})
	$(function(){
		   $('.close_notimsg').click(function(){
			if($('.notimsg').css('display') == 'block'){
				$('.notimsg').css('display','none')
			}
		})
	})
//포인트 페이지
$(function(){
		   $('.btn-capsule'+'.btn-capsule--solid').click(function(){
			 $('.btn-capsule'+'.btn-capsule--selected').attr("class","btn-capsule btn-capsule--solid");
			 $(this).attr("class","btn-capsule btn-capsule--selected");
		})
	})
	$(function(){
		   $('.icon-info').click(function(){
			if($('.point_info').css('display') == 'none'){
				$('.point_info').css('display','block')
			}
		})
	})
$(function(){
		   $('.point_info_close').click(function(){
			if($('.point_info').css('display') == 'block'){
				$('.point_info').css('display','none')
			}
		})
	})
//랜덤 닉네임
function changeNickname(){
	const strArray = ['이제', '그만', '하고', '싶다', '제발'];
	const randomValue = strArray[Math.floor(Math.random() * strArray.length)];
	document.getElementById('changerandom').value = randomValue

}
function randomnick(){
	const strArray = ['이제', '그만', '하고', '싶다', '제발'];
	const randomValue = strArray[Math.floor(Math.random() * strArray.length)];
	document.getElementById('nick_input').value = randomValue

}