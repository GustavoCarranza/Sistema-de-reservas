<!-- Exportar reservaciones en PDF -->
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
                        <p>Pax en restaurantes: <?= $General_X_dia['restaurantes_reservas_pasado']; ?></p>
                        <p>Pax en restaurantes: <?= $General_X_dia['restaurantes_reservas_pasado']; ?></p>
                   </div>
                  
                </div>
      </div>
    </div>
  </div>
</div>
<!--Fin-->