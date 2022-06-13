function getPage(){
    $.ajax({
		converters: {
	   "text json": jQuery.parseJSON
	   },
        type: "GET",
        url: "page_author.php",
        data: {auth: $('[name="auth"]').val()},
        success: function(result){
            $('#result1').html(result);
        }
    });
}
function getPubl(){
    $.ajax({
		converters: {
            "text xml": function(data){return data}
        },
        type: "GET",
        url: "publ.php",
        data: {publs: $('[name="publs"]').val()},
        success: function(result){			
			$('#result2').html('');
            $(result).find('publ').each(function(){
                $('#result2').append($(this).text() + '</br>');
            });
        }
    });
}
function getDate(){
    $.ajax({
        type: "GET",
        url: "times.php",
        data: {time1: $('[name="date_start"]').val(), time2: $('[name="date_end"]').val()},
        success: function(result){
            $('#result3').html(result);
            }
    });
}