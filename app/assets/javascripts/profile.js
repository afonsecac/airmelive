$("#update").click(function(e){
    if($("#user_avatar").val() == ""){
        e.preventDefault();
            $("#upload_error").text("Please select an image");
        }
    else{
        $("#login_details").submit();
    }
})