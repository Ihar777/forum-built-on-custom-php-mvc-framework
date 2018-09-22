$(document).ready(function() {

    $('#search').focus(function() {
        if(window.matchMedia( "(min-width: 800px)" ).matches) {
            $(this).animate({width: '+=200px'}, 500);
        }
    });
    
    $("#search").blur(function(){
        if(window.matchMedia( "(min-width: 800px)" ).matches) {
            $(this).animate({width: '-=200px'}, 500);
        }
    });
    
});