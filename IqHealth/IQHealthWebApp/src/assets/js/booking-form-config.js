"use strict"; // Start of use strict


if ($('.appointment-form .select-date').length) {

	// trigger datepicker
	$('.appointment-form .select-date-input').datepicker();

	// trigger for div
	$('.frm-control.select-date .fa-calendar-alt').on('click', function () {
		$('.appointment-form .select-date-input').datepicker('show');
	});
}