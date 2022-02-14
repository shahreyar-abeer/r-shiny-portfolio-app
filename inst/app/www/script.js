$( document ).ready(function() {
  
  let done
  
  // initiate pagepiling
  // rstudio color: #75aadb
  $('#pagepiling').pagepiling({
    sectionsColor: ['#e6eaec', '#A2A392', '#F6F4F2', '#75aadb', '#000'],
  	anchors: ["gallery", "secondPage", "thirdPage", "me"],
  	loopTop: true,
  	loopBottom: true,
  	verticalCentered: false,
    navigation: {
        'textColor': '#00171F',
        'bulletsColor': '#00171F',
        'position': 'right',
        'tooltips': ['Gallery', 'section2', 'section3', 'section4']
    },
    
    afterLoad: function(anchorLink) {
      console.log(done)
      if (anchorLink == "me") {
        if (!done) {
          var typed = new Typed('#typed', {
            stringsElement: '.about-me',
            startDelay: 50,
            typeSpeed: 40,
            onComplete: function(t) {
              setTimeout(function() {
                $(".typed-cursor").hide();
              }, 2000);
            }
          });
          done = true;
        }
        
      }
    }
    
  });
  
  
  
});
