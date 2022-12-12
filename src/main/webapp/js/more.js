function ntcont(){
		const ntcont = document.getElementById('ntcont');
		if(ntcont.style.display == 'none'){
			ntcont.style.display = 'block';
		}else{
			ntcont.style.display = 'none';
		}
		
	}
//----------------------------약관 및 정책 페이지
$(function(){
        $('.term-accordion-title').click(function(){
            if($(this).siblings('div').hasClass('open') == true){
                $(this).siblings('div').removeClass('open')
            } else {
                $(this).siblings('div').addClass('open')
            }
        })
    })
//----------------------------1:1 문의 페이지 나의 문의 내역body <--> 새문의 작성body
$(function(){
    $('.inquiry .tab_btn:nth-of-type(1)').click(function(){
        $(this).addClass('active')
        $(this).siblings('span').removeClass('active')
        $('.tab_each').eq('0').css('display', 'block')
        $('.tab_each').eq('1').css('display', 'none')
    })

    $('.inquiry .tab_btn:nth-of-type(2)').click(function(){
        $(this).addClass('active')
        $(this).siblings('span').removeClass('active')
        $('.tab_each').eq('0').css('display', 'none')
        $('.tab_each').eq('1').css('display', 'block')
    })

})
//-------------------------1:1 문의 리스트가 잇을때 문의 title클릭
	$(function(){
		   $('.list_que').click(function(){
	            if($(this).hasClass('open') == true){
	                $(this).removeClass('open')
	                $(this).siblings('div').css('display','none')
	            } else {
	                $(this).addClass('open')
	                 $(this).siblings('div').css('display','block')
	            }
	        })
	    })

//----------------------------자주묻는 질문 페이지
$(function(){
        $('.link').click(function(){
            if($(this).siblings('div').hasClass('on') == true){
                $(this).siblings('div').removeClass('on')
            } else {
                $(this).siblings('div').addClass('on')
            }
        })
    })

