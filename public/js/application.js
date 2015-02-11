$(document).ready(function() {
    // This is called after the document has loaded in its entirety
    // This guarantees that any elements we bind to will exist on the page
    // when we try to bind to them


    // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()


    // this is for front page search tweets
    $('.search').click(function(event) {
        $('#loading').show();
        var username = $('#name').val();

        $.ajax({
            type: "POST",
            url: "/tweets",
            data: { "username": username },
            success: function(data) {
                $('#loading').hide();
                $('#result').html("");
                $('#result').append('<p>' + data + '</p>');
            },
        });

        event.preventDefault();

    });


    // this is for tweeting stuff

    $('.tweethere').click(function(event) {
        $('#loading1').show();
        var tweet = $('#tweet').val();

        $.ajax({
            type: "POST",
            url: "/tweet",
            data: { "tweet": tweet },
            success: function(data) {
                $('#loading').hide();
                $('#result1').html("");
                $('#result1').append('<p>' + "success" + '</p>');
                $(location).attr('href',data);
            },
        });

        event.preventDefault();

    });

});