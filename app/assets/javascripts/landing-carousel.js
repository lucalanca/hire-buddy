$(function() {
	$('.carousel').unslider({
		speed: 800,               //  The speed to animate each slide (in milliseconds)
		delay: 6000,              //  The delay between slide animations (in milliseconds)
		complete: function() {},  //  A function that gets called after every slide animation
		keys: true,               //  Enable keyboard (left, right) arrow shortcuts
		dots: true,               //  Display dot navigation
		fluid: true              //  Support responsive design. May break non-responsive designs
	});
});