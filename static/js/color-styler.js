var primary, palette;
$(document).ready(function(){

	// select source image
	var sourceImage = document.querySelector('img[id="src-image"]');

	// init color theif
	var colorThief = new ColorThief();

	// get primary color
	primary = colorThief.getColor(sourceImage, 3);

	// generate color palette
	palette = colorThief.getPalette(sourceImage, 2, 3);

	// simple helper, converts return color array to css rgb value
	function toRGB(c) {
		return 'rgb('+c[0]+','+c[1]+','+c[2]+')';
	}

	function toDarkerRGB(c) {
		return 'rgb('+(c[0]-5)+','+(c[1]-5)+','+(c[2]-5)+')';
	}

	// set background, text, and button colors based on palette
	$('body').css('background-color', toRGB(palette[0]));
	$('button[id="dynamic-btn"]')
		.css('background-color', toRGB(palette[2]))
		.css('border-color', toDarkerRGB(palette[2]));
	var text = $('.styler');
	if(text.length !== 0) {
		text.css('color', toRGB(palette[2]));
		text.hover(function(){
			$(this).css('color', toDarkerRGB(palette[0]));
		}, function(){
			$(this).css('color', toRGB(palette[2]));
		});
	}

	/**
	 * 	Sample Color Palette
	 *
	 *	<div id="color-palette" class="col-lg-6 col-lg-offset-3">
	 *		<p class="text-center">Color Palette</p>
	 *		<div id="color-palette-0" class="col-lg-4" style="border:1px solid #777;height:50px;"></div>
	 *		<div id="color-palette-1" class="col-lg-4" style="border:1px solid #777;height:50px;"></div>
	 *		<div id="color-palette-2" class="col-lg-4" style="border:1px solid #777;height:50px;"></div>
	 *	</div>
	 *
	 *	...
	 *
	 * 	$('div[id="color-palette-0"]').css('background-color', toRGB(palette[0]));
	 *	$('div[id="color-palette-1"]').css('background-color', toRGB(palette[1]));
	 *	$('div[id="color-palette-2"]').css('background-color', toRGB(palette[2]));
	 *
	 */

});
