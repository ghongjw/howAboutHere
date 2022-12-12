/**
 * 
 */
$(document).ready(function() {

});
$(function() {
	$('input[name="datefilter"]').daterangepicker({
		locale: {
			"separator": " ~ ",
			"format": 'MM.DD',
			"applyLabel": "선택완료",
			"cancelLabel": "취소",
			"daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
			"monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
		},
		"autoapply": false,
		"linkedCalendars": false,
		"showCustomRangeLabel": false,
		"minDate": new Date(),
		"autoUpdateInput" : true,

	},
		function(start, end, label) {
			$('#displayregervation').val("."+end.diff(start, "days")+"박");
			$('#diff').val(end.diff(start, "days"));
		});
	$('.drp-calendar.right').hide();
	$('.drp-calendar.left').addClass('single');


	$('.calendar-table').on('DOMSubtreeModified', function() {
		var el = $(".prev.available").parent().children().last();
		if (el.hasClass('next available')) {
			return;
		}
		el.addClass('next available');
		el.append('<span></span>');
	});

});




