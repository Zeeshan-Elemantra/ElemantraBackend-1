
$(document).ready(function(){
    
    $("#addForm").submit(function(e) {
        
        e.preventDefault();
        
        // for ( instance in CKEDITOR.instances ) {
        //     CKEDITOR.instances[instance].updateElement();
        // }
        
        var formData = new FormData(this);
        
    	$.ajax({
		type: "POST",
		url: "actions/product_cards/add.php",
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
    
    
    $("#addToTable").click(function(){
        $("#addContainer").slideDown();
        $("#editContainer").slideUp();
        $(this).hide();
        $("#btnCancel").show();
    });
    
    
    $("#btnCancel").click(function(){
        $("#addContainer").slideUp();
        $("#editContainer").slideUp();
        $(this).hide();
        $("#addToTable").show();

    });
    
    
    $("#tableContainer").on("click",".edit-element",function(e) {
        
        e.preventDefault();
        var id = $(this).data('id');
        $("#addContainer").slideUp();
        $("#btnCancel").show();
        $("#addToTable").hide();
        
        $.ajax({
            type: "POST",
            url: "actions/product_cards/get.php",
            data: {'id':id},
            success: function(obj) {
                //alert(obj);
                result = $.parseJSON(obj);
                if(result.response == 'y') {
                    $("#editContainer").slideDown();
                    $("#addContainer").slideUp();
                    topFunction();
                    $("#editForm input[name='id']").val(result.id);
                    $("#editForm input[name='card_no']").val(result.card_no);
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
        
        // for ( instance in CKEDITOR.instances ) {
        //     CKEDITOR.instances[instance].updateElement();
        // }
        
        var formData = new FormData(this);
        
    	$.ajax({
		type: "POST",
		url: "actions/product_cards/edit.php",
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
    
    $("#tableContainer").on("click", ".updatestatus-element", function() {
        
        $(this).prop("disabled", true);
        
        var ele = $(this);
        var id = $(this).data('id');
        
        $.ajax({
            type: "POST",
            url: "actions/product_cards/isactive.php",
            data: {'id': id},
            success: function(obj) {
                result = $.parseJSON(obj);
                if(result.response == 'y')
                {
                    ele.prop("disabled", false);
                    
                    if(result.status == "1")
                    {
                        if(lang == "ar") {
                            ele.text("نشيط");
                        } else {
                            ele.text("Active");
                        }
                        
                        ele.addClass("btn-success");
                        ele.removeClass("btn-danger");
                    }
                    else if(result.status == "0")
                    {
                        if(lang == "ar") {
                            ele.text("غير نشط");
                        } else {
                            ele.text("Inactive");
                        }
                        
                        ele.addClass("btn-danger");
                        ele.removeClass("btn-success");
                    }
                    
                    alert(result.message);
                    // location.reload();
                }
                else{
                    ele.prop("disabled", false);
                    alert(result.message);
                }
            },
            error: function() { alert('failed'); ele.prop("disabled", false); }
        });
    });
    
    $("#tableContainer").on("click",".remove-element",function(e){
        e.preventDefault();
        if(confirm("Are you sure?")){
            var ID = $(this).data('id');
            ele = $(this);
            //alert(ID);
            $.ajax({
                type: "POST",
                url: "actions/product_cards/delete.php",
                data: {'ID':ID},
                //timeout: 3000,
                 success: function(obj) {
                     //alert(obj);
                        result = $.parseJSON(obj);
                         if(result.response == 'y'){
                             alert(result.message);
                             location.reload();
                         }
                         else{
                             alert(result.message);
                         }
                },
                error: function() {alert('failed');}
            });
        }
    });
    
    
    
});
