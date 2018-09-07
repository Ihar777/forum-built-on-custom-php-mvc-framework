	
        
   
$(document).ready(function(){

$("input, textarea").on({
	
	mouseenter:function(){
	
	$(this).css("background-color", "#ccc");
	
	},
	
	mouseleave:function(){
	
	$(this).css("background-color", "#fff");
	
	}

});

    $(".joke").mouseenter(function(){
        
        alert('Don\'t you dare do it! :-) It\'s not you, who created the post');
        
        });
      
    // EDITOR CKEDITOR
ClassicEditor
        .create( document.querySelector( 'textarea' ) )
        .catch( error => {
            console.error( error );
        } );

      
      // REST OF THE CODE



    $('#selectAllBoxes').click(function(event){

        if(this.checked) {

            $('.checkBoxes').each(function(){

                this.checked = true;

            });

        } else {


            $('.checkBoxes').each(function(){

                this.checked = false;

            });


        }

    });



// var div_box = "<div id='load-screen'><div id='loading'></div></div>";

// $("body").prepend(div_box);

// $('#load-screen').delay(700).fadeOut(600, function(){
//    $(this).remove();
// });


    function loadUsersOnline() {


        $.get("functions.php?onlineusers=result", function(data){

            $(".usersonline").text(data);


        });

    }


    setInterval(function(){

        loadUsersOnline();


    },500);


});