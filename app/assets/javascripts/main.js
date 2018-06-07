(function($) {
  "use strict"

  var responsiveNav = $('#responsive-nav'),
    catToggle = $('#responsive-nav .category-nav .category-header'),
    catList = $('#responsive-nav .category-nav .category-list'),
    menuToggle = $('#responsive-nav .menu-nav .menu-header'),
    menuList = $('#responsive-nav .menu-nav .menu-list');

  catToggle.on('click', function() {
    menuList.removeClass('open');
    catList.toggleClass('open');
  });

  menuToggle.on('click', function() {
    catList.removeClass('open');
    menuList.toggleClass('open');
  });

  $(document).click(function(event) {
    if (!$(event.target).closest(responsiveNav).length) {
      if (responsiveNav.hasClass('open')) {
        responsiveNav.removeClass('open');
        $('#navigation').removeClass('shadow');
      } else {
        if ($(event.target).closest('.nav-toggle > button').length) {
          if (!menuList.hasClass('open') && !catList.hasClass('open')) {
            menuList.addClass('open');
          }
          $('#navigation').addClass('shadow');
          responsiveNav.addClass('open');
        }
      }
    }
  });

  $(document).ready(function(){
    $('#home-slick').slick({
      autoplay: true,
      infinite: true,
      speed: 500,
      arrows: true,
      fade: true
    });

  $('#product-slick-2').slick({
      slidesToShow: 4,
      slidesToScroll: 2,
      autoplay: true,
      infinite: true,
      speed: 300,
      dots: true,
      arrows: false,
      appendDots: '.product-slick-dots-2',
      responsive: [{
          breakpoint: 991,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1,
          }
        },
        {
          breakpoint: 480,
          settings: {
            dots: false,
            arrows: true,
            slidesToShow: 1,
            slidesToScroll: 1,
          }
        },
      ]
    });

    $('#product-main-view').slick({
      infinite: true,
      speed: 300,
      dots: false,
      arrows: true,
      fade: true,
      asNavFor: '#product-view',
    });

    $('#product-view').slick({
      slidesToShow: 3,
      slidesToScroll: 1,
      arrows: true,
      centerMode: true,
      focusOnSelect: true,
      asNavFor: '#product-main-view',
    });

    $('#product-main-view .product-view').zoom();

    var slider = document.getElementById('price-slider');
    if (slider) {
      noUiSlider.create(slider, {
        start: [1, 999],
        connect: true,
        tooltips: [true, true],
        format: {
          to: function(value) {
            return value.toFixed(2) + '$';
          },
          from: function(value) {
            return value
          }
        },
        range: {
          'min': 1,
          'max': 999
        }
      });
    }

    $(".input").change(function(){
      var quantity = $(this).val();
      var product_id = $(this).prev("input").val();
      $.ajax({
        url: "carts/" + product_id,
        method: "put",
        data: {quantity: quantity}
      });
    });

    $(".button-ram").click(function(){
      var ram = $(this).children("input").val();
      $(".option-rams li").removeClass("active");
      $(this).parents("li").addClass("active");
      $("input.value-ram").val(ram);
      $(".filter").click();
    });

    $(".button-hard-disk").click(function(){
      var hard_disk = $(this).children("span").text();
      $(".option-hard-disk li").removeClass("active");
      $(this).parents("li").addClass("active");
      $("input.value-hard-disk").val(hard_disk);
      $(".filter").click();
    });

    $("select.input").change(function(){
      var sort = $("select.input-sort").val();
      $("input.value-sort").val(sort);
      $(".filter").click();
    });
  });
})(jQuery);
