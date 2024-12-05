(function () {
  initActive()
  bindEvenInit()
  setActive()
  var mycard = $('#mycard')
  
    let mycardTop = mycard&&mycard.offset()&&mycard.offset().top;
    // let height=$('.header').height()
    // console.log(mycardTop,height)
    window.onscroll = function () {
      var e = e || window.event;
      var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
      // console.log(scrollTop )
      if (scrollTop > mycardTop) {
        mycard.addClass('scroll')
      } else {
        mycard.removeClass('scroll')
      }
    }

  function initActive () {
    let root = document.querySelector(':root')
    var active = sessionStorage.getItem('wttandroid')
    
    
    if (active && active == 'true') { //非第一次登录 且是开灯(白色)
      $('#myRadio').removeClass('active')
      $('.navigation').removeClass('active')

      root.style.setProperty('--backColor', '#fff')
      root.style.setProperty('--borderline', '#fff')
      root.style.setProperty('--headerCOlor', '#fff')
      root.style.setProperty('--headerhover', 'rgb(255, 255, 255,.8)')
      root.style.setProperty('--headerFont', '#00283A' )
      root.style.setProperty('--fontColor', '#fff' )
      root.style.setProperty('--mainColor', '#ff8181' )
      root.style.setProperty('--bagColor', '#f4f5f7')
    } else { //第一次登录或是黑色时 默认变成黑色
      $('#myRadio').addClass('active')
      $('.navigation').addClass('active')
      
      root.style.setProperty('--backColor', '#fff')
      root.style.setProperty('--borderline', '#00283A')
      root.style.setProperty('--headerCOlor', '#00283A')
      root.style.setProperty('--headerhover', 'rgb(0, 40, 58,.8)')
      root.style.setProperty('--headerFont', '#fff' )
      root.style.setProperty('--fontColor', '#00283A' )
      root.style.setProperty('--mainColor', '#ff8181' )
      root.style.setProperty('--bagColor','#02162b' )
    }
  }



  $('#myRadio').click(function () {
    // h1
    let root = document.querySelector(':root')

    if ($('#myRadio').hasClass('active')) { //现在黑色变成白色
      sessionStorage.setItem('wttandroid', true)
      
      $('#myRadio').removeClass('active')
      $('.navigation').removeClass('active')

      root.style.setProperty('--backColor', '#fff')
      root.style.setProperty('--borderline', '#fff')
      root.style.setProperty('--headerCOlor', '#fff')
      root.style.setProperty('--headerhover', 'rgb(255, 255, 255,.8)')
      root.style.setProperty('--headerFont', '#00283A' )
      root.style.setProperty('--fontColor', '#fff' )
      root.style.setProperty('--mainColor', '#ff8181' )
      root.style.setProperty('--bagColor', '#f4f5f7')

    } else {//现在白色变成黑色
      sessionStorage.setItem('wttandroid', false)
      
      $('#myRadio').addClass('active')
      $('.navigation').addClass('active')
      
      root.style.setProperty('--backColor', '#fff')
      root.style.setProperty('--borderline', '#00283A')
      root.style.setProperty('--headerCOlor', '#00283A')
      root.style.setProperty('--headerhover', 'rgb(0, 40, 58,.8)')
      root.style.setProperty('--headerFont', '#fff' )
      root.style.setProperty('--fontColor', '#00283A' )
      root.style.setProperty('--mainColor', '#ff8181' )
      root.style.setProperty('--bagColor','#02162b' )
    }
})



$('#minmenu').click(function () {
  // console.log('遮罩层')
  if ($('#minmenu').hasClass('active')) {
    $('#minmenu').removeClass('active');
    $('.menu_list').removeClass('active');

  } else {
    $('#minmenu').addClass('active')
    $('.menu_list').addClass('active')
  }
})




// loadding
  document.addEventListener("DOMContentLoaded", function() {
    let $loddingWrap = $('.lodding-wrap');
    if ($loddingWrap.length > 0) { // 确保元素存在
      let opacity = parseFloat($loddingWrap.css('opacity')) || 1; // 确保 opacity 是数字，默认为 1
      let timer = null;
      timer = setInterval(() => {
        opacity = Math.max(0, opacity - 0.1); // 确保 opacity 不会变成负数
        opacity = parseFloat(opacity.toFixed(2)); // 四舍五入到两位小数
        // console.log(opacity);
        if (opacity <= 0) {
          opacity = 0; // 防止 opacity 变成负数
          $loddingWrap.css('opacity', opacity);
          $loddingWrap.css('display', 'none');
          clearInterval(timer);
        } else {
          $loddingWrap.css('opacity', opacity);
        }
      }, 100);
    }
  });




            //锚点定位初始化
  function bindEvenInit(){
    $('.navbtn').bind("click touch",function () {
      //scrollTop 滚动到  $(this).attr('href')锚点关联id所在位置
      $('html,body').animate({scrollTop:($($(this).attr('href')).offset().top-100)},500)
      return false
    })
  }

  function setActive() {
    let currentUrl = encodeURIComponent(window.location.href);
    let navLinks = document.querySelectorAll('.header-nav li a');

    if (navLinks.length === 0) {
      return;
    }

    navLinks.forEach(function(link) {
      link.parentElement.classList.remove('active');
      let href = link.getAttribute('href');
      if (href && currentUrl.includes(encodeURIComponent(href))) {
        link.parentElement.classList.add('active');
      }
    });

  }




})()
document.addEventListener("DOMContentLoaded", function() {
  const spans = document.querySelectorAll('.me-hover span');
  spans.forEach(span => {
    span.addEventListener('animationend', function(event) {
      if (event.animationName === 'typing') {
        this.classList.add('typing-complete');
      }
    });
  });
});