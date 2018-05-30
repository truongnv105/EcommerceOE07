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

function init_menu_toggle (){
  $('#menu_toggle').on('click',function(){
    if($('body').hasClass('nav-md')) {
      $('body').removeClass('nav-md').addClass('nav-sm');
    } else {
      $('body').removeClass('nav-sm').addClass('nav-md');
    }
  });
}
 
$(document).ready(function() {
  init_menu();
  init_menu_toggle();
  
  $.rails.allowAction = function(link){
    if (link.data('confirm') == undefined){
      return true;
    }
    $.rails.showConfirmationDialog(link);
    return false;
  }

  $.rails.confirmed = function(link){
    link.data('confirm', null);
    link.trigger("click.rails");
  }

  $.rails.showConfirmationDialog = function(link){
    var message = link.data('confirm');
    swal({
      title: message,
      text: I18n.t('alert_confirm'),
      type: 'warning',
      confirmButtonClass: 'btn-danger',
      confirmButtonText: I18n.t('yes_delete'),
      showCancelButton: true
    }).then(function(e){
      swal(I18n.t('delete_success'), I18n.t('you_click'), 'success');
      setTimeout(function() {
        $.rails.confirmed(link);
      }, 1000);
    });
  };

  if($('.right_col').height() < $(window).height()){
    $('.right_col').css('height', $(window).height());
  }
});
