window.addEventListener('message', (event) => { 
    let v = event.data
    switch (v.action) {
        case 'show':
            $('.container').fadeIn(200)
            let count = 0;
            let intervalTime = v.time / 100;
            $('span').html(v.name)
            $('p').html(`${v.title} x${v.remove} ${v.name}`)
            let interval = setInterval(function() {
              if (count === 100) {
                clearInterval(interval);
                $(".container").fadeOut(150); 
              }
              count++;
              $(".dentro").css("width", count + '%');
            }, intervalTime);
            
        break;

        case 'showZone': {
          v.inzone ? $('.container-inZone').fadeIn(200) : $('.container-inZone').fadeOut(200)  
        break;
        }
    }
});


