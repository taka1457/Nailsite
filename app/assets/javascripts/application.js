// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require jquery.jpostal
//= require moment
//= require fullcalendar
//= require_tree .

$(function() {
  $(document).on('turbolinks:load', () => {
    $('#shop_postal_code').jpostal({
      postcode : [
        '#shop_postal_code'
      ],
      address: {
        "#shop_prefecture_code": "%3", // # 都道府県が入力される
        "#shop_city"           : "%4%5", // # 市区町村と町域が入力される
        "#shop_street"         : "%6%7" // # 大口事務所の番地と名称が入力される
      }
    });
  });
});

$(document).on("turbolinks:load", function(){
  function readURL(input) {
    if(input.files && input.files[0]){
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#customer_profile_image").change(function(){
    readURL(this);
  });
  $("#shop_shop_image").change(function(){
    readURL(this);
  });
  $("#post_post_image").change(function(){
    readURL(this);
  });
  $("#menu_menu_image").change(function(){
    readURL(this);
  });
});


$(function(){
    $('#calendar').fullCalendar({
        reserves: '/reserves.json',
        titleFormat: 'YYYY年 M月',
        dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
        header: {
            left: '',
            center: 'title',
            right: 'today prev,next'
        },
        defaultTimedEventDuration: '03:00:00',
        buttonText: {
            prev: '前',
            next: '次',
            prevYear: '前年',
            nextYear: '翌年',
            today: '今日',
            month: '月',
            week: '週',
            day: '日'
        },
        selectable: true,
        selectHelper: true,
        select: function(data) {
          console.log(data);
          var str = moment(data).format( 'YYYY-MM-DD' );
          console.log(str);
          $('.reserve_form').show('1000');
          $('.f_date').val(str);
        }
    });
});
