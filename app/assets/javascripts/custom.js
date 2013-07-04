
$(document).ready(function() {
	$('#micropost_content').keyup(function(){
		var length = $(this).val().length;
		$('#MicropostWordCount').html(140-length);
	}); 

});