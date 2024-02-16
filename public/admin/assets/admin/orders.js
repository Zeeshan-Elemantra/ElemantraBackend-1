
$(document).ready(function(){
    
    $("#tableContainer").on("click", ".view-note", function(e) {
        
        e.preventDefault();
        
        $(this).prop("disabled", true);
        $(this).addClass("disabled");
        
        var ele = $(this);
        var order_id = $(this).data('order-id');
        
        $.ajax({
            type: "POST",
            url: "actions/orders/get_note.php",
            data: {'order_id': order_id},
            success: function(obj) {
                result = $.parseJSON(obj);
                if(result.response == 'y')
                {
                    ele.prop("disabled", false);
                    ele.removeClass("disabled");
                    
                    $("#noteModal").modal("show");
                    $("#note").html(result.note);
                }
                else{
                    ele.prop("disabled", false);
                    ele.removeClass("disabled");
                    
                    alert(result.message);
                }
            },
            error: function() { alert('failed'); ele.prop("disabled", false); ele.removeClass("disabled"); }
        });
    });
    
    
    $("#tableContainer").on("click", ".view-problem", function(e) {
        
        e.preventDefault();
        
        $(this).prop("disabled", true);
        $(this).addClass("disabled");
        
        var ele = $(this);
        var order_id = $(this).data('order-id');
        
        $.ajax({
            type: "POST",
            url: "actions/orders/get_problem.php",
            data: {'order_id': order_id},
            success: function(obj) {
                result = $.parseJSON(obj);
                if(result.response == 'y')
                {
                    ele.prop("disabled", false);
                    ele.removeClass("disabled");
                    
                    $("#problemModal").modal("show");
                    $("#problem").html(result.problem);
                }
                else{
                    ele.prop("disabled", false);
                    ele.removeClass("disabled");
                    
                    alert(result.message);
                }
            },
            error: function() { alert('failed'); ele.prop("disabled", false); ele.removeClass("disabled"); }
        });
    });

});
