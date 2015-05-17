// initialise plugins superfish menu
                jQuery(document).ready(function($){
                        jQuery('ul.sf-menu').superfish();
 
                        /* prepend menu icon */
                        jQuery('#nav-wrap').prepend('<div id="menu-icon" style="text-align: center;"><strong>MENU</strong></div>');
                        //alert ('test');
                        /* toggle nav */
                        $("#menu-icon").on("click", function(){
                                jQuery(".sf-menu").slideToggle();
                                jQuery(this).toggleClass("active");
                        });
                });