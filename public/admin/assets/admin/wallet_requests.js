
$(document).ready(function(){

    $("#tableContainer").on("change", ".wallet-request-status", function() {
        
        var ele = $(this);
        var id = $(this).data('id');
        var status = $(this).val();
        
        var formData = new FormData();
        formData.append("id", id);
        formData.append("status", status);
        
        if(status == "1")
        {
            if(confirm("Are you sure you want to accept the request?"))
            {
                ele.prop("disabled", true);
                
                $.ajax({
                    type: "POST",
                    url: "actions/wallet_requests/change_request_status.php",
                    data: formData,
                    success: function(obj) {
                        result = $.parseJSON(obj);
                        if(result.response == 'y')
                        {
                            $("#wallet-request-"+ id +"-updation-date-col").show();
                            $("#wallet-request-"+ id +"-updation-date-col").css("width", "275px");
                            $("#wallet-request-"+ id +"-updation-date").html(result.updated_on);
                            
                            alert(result.message);
                            // location.reload();
                        }
                        else{
                            alert(result.message);
                        }
                    },
                    contentType: false,
                    processData: false,
                    error: function() { alert('failed'); }
                });
            }
        }
        else if(status == "2")
        {
            $("#WalletRequestRejectionReasonModal").modal('show');
            
            $("#WalletRequestRejectionReasonModal input[name='id']").val(id);
            $("#WalletRequestRejectionReasonModal input[name='status']").val(status);
        }
        
    });
    
    
    $("#WalletRequestRejectionReasonForm").submit(function(e) {
        
        e.preventDefault();
        
        var ele = $(this);
        var id = $("#WalletRequestRejectionReasonForm input[name='id']").val();
        var status = $("#WalletRequestRejectionReasonForm input[name='status']").val();
        var reason = $("#WalletRequestRejectionReasonForm textarea[name='reason']").val();
        
        var formData = new FormData(this);
        
        $.ajax({
            type: "POST",
            url: "actions/wallet_requests/change_request_status.php",
            data: formData,
            success: function(obj) {
                result = $.parseJSON(obj);
                if(result.response == 'y')
                {
                    $("#wallet-request-status-"+ id).prop("disabled", true);
                    
                    $("#wallet-request-"+ id +"-updation-date-col").show();
                    $("#wallet-request-"+ id +"-updation-date-col").css("width", "275px");
                    $("#wallet-request-"+ id +"-updation-date").html(result.updated_on);
                    
                    $("#wallet-request-"+ id +"-rejection-reason-col").show();
                    $("#wallet-request-"+ id +"-rejection-reason").html(reason);
                    
                    $("#WalletRequestRejectionReasonForm input[name='id']").val("");
                    $("#WalletRequestRejectionReasonForm input[name='status']").val("");
                    $("#WalletRequestRejectionReasonForm textarea[name='reason']").val("");
                    
                    $("#WalletRequestRejectionReasonModal").modal('hide');
                    
                    alert(result.message);
                    // location.reload();
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
    
});
