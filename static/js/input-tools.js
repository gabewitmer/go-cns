function InputTools() {
	this.addClicks();
}
InputTools.prototype = {
	inputTypes: ['input', 'textarea', 'select'],
	getParent: function (elem) {
		var found = false;
		var parent = elem.parentNode;
		while (!found) {
			if (parent.id === 'parent') {
				found = true;
			} else {
				parent = parent.parentNode;
			}
		}
		return parent;
	},
	getKeys: function (obj) {
		var keys = [];
		for (var key in obj) {
			keys.push(key);
		}
		return keys;
	},
	parseInput: function (elem) {
		var o = {};

		if (elem.type === 'checkbox') {
			if (elem.checked) {
				o[elem.name] = true;
			} else {
				o[elem.name] = false;
			}
		} else if (elem.type === 'radio') {
			if (elem.checked) {
				o[elem.name] = elem.value;
			}
		} else {
			o[elem.name] = elem.value;
		}
		return o;
	},
	parseMulti: function (parent) {
		var rows = parent.querySelectorAll('.multiple');
		var table = [];
		table.push(this.parseHeader(rows[0]));
		for (var i = 0; i < rows.length; i++) {
			table.push(this.parseRow(rows[i]));
		}
		return table;
	},
	parseHeader: function (firstRow) {
		var inputs = firstRow.querySelectorAll(this.inputTypes.join(', '));
		var head = [];
		for (var i = 0; i < inputs.length; i++) {
			head.push(inputs[i].name);
		}
		return head;
	},
	parseRow: function (row) {
		var inputs = row.querySelectorAll(this.inputTypes.join(', '));
		var vals = [];
		for (var i = 0; i < inputs.length; i++) {
			var input = inputs[i];
			if (input.type === 'checkbox') {
				if (input.checked) {
					vals.push(true);
				} else {
					vals.push(false);
				}
			} else if (input.type === 'radio') {
				if (input.checked) {
					vals.push(input.value);
				}
			} else {
				vals.push(input.value);
			}
		}
		return vals;
	},
	getJSON: function () {
		var inputs = document.querySelectorAll(this.inputTypes.join(', '));
		var data = [];
		for (var i = 0; i < inputs.length; i++) {
			var elem = inputs[i];
			if (elem.name !== '_csrf') {
				var out;
				if (elem.id === 'multi') {
					var parent = this.getParent(elem);
					var key = parent.getAttribute('data-group');
					out = {};
					out[key] = this.parseMulti(parent);
					i = i + parent.querySelectorAll(this.inputTypes.join(', ')).length - 1;
				} else {
					out = this.parseInput(elem);
				}
				data.push(out);
			}
		}
		return data;
	},
	copy: function (elem, data) {
		var multis = this.getParent(elem).querySelectorAll('.multiple');
		var copiedElem = multis[0].cloneNode(true);
		this.resetInputs(copiedElem);
		this.makeRemoveButton(copiedElem);
		if (data !== null && data !== undefined) {
			this.fillInputs(copiedElem, data);
		}
		multis[multis.length - 1].parentNode.insertBefore(copiedElem, multis[multis.length - 1].nextSibling);
	},
	makeRemoveButton: function (elem) {
		var removeButton = document.createElement('button');
		// add optional styling
		removeButton.className = 'btn btn-danger btn-sm';
		var buttonText = document.createTextNode("Remove");
		removeButton.appendChild(buttonText);
		removeButton.onclick = function () {
			elem.remove();
		};
		var buttonHolder = elem.querySelector('#remove-button');
		buttonHolder.insertBefore(removeButton, buttonHolder.childNodes[0]);
	},
	resetInputs: function (elem) {
		var inputs = elem.querySelectorAll('#multi');
		for (var i = 0; i < inputs.length; i++) {
			if (inputs[i].type === 'checkbox' || inputs[i].type === 'radio') {
				inputs[i].checked = false;
			} else {
				inputs[i].value = '';
			}
		}
	},
	fillInputs: function (elem, data) {
		var inputs = elem.querySelectorAll('#multi');
		for (var i = 0; i < inputs.length; i++) {
			if ((inputs[i].type === 'checkbox' || inputs[i].type === 'radio') && data[i] === true) {
				inputs[i].checked = true;
			} else {
				inputs[i].value = data[i];
			}
		}
	},
	fill: function (data) {
		for (var i = 0; i < data.length; i++) {
			var key = this.getKeys(data[i])[0];
			if (Array.isArray(data[i][key])) {
				this.fillMulti(data[i][key], key);
			} else {
				var input = document.querySelector('[name="' + key + '"]');
				if ((input.type === 'checkbox' || input.type === 'radio') && data[i][key] === true) {
					input.checked = true;
				} else {
					input.value = data[i][key];
				}
			}
		}
	},
	fillMulti: function (data, key) {
		var header = data[0];
		var rows = data.slice(1, data.length);
		for (var i = 0; i < rows.length; i++) {
			var row = rows[i];
			if (i === 0) {
				for (var j = 0; j < row.length; j++) {
					var val = row[j];
					var input = document.querySelector('[data-group="' + key + '"] [name="' + header[j] + '"]');
					if ((input.type === 'checkbox' || input.type === 'radio') && val === true) {
						input.checked = true;
					} else {
						input.value = val;
					}
				}
			} else {
				this.copy(document.querySelectorAll('[data-group="' + key + '"] .multiple')[0], row);
			}
		}
	},
	getArgs: function () {
		return this.args;
	},
	addClicks: function () {
		var addElems = document.querySelectorAll('.add');
		for (var i = 0; i < addElems.length; i++) {
			this.addClick(addElems[i]);
		}
	},
	addClick: function (addElem) {
		addElem.onclick = function () {
			inputTools.copy(this);
		};
	}
};

var inputTools = new InputTools();