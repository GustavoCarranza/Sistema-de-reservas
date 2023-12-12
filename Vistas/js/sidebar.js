//Menu responsivo sidebar
(function(){
    const abrir_menu = document.querySelector('.nav_menu');
    const menu = document.querySelector('.nav_link');
    const cerrar = document.querySelector('.nav_cerrar');
  
    abrir_menu.addEventListener('click', ()=>{
         menu.classList.add('nav_link--show');  
  
    });
    cerrar.addEventListener('click', ()=>{
         menu.classList.remove('nav_link--show');
    })
  
  })();
  
  //Buscador de usuarios//
  $(document).ready(function(){
       $('.icono').click(function(){
            $('.buscador'.toggleClss('active'))
       })
  });
  


  