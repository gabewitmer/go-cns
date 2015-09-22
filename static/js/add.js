var itemIds = []
$(document).ready(function() {
	$('button[id="addItem"]').click(function() {
		var item = $(this);
		if (item.attr('data-added') == '0') {
			itemIds.push(this.getAttribute('data-item-id'));
			item.text("Added");
			item.addClass('btn-success');
			item.removeClass('btn-default');
			item.attr('data-added', '1');
			$('button[id="done"]').removeAttr('disabled');
		} else {
			itemIds = removeValue(itemIds, item.attr('data-item-id'));
			item.text("Add");
			item.removeClass('btn-success');
			item.addClass('btn-default');
			item.attr('data-added', '0');
			if (itemIds.length < 1) {
				$('button[id="done"]').attr('disabled', 'disabled');
			};
		}
	});
	$('button[id="done"]').click(function(e){
		e.preventDefault();
		$('input[id="itemIds"]').val(itemIds);
		$('form[id="itemsForm"]').submit();
	});
});