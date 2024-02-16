
$(document).ready(function(){
    
    $("#changePassword").submit(function(e) {
        
        e.preventDefault();
        
        var formData = new FormData(this);
        
    	$.ajax({
    		type: "POST",
    		url: "actions/changePassword.php",
    		data: formData,
    	    success: function(obj) {
            	result = $.parseJSON(obj);
            	if(result.response == 'y'){
            		alert(result.message);
            		location.reload();
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
