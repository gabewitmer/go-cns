function readyData() {
	var submitData = {
		id: id,
		data: JSON.stringify(inputTools.getJSON())
	};
	var csrf = $('input#csrf');
	submitData[csrf.attr('name')] = csrf.val();
	return submitData;
}

function send(url) {
	var header = {};
	header[$("meta[name='_csrf_header']").attr("content")] = $("meta[name='_csrf']").attr("content");
	$.ajax({
		contentType: 'application/json',
		headers: header,
		url: url,
		data: JSON.stringify(readyData()),
		method: 'POST',
		success: function(data) {
			console.log(data);
			window.location.href = data.redirect;
		},
		error: function(data) {
			console.log(data);
		}
	});
}

$(document).ready(function() {

	function requiredIsValid() {
		var re = /[a-zA-Z0-9].+/;
		var inputs = document.querySelectorAll(inputTools.inputTypes.join(', '));
		for (var i = 0; i < inputs.length; i++) {
			if (inputs[i].required && !re.test(inputs[i].value)) {
				return false;
			}
		}
		return true;
	}

	$('button#save').click(function() {
		send('http://localhost:8080/driver/document/save');
	});

	$('button#complete').click(function() {
		$('div#invalid').addClass('hide');
		if (requiredIsValid()) {
			send('http://localhost:8080/driver/document/complete');
		} else {
			$('div#invalid').removeClass('hide');
			$('html, body').animate({ scrollTop: 0 }, 'fast');
		}
	});

	if (data !== '') {
		inputTools.fill(JSON.parse(data));
	}

	$('input[type="checkbox"].required').click(function() {
		var inputs = inputTools.getParent(this).querySelectorAll(inputTools.inputTypes.join(', '));
		for (var i = 0; i < inputs.length; i++) {
			if (this.checked) {
				inputs[i].required = true;
			} else {
				inputs[i].required = false;
			}
		}
	});
});