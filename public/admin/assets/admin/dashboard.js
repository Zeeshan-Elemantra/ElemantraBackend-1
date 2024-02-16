
$(document).ready(function(){

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
            url: "actions/vendors/get.php",
            data: {'id':id},
            success: function(obj) {
                //alert(obj);
                result = $.parseJSON(obj);
                if(result.response == 'y') {
                    $("#editContainer").slideDown();
                    $("#addContainer").slideUp();
                    topFunction();
                    $("#editForm input[name='id']").val(result.id);
                    $("#editForm input[name='name']").val(result.name);
                    $("#editForm input[name='mobile']").val(result.mobile);
                    $("#editForm input[name='email']").val(result.email);
                    $("#editForm input[name='username']").val(result.username);
                    $("#editForm input[name='password']").val(result.password);
                    $("#editForm input[name='discount']").val(result.discount);
                    $("#editForm textarea[name='address']").val(result.address);
                    $("#editForm input[name='withdrawal_limit']").val(result.withdrawal_limit);
                    $("#editForm input[name='registry_file']").val(result.registry_file);
                    $("#editForm input[name='bank_name']").val(result.bank_name);
                    $("#editForm input[name='bank_account_number']").val(result.bank_account_number);
                    $("#editForm input[name='iban']").val(result.iban);
                    $("#editForm input[name='account_holder_name']").val(result.account_holder_name);
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
    		url: "actions/vendors/edit.php",
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
            url: "actions/vendors/isactive.php",
            data: {'id': id},
            success: function(obj) {
                result = $.parseJSON(obj);
                if(result.response == 'y')
                {
                    ele.prop("disabled", false);
                    
                    if(result.status == "1")
                    {
                        ele.text("Active");
                        ele.addClass("btn-success");
                        ele.removeClass("btn-danger");
                    }
                    else if(result.status == "0")
                    {
                        ele.text("Inactive");
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

    $("#tableContainer").on("click", ".remove-element", function(e) {
        
        e.preventDefault();
        
        if(confirm("Are you sure?"))
        {
            var ID = $(this).data('id');
            ele = $(this);
            
            $.ajax({
                type: "POST",
                url: "actions/vendors/delete.php",
                data: {'ID':ID},
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
                error: function() { alert('failed'); }
            });
        }
    });
    
    
    $("#tableContainer").on("click", ".upload-applicant-photo", function(e) {
        
        e.preventDefault();
        
        var ele = $(this);
        var task_data_id = $(this).data('task-data-id');
        
        $("#uploadApplicantPhotoModal").modal('show');
        $("#uploadApplicantPhotoForm input[name='task_data_id']").val(task_data_id);
    });


    $("#tableContainer").on("click", ".upload-other-docs", function(e) {
        
        e.preventDefault();
        
        var ele = $(this);
        var task_data_id = $(this).data('task-data-id');
        
        $("#uploadOtherDocsModal").modal('show');
        $("#uploadOtherDocsForm input[name='task_data_id']").val(task_data_id);
    });
    
    
    $("input[name='txn_type']").change(function() {
        
        var txn_type = $(this).val();
        var btn_text = "";
        
        if(txn_type == "credit") { btn_text = "Credit"; }
        else if(txn_type == "debit") { btn_text = "Debit"; }
        
        $("#creditDebitWalletBtn").text(btn_text);
    });
    
    
    $("#creditDebitWalletForm").submit(function(e) {
        
        e.preventDefault();
        
        var txn_type = $("#creditDebitWalletForm input[name='txn_type']:checked").val();
        var vendor_id = $("#creditDebitWalletForm input[name='vendor_id']").val();
        var amount = $("#creditDebitWalletForm input[name='amount']").val();
        
        if(confirm("Are you sure you want to "+ txn_type +"?"))
        {
            $("#creditDebitWalletBtn").prop("disabled", true);
            
            var formData = new FormData(this);
            
            $.ajax({
        		type: "POST",
        		url: "actions/vendors/credit_debit_wallet.php",
        		data: formData,
        	    success: function(obj) {
                	result = $.parseJSON(obj);
                	if(result.response == 'y') {
                	    $("#creditDebitWalletBtn").prop("disabled", false);
                	    
                	    $("#creditDebitWalletModal").modal('hide');
                	    $("#credit-debit-wallet-vendor-name").text("");
                        $("#creditDebitWalletForm input[name='vendor_id']").val("");
                        $("#creditDebitWalletForm input[name='amount']").val("");
                        
                	    var wallet_balance = result.wallet_balance;
                	    
                	    $("#vendor"+ vendor_id +"-wallet-balance").text(wallet_balance);
                	    
                		alert(result.message);
                	}
                	else{
                	    $("#creditDebitWalletForm input[name='amount']").focus();
                	    $("#creditDebitWalletBtn").prop("disabled", false);
                	    
                		alert(result.message);
                	}
                },
                contentType: false,
                processData: false,
        	    error: function() { alert('failed'); $("#creditDebitWalletForm input[name='amount']").focus(); $("#creditDebitWalletBtn").prop("disabled", false); }
    		});
        }
        else{
            $("#creditDebitWalletForm input[name='amount']").focus();
        }
        
    });




});
