$("#update").click(function(e){
    if($("#user_age").val() == ""){
        e.preventDefault(); 
        alert("Please enter the Age")
        $(document).reload();
    }
    else if($("#user_city").val() == ""){
        e.preventDefault(); 
        alert("Please enter the City")
        $(document).reload();
    }
    else if($("#user_country").val() == ""){
        e.preventDefault(); 
        alert("Please enter the Country")
        $(document).reload();
    }
    else if($("#user_mobile").val() == ""){
        e.preventDefault(); 
        alert("Please enter the Mobile Number")
        $(document).reload();
    }
    else{
        $("#login_details").submit();
    }
})
