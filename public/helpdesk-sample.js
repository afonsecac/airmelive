
getParameters = function(){
    var ret = {};
    
    var queryString = window.location.search.substring(1);
    var params = queryString.split('&');
    for( var co=0; co<params.length; co++ ){
        var keyValue = params[co].split('=');
        ret[keyValue[0]] = unescape(keyValue[1]);
    }
    
    return ret;
};

onClientReady = function(){
    console.log("hello");
    gapil.hangout.onApiReady.add(function(e){
        if(e.isApiReady){
            onApiReady();
        }
    });
};

onApiReady = function(){
    // We can get the parameters that were used to start the hangout,
    // and we will pass some of these along to the server.
    var param = getParameters();
    var now = new Date();
    
    // At this point, we can access the Hangout API functions
    var hangoutUrl = gapi.hangout.getHangoutUrl();
    
    //Get the URL of this javascript, so we can call a nearby page with this URL info
    var callbackUrl = 'http://protected-atoll-6216.herokuapp.com/register_hangout.json';
    
    // Make the call via AJAX.
    // The data are all passed as parameters in the call
    $.ajax({
        url: callbackUrl,
        dataType: 'json',
        data: {
            "hangoutUrl": hangoutUrl,
            "topic": param["gd"]
        }
    }).done( function( data, status, xhr ){
        // Call was made, process results
        $('#msg').html(data.msg);
    }).fail( function( xhr, status, error ){
        $('#msg').html( "There was a problem contacting the help desk. Please try again. ("+textStatus+")" );
    });
    request.getParameter("hangoutUrl")
};