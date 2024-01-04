new DataTable('#tablas_generales', {
    "bSort" : false,
    responsive: true,
    columnDefs: [
        {
            targets: -1, // Última columna (columna de acciones)
            responsivePriority: 1 // Asigna una prioridad alta para la última columna
        }
    ],
    
});