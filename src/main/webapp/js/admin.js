//공지글 페이지 <--> 작성페이지 
$(function(){
    $('.tab_btn:nth-of-type(1)').click(function(){
        $(this).addClass('active')
        $(this).siblings('span').removeClass('active')
        $('.tab_each').eq('0').css('display', 'block')
        $('.tab_each').eq('1').css('display', 'none')
    })

    $('.tab_btn:nth-of-type(2)').click(function(){
        $(this).addClass('active')
        $(this).siblings('span').removeClass('active')
        $('.tab_each').eq('0').css('display', 'none')
        $('.tab_each').eq('1').css('display', 'block')
    })

})