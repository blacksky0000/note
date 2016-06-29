var items = document.getElementsByTagName('img');

for (var i = 0; items[i] != null ; i++) {
	var tmp = items[i].src
	if (tmp.indexOf('.jpeg') > -1){
		console.log(items[i]);
	}
}