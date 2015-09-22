$(document).ready(function() {
	$('tr.header').on('show.bs.collapse', function() {
		$('i[id="' + this.id + '"]').addClass('fa-rotate-90');
    });
    $('tr.header').on('hidden.bs.collapse', function() {
    	$('i[id="' + this.id + '"]').removeClass('fa-rotate-90');
    });

});
function binarySearch(array, target, lb, ub) {
	if (lb > ub) {
		return -1;
	}
	var mid = Math.floor((lb + ub) / 2);
	var val = array[mid];
	if (val > target) {
		return binarySearch(array, target, lb, mid - 1);
	}
	if (val < target) {
		return binarySearch(array, target, mid + 1, ub);
	}
	return mid;
}

function removeValue(array, target) {
	sorted = array.sort();
	var index = binarySearch(sorted, target, 0, array.length-1);
	var newList = sorted.slice(0, index);
	return newList.concat(sorted.slice(index + 1, sorted.length));
}


