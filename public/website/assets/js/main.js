// Website main js 
console.log('script run...')

// navbar top sticy 
document.addEventListener("DOMContentLoaded", function(){
    window.addEventListener('scroll', function() {
        if (window.scrollY > 50) {
          document.getElementById('navbar_top').classList.add('fixed-top');
          // add padding top to show content behind navbar
          navbar_height = document.querySelector('.navbar').offsetHeight;
          document.body.style.paddingTop = navbar_height + 'px';
        } else {
          document.getElementById('navbar_top').classList.remove('fixed-top');
           // remove padding top from body
          document.body.style.paddingTop = '0';
        } 
    });
  }); 

  // data-counter
  // const counters = document.querySelectorAll(".counts");
  // const speed = 200;
  
  // counters.forEach((counter) => {
  //   const updateCount = () => {
  //     const target = parseInt(+counter.getAttribute("data-target"));
  //     const counts = parseInt(+counter.innerText);
  //     const increment = Math.trunc(target / speed);
  //     console.log(increment);
  
  //     if (counts < target) {
  //       counter.innerText = counts + increment;
  //       setTimeout(updateCount, 1);
  //     } else {
  //       counts.innerText = target;
  //     }
  //   };
  //   updateCount();
  // });


  $(".counter-my").each(function () {
    var $this = $(this),
      countTo = $this.attr("data-countto");
    countDuration = parseInt($this.attr("data-duration"));
    $({ counter: $this.text() }).animate(
      {
        counter: countTo
      },
      {
        duration: countDuration,
        easing: "linear",
        step: function () {
          $this.text(Math.floor(this.counter));
        },
        complete: function () {
          $this.text(this.counter);
        }
      }
    );
  });
  
// slick slider

  $('.responsive').slick({
    prevArrow: false,
    nextArrow: false,
    autoplay: true,
    autoplaySpeed: 1000,
    dots: false,
    nav: false,
    infinite: false,
    speed: 300,
    slidesToShow: 3,
    slidesToScroll: 3,
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 3,
          slidesToScroll: 3,
          infinite: true,
          dots: false
        }
      },
      {
        breakpoint: 600,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
      // You can unslick at a given breakpoint now by adding:
      // settings: "unslick"
      // instead of a settings object
    ]
  });

  // client-logo slider
  $(document).ready(function(){
    $('.customer-logos').slick({
        slidesToShow: 6,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 1500,
        arrows: false,
        dots: false,
        pauseOnHover: false,
        responsive: [{
            breakpoint: 768,
            settings: {
                slidesToShow: 4
            }
        }, {
            breakpoint: 520,
            settings: {
                slidesToShow: 3
            }
        }]
    });
});

// nav-tabs-company-registration
// BEGIN One Page
var $doc = $(document),
    $sections = $('.section'),
    $menu = $('.main-nav a'),
    $body = $('html,body');

var topToIndex = function(scrollTop) {
  var offsetTop = 0,
      indexlastSection;
  $sections.each(function(i){
    offsetTop = $(this).offset().top;
    if ( scrollTop > offsetTop - 100 ) {
    	indexlastSection = i;
    }
  })
  return indexlastSection;
}

var retrieveActive = function() {
  var scrollTop = $doc.scrollTop(),
      activeIndex = topToIndex(scrollTop);
  $('#debug').text( scrollTop )
  $sections.removeClass('active').eq(activeIndex).addClass('active')
  $menu.removeClass('active').eq(activeIndex).addClass('active')
  return activeIndex;
}

$doc.keydown(function(e) {
  // e.preventDefault()

  var $active = $sections.filter('.active'),
      $prev = $active.prev('.section'),
      $next = $active.next('.section');
  
	if (e.keyCode == 37 || e.keyCode == 38) { 
		$body.animate({
			scrollTop: $prev.length ? $prev.offset().top : $active.offset().top
		}, 400);
	}
	if (e.keyCode == 39 || e.keyCode == 40) { 
		$body.animate({
			scrollTop: $next.length ? $next.offset().top : $active.offset().top
		}, 400);
	}
});
// END One Page

/*
$('body').append('<div id ="debug" style="position:fixed;top:0;left:0;background:#0f0;" />')
$doc.on('scroll', function() {
  retrieveActive()
})
retrieveActive()
*/

// @link https://css-tricks.com/snippets/jquery/smooth-scrolling/
$(function() {
  $('a[href*="#"]:not([href="#"])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $body.animate({
          scrollTop: target.offset().top
        }, 400);
        return false;
      }
    }
  });
});

// impact css
setTimeout(function start (){
  
  $('.bar').each(function(i){  
    var $bar = $(this);
    $(this).append('<span class="count"></span>')
    setTimeout(function(){
      $bar.css('width', $bar.attr('data-percent'));      
    }, i*100);
  });

$('.count').each(function () {
    $(this).prop('Counter',0).animate({
        Counter: $(this).parent('.bar').attr('data-percent')
    }, {
        duration: 2000,
        easing: 'swing',
        step: function (now) {
            $(this).text(Math.ceil(now) +'%');
        }
    });
});

}, 500);


// typing script in input feild
const texts = ['Company Registration..','Licenses..','Corporate Compliance..','Accounting & Tax..','Trademark & ISO..','GST..','NGO..'];
const input = document.querySelector('#searchbox');
const animationWorker = function (input, texts) {
  this.input = input;
  this.defaultPlaceholder = this.input.getAttribute('placeholder');
  this.texts = texts;
  this.curTextNum = 0;
  this.curPlaceholder = '';
  this.blinkCounter = 0;
  this.animationFrameId = 0;
  this.animationActive = false;
  this.input.setAttribute('placeholder',this.curPlaceholder);

  this.switch = (timeout) => {
    this.input.classList.add('imitatefocus');
    setTimeout(
      () => { 
        this.input.classList.remove('imitatefocus');
        if (this.curTextNum == 0) 
          this.input.setAttribute('placeholder',this.defaultPlaceholder);
        else
          this.input.setAttribute('placeholder',this.curPlaceholder);

        setTimeout(
          () => { 
            this.input.setAttribute('placeholder',this.curPlaceholder);
            if(this.animationActive) 
              this.animationFrameId = window.requestAnimationFrame(this.animate)}, 
          timeout);
      }, 
      timeout);
  }

  this.animate = () => {
    if(!this.animationActive) return;
    let curPlaceholderFullText = this.texts[this.curTextNum];
    let timeout = 900;
    if (this.curPlaceholder == curPlaceholderFullText+'|' && this.blinkCounter==3) {
      this.blinkCounter = 0;
      this.curTextNum = (this.curTextNum >= this.texts.length-1)? 0 : this.curTextNum+1;
      this.curPlaceholder = '|';
      this.switch(3000);
      return;
    }
    else if (this.curPlaceholder == curPlaceholderFullText+'|' && this.blinkCounter<3) {
      this.curPlaceholder = curPlaceholderFullText;
      this.blinkCounter++;
    }
    else if (this.curPlaceholder == curPlaceholderFullText && this.blinkCounter<3) {
      this.curPlaceholder = this.curPlaceholder+'|';
    }
    else {
      this.curPlaceholder = curPlaceholderFullText
        .split('')
        .slice(0,this.curPlaceholder.length+1)
        .join('') + '|';
      timeout = 150;
    }
    this.input.setAttribute('placeholder',this.curPlaceholder);
    setTimeout(
      () => { if(this.animationActive) this.animationFrameId = window.requestAnimationFrame(this.animate)}, 
      timeout);
  }

  this.stop = () => {
    this.animationActive = false;
    window.cancelAnimationFrame(this.animationFrameId);
  }

  this.start = () => {
    this.animationActive = true;
    this.animationFrameId = window.requestAnimationFrame(this.animate);
    return this;
  }
}

document.addEventListener("DOMContentLoaded", () => {
  let aw = new animationWorker(input, texts).start();
  input.addEventListener("focus", (e) => aw.stop());
  input.addEventListener("blur", (e) => {
    aw = new animationWorker(input, texts);
    if(e.target.value == '') setTimeout( aw.start, 2000);
  });
});


// chat popup

$('.top-fees-slider').slick({
  centerMode: true,
  centerPadding: '60px',
  slidesToShow: 3,
  dots: false,
  arrows: false,
  responsive: [
    {
      breakpoint: 768,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '40px',
        slidesToShow: 3
      }
    },
    {
      breakpoint: 480,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '10px',
        slidesToShow: 1
      }
    }
  ]
});
// $('.overview-slide').slick({
//   centerMode: true,
//   centerPadding: '60px',
//   slidesToShow: 3,
//   dots: false, 
//   arrows:true,
//   responsive: [
//     {
//       breakpoint: 768,
//       settings: {
//         centerMode: true,
//         centerPadding: '40px',
//         slidesToShow: 3
//       }
//     },
//     {
//       breakpoint: 480,
//       settings: {
//         centerMode: true,
//         centerPadding: '40px',
//         slidesToShow: 1
//       }
//     }
//   ]
// });
$(document).ready(function () {
	$(".overview-slide").slick({
		slidesToShow: 4,
		slidesToScroll: 1,
		arrows: true,
		infinite: false,
		autoplay: false
	});
	$(".prev-btn").click(function () {
		$(".overview-slide").slick("slickPrev");
	});

	$(".next-btn").click(function () {
		$(".overview-slide").slick("slickNext");
	});
	$(".prev-btn").addClass("slick-disabled");
	$(".overview-slide .slick-list").on("afterChange", function () {
		if ($(".slick-prev").hasClass("slick-disabled")) {
			$(".prev-btn").addClass("slick-disabled");
		} else {
			$(".prev-btn").removeClass("slick-disabled");
		}
		if ($(".slick-next").hasClass("slick-disabled")) {
			$(".next-btn").addClass("slick-disabled");
		} else {
			$(".next-btn").removeClass("slick-disabled");
		}
	});
});


