$(document).ready(function(){
	
	$("#loginForm").submit(function(e) {

        e.preventDefault();

        var formData = new FormData(this);

    	$.ajax({
		type: "POST",
		url: "actions/signin.php",
		data: formData,
	    success: function(obj) {
        	result = $.parseJSON(obj);
        	if(result.response == 'y'){
        		// alert(result.message);
        		window.location = "index.php";
        	}
        	else{
        		alert(result.message);
        	}
        },
        contentType: false,
        processData: false,
	    error: function() {alert('failed');}
		});
    });
    
});
