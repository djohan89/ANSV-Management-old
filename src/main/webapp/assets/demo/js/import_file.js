// Import file
document.getElementById("a_href_import_file").onclick = function() {
	var fullPath = document.getElementById("file_import").value;
	// Lấy ra tên file
	if (fullPath) {
	    var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
	    var filename = fullPath.substring(startIndex);
	    if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
	        filename = filename.substring(1);
	    }
	    document.getElementById("file_import_name").value = filename;
	    
	    $("#form_import_file").submit();
	}
}