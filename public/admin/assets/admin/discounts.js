
$(document).ready(function(){

    $("#addForm").submit(function(e) {

        e.preventDefault();

        var formData = new FormData(this);

    	$.ajax({
    		type: "POST",
    		url: "actions/discounts/add.php",
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
    	    error: function() { alert('failed'); }
		});
    });


    $("#addToTable").click(function() {
        $("#addContainer").slideDown();
        $("#editContainer").slideUp();
        $(this).hide();
        $("#btnCancel").show();
    });


    $("#btnCancel").click(function() {
        $("#addContainer").slideUp();
        $("#editContainer").slideUp();
        $(this).hide();
        $("#addToTable").show();

    });


    $("#tableContainer").on("click", ".edit-element", function(e) {

        e.preventDefault();
        var id = $(this).data('id');
        $("#addContainer").slideUp();
        $("#btnCancel").show();
        $("#addToTable").hide();

        $.ajax({
            type: "POST",
            url: "actions/discounts/get.php",
            data: {'id':id},
            success: function(obj) {
                //alert(obj);
                result = $.parseJSON(obj);
                if(result.response == 'y') {
                    $("#editContainer").slideDown();
                    $("#addContainer").slideUp();
                    topFunction();
                    $("#editForm input[name='id']").val(result.id);
                    $("#editForm select[name='sub_category_id']").val(result.sub_category_id);
                    $("#editForm input[name='discount']").val(result.discount);
                }
                else{
                    $("#addContainer").slideDown();
                    $("#btnCancel").hide();
                    $("#addToTable").show();
                    alert(result.message);
                }
            },
            error: function() {alert('failed');}
        });
        // When the user clicks on the button, scroll to the top of the document
        function topFunction() {
            document.body.scrollTop = 0; // For Safari
            document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
        }
    });

    $("#editForm").submit(function(e) {
        
        e.preventDefault();
        
        var formData = new FormData(this);
        
    	$.ajax({
    		type: "POST",
    		url: "actions/discounts/edit.php",
    		data: formData,
    	    success: function(obj) {
            	result = $.parseJSON(obj);
            	if(result.response == 'y') {
            		alert(result.message);
            		location.reload();
            	}
            	else{
            		alert(result.message);
            	}
            },
            contentType: false,
            processData: false,
    	    error: function() { alert('failed'); }
		});
    });
    
    $("#tableContainer").on("click", ".remove-element", function(e) {
        
        e.preventDefault();
        
        if(confirm("Are you sure?"))
        {
            var ID = $(this).data('id');
            ele = $(this);
            
            $.ajax({
                type: "POST",
                url: "actions/discounts/delete.php",
                data: {'ID':ID},
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
                error: function() { alert('failed'); }
            });
        }
    });




});
