function init_menu(){
  $("#sidebar-menu").find('a').on('click', function(){
    var $li = $(this).parent();
    if ($li.is('.active')) {
      $li.removeClass('active active-sm');
      $(this).next("ul").slideUp();
    } else {
      $("#sidebar-menu ul.child_menu").slideUp();
      $("#sidebar-menu ul > li").removeClass('active active-sm');
      $li.addClass('active active-sm');
      $(this).next("ul").slideDown();
    }
  });
}
 
$(document).ready(function() {
  init_menu();
});
