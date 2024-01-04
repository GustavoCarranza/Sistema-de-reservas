<!-- graficas numero 1 -->
<div class="modal fade" id="graficas" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"><i class="bx bx-table"></i> Total de paxs en reservaciones</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <?php include('../../../Modelos/Paneles_control.php'); ?>

                <div class="contenido_graficos">
                   
                  <div class="cajas hoy">
                        <h4>Dia actual</h4>
                        <p>Pax en restaurantes: <?= $General_X_dia['restaurantes_reservas_hoy']; ?></p>
                        <p>Pax en destinations: <?= $General_X_dia['destinations_reservas_hoy']; ?></p>
                        <p>Pax en eventos: <?= $General_X_dia['eventos_reservas_hoy']; ?></p>
                  </div>
                    
                  <div class="cajas mañana">
                        <h4>Dia de mañana</h4>
                        <p>Pax en restaurante: <?= $General_X_dia['restaurantes_reservas_mañana']; ?></p>
                        <p>Pax en destinations: <?= $General_X_dia['destinations_reservas_mañana']; ?></p>
                        <p>Pax en eventos: <?= $General_X_dia['eventos_reservas_mañana']; ?></p>
                  </div>
                    
                  <div class="cajas pasado">
                        <h4>Pasado mañana</h4>
                        <p>Pax en restaurantes: <?= $General_X_dia['restaurantes_reservas_pasado']; ?></p>
                        <p>Pax en destinations: <?= $General_X_dia['destinations_reservas_pasado']; ?></p>
                        <p>Pax en eventos: <?= $General_X_dia['eventos_reservas_pasado']; ?></p>
                   </div>
                  
                </div>
      </div>
    </div>
  </div>
</div>
<!--Fin-->

<!-- graficos numero 2 -->
<div class="modal fade" id="graficas2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"><i class="bx bx-table"></i> Total de paxs por centro de consumo del día</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <?php include('../../../Modelos/Paneles_control.php'); ?>

                <div class="contenido_graficos2">
                   
                  <div class="cajas cello">
                        <h4>Cello</h4>
                        <p><?= $General_X_centro_consumo['cello']; ?></p>
                  </div>
                    
                  <div class="cajas copa">
                        <h4>Copa</h4>
                        <p><?= $General_X_centro_consumo['copa']; ?></p>
                  </div>
                    
                  <div class="cajas oriente">
                        <h4>Oriente</h4>
                        <p><?= $General_X_centro_consumo['oriente']; ?></p>
                   </div>
                   <div class="cajas tomahawk">
                        <h4>Tomahawk</h4>
                        <p><?= $General_X_centro_consumo['tomahawk']; ?></p>
                   </div>
                   <div class="cajas ember">
                        <h4>Ember</h4>
                        <p><?= $General_X_centro_consumo['ember']; ?></p>
                   </div>
                   <div class="cajas saffron">
                        <h4>Saffron</h4>
                        <p><?= $General_X_centro_consumo['saffron']; ?></p>
                   </div>
                   <div class="cajas sands">
                        <h4>Sands</h4>
                        <p><?= $General_X_centro_consumo['sands']; ?></p>
                   </div>
                   <div class="cajas haab">
                        <h4>Haab</h4>
                        <p><?= $General_X_centro_consumo['haab']; ?></p>
                   </div>
                   <div class="cajas latin">
                        <h4>Latin BBQ</h4>
                        <p><?= $General_X_centro_consumo['latin']; ?></p>
                   </div>
                   <div class="cajas noche">
                        <h4>Noche mexicana</h4>
                        <p><?= $General_X_centro_consumo['noche']; ?></p>
                   </div>
                  
                </div>
      </div>
    </div>
  </div>
</div>
<!--Fin-->