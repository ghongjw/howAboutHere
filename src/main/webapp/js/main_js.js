	function listblock(){
		const list = document.getElementById('list');
		const memberlist = document.getElementById('memberlist');
		list.style.display = 'block';
		if(memberlist.style.display === 'block'){
		memberlist.style.display= 'none';
		}
		//마우스가 더보기버튼에 올라갔을때 list를 보이게 변경
	}
		
	function memberlistblock(){
		const list = document.getElementById('list');
		const memberlist= document.getElementById('memberlist');
		memberlist.style.display = 'block';
		if(list.style.display === 'block'){
		list.style.display= 'none';
		}
		//마우스가 content에 갔을때 memberlist를 보이게 변경
	}
	function listnone(){
		//마우스가 content에 갔을때 memberlist 와 list를 숨김
		const list = document.getElementById('list');
		const memberlist = document.getElementById('memberlist');
		if(list.style.display === 'block'){
		list.style.display= 'none';
			if(memberlist.style.display === 'block'){
				memberlist.style.display= 'none';
			}
		}
		else if(memberlist.style.display === 'block'){
		memberlist.style.display= 'none';
		}
		
	}
	function proc(){
		//돋보기 에니메이트
		$(function(){
         var search1 = $('#search1')
         var search2 = $('#search2')
         var search3 = $('#search3')
         var btn_srch = $('#btn_srch')
         
         btn_srch.animate({
            right: '800px'
         },800)
         if( search1.css('display') == 'none' ){
            
         } else {
            search1.fadeOut(400)
            search2.fadeIn(800)
            search3.fadeIn(800)
         }
      })
	}
	function srch_close(){
		$(function(){
         var search1 = $('#search1')
         var search2 = $('#search2')
         var search3 = $('#search3')
         var btn_srch = $('#btn_srch')
         
         btn_srch.animate({
            right: '396px'
         },800)
         if( search1.css('display') != 'none' ){
            
         } else {
            search1.fadeIn(400)
            search2.fadeOut(200)
            search3.fadeOut(200)
         }
      })
	}
	
	