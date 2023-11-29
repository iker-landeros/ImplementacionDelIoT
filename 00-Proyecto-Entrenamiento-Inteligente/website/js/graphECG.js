let dataECG = [114,146,122,127,144,112,141,130,117,147,117,133,139,114,145,124,124,145,113,139];
let labelsECG = [5,10,15,20,25,30,35,40,45,50,55,60,65,70,75];


document.addEventListener('DOMContentLoaded', function () {
  // Obtén el contexto del lienzo (canvas)
  var ctx = document.getElementById('graphECG').getContext('2d');

  // Definir los datos para la gráfica
  var data = {
      labels: labelsECG, // Eje X
      datasets: [{
          label: 'Electrocardiograma',
          data: dataECG,
          backgroundColor: '#308AC9', // Color de fondo
          borderColor: '#2C228C', // Color del borde
          borderWidth: 1.5 // Ancho del borde
      }]
  };

  // Configuración de la gráfica
  var options = {
      responsive: true,
      scales: {
          y: {
            min: 90, // Establecer el valor mínimo del eje y
            beginAtZero: false
          }
      }
  };

  // Crear la instancia de la gráfica
  var myChart = new Chart(ctx, {
      type: 'line', // Tipo de gráfica
      data: data,
      options: options
  });
});
