

$(document).ready(function(){


     $('.nav__item').has("ul").find('a').append('<span></span>');

     // $('.nav__item').has("ul").children('a').attr('href','javascript:void(0);');
      //$('.nav__item').has("ul").prepend('<span></span>');


      $('.mnav__item__list li').has("ul").children('a').attr('href','javascript:void(0);');
      $('.mnav__item__list li').has("ul").prepend('<span></span>');
       $('.mnav__item__list').find("li.current").parents('ul').css('display','block').parents('li').addClass('current');


      $('.mnav__item').has("ul").prepend('<span></span>');
      $('.mnav__item').has("ul").children('a').attr('href','javascript:void(0);');
      $(".mnav__item>a").click(function(){
        $(".mnav__item ul").slideUp();
         if(($(this).siblings("ul")).is(":visible")){
           $(this).siblings("ul").slideUp();
          }else{
            $(this).siblings("ul").slideDown();
        }
      });

      $(".mnav__item__list li>a").click(function(){
        $(".mnav__item__list ul").slideUp();
         if(($(this).siblings("ul")).is(":visible")){
           $(this).siblings("ul").slideUp();
          }else{
            $(this).siblings("ul").slideDown();
        }
      });

      $('.scroll').click(function(){ $('html,body').animate({scrollTop:$('.idx__about').offset().top},1000); }); 

       $('.banner__slider').slick({
      centerMode: false,
      infinite: false,
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      dots: true,
      adaptiveHeight: true,
       responsive: [
      {
        breakpoint: 854,
        settings: {
          arrows: false,
          dots: false,
        }
      }]  
    });


















 $('.aside__cat__sec').find("li.current").parents('ul').css('display','block').parents('li').addClass('current');


  $('.aside__cat li').has("ul").children('a').attr('href','javascript:void(0);');
  $(".aside__cat li>a").click(function(){
        $(".aside__cat li>ul").slideUp();
        if(($(this).siblings("ul")).is(":visible")){
          $(this).siblings("ul").slideUp();
        }else{
         $(this).siblings("ul").slideDown();
        }
  });





  $('.nav__item').has("ul").children('a').attr('href','javascript:void(0);');

  $('.Mnav__item').has("ul").children('a').attr('href','javascript:void(0);');
  $('.Mnav__item__sec').has("ul").children('a').attr('href','javascript:void(0);');
  $(".Mnav__item>a").click(function(){
      $(".Mnav__item ul").slideUp();
      if(($(this).siblings("ul")).is(":visible")){
         $(this).siblings("ul").slideUp();
      }else{
        $(this).siblings("ul").slideDown();
      }
  });

  $(".Mnav__item__sec a").click(function(){
      $(".Mnav__item__sec ul").slideUp();
      if(($(this).next("ul")).is(":visible")){
         $(this).next("ul").slideUp();
      }else{
        $(this).next("ul").slideDown();
      }
  });


  /*-----------------QA-----------------------*/


  $(".qa__title").click(function(){
      if($(this).parents("li").hasClass('open')){
        $(this).siblings(".qa__answer").slideUp();
        $(this).parents("li").removeClass('open');
      }else{
        $(".qa__answer").slideUp();
        $(".qa__list li").removeClass('open');
        $(this).siblings(".qa__answer").slideDown();
        $(this).parents("li").addClass('open');
      }
    });


  
 /*-----------------QA-----------------------*/
  
/*
  $('.Mnav').find("li.current").parents('ul').css('display','block');
  $('.Mnav').find("li").has("ul").prepend('<span></span>');
  $(".Mnav li span").click(function(){
    $(this).siblings("ul").slideToggle();
  });


  $('.Mnav__item').has("ul").find('a').attr('href','javascript:void(0);');
  $(".Mnav__item").mouseenter(function(){
      //$(".Mnav__item ul").slideUp();
      $(this).find("ul").slideDown();
      
  });
  $(".Mnav__item").mouseleave(function(){
      $(this).find("ul").slideUp();
  });

*/


    $(".gotop").click(function(){
        jQuery("html,body").animate({
            scrollTop:0},1000);
    });



});  

 
 



$(document).ready(function(){



 $(".mobile_btn").click(function(){
    //$(".mobile__nav").slideToggle();
    $("body,html").toggleClass('openaside');
    $(".Wrapper,.Wrapper__mask").toggleClass('openaside');
    $('#nav-icon4').toggleClass('open');
    $('.mobile__nav').toggleClass('open');
  });

  $(".Wrapper__mask").click(function(){
    $("body,html").removeClass('openaside');
    $(".Wrapper,.Wrapper__mask").removeClass('openaside');
    $('#nav-icon4').removeClass('open');
  });






$(window).load(function() {



  $(window).bind("scroll", function(){

    var floatcount = $(window).scrollTop()+($(window).height()/3);
    
    if($(".rightbtn").is(":hidden")){
      $(".rightbtn").fadeIn(3000);
      $(".rightbtn").css('top',floatcount);
    }
    else{
      $(".rightbtn").css('top',floatcount);
    }

    
    



    
  });
});



$(window).bind("scroll", function(){

    height = $("header").height();

    if($(window).scrollTop()>height){

      $(".header_s").addClass("header__scroll");
      $(".searchbox").addClass("header__scroll");
      $(".mainbody").addClass("header__scroll");

    }
    
    if($(window).scrollTop()<height){

      $(".header_s").removeClass("header__scroll").removeClass("scrolled");
      $(".searchbox").removeClass("header__scroll");
      $(".mainbody").removeClass("header__scroll");

    }

    
  });


/*
  $(document).keyup(function(e){
    $("body").hide();
    alert('keydown'+e.keyCode);       
        
    return false;
   });
*/


  /*
        

preloaderCheck();
 

function preloaderCheck() {
    showPreloader();
    $(window).load(function() {
        hidePreloader();
     
    });
}


function showPreloader() {
  $(".preloader").fadeIn("slow");
}

function hidePreloader() {
 $(".preloader").delay(1000).fadeOut("slow");

}

*/


});


/*---去虛框-----*/


jQuery(function($){
  $("a").focus(function(){
    $(this).blur();
  });
});

/*---去虛框-----*/



