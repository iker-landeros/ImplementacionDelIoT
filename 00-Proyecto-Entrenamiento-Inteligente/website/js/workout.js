// Para obtener los datos de stats // workout.html
const getStatsECG = async () => {
    try {
        const results = await fetch(`http://smartflex.us-east-1.elasticbeanstalk.com/entrenamiento/stats`, {
            method: "GET",
            // No incluir el header "Content-Type" en una solicitud GET
        });
        const data = await results.json();
        return data;
    } catch (error) {
        console.error("Error al obtener los datos del usuario:", error);
        return null;
    }
};


const getStatsTemperatura = async () => {
    try {
        const results = await fetch(`http://smartflex.us-east-1.elasticbeanstalk.com/entrenamiento/stats`, {
            method: "GET",
            // No incluir el header "Content-Type" en una solicitud GET
        });
        const data = await results.json();
        return data;
    } catch (error) {
        console.error("Error al obtener los datos del usuario:", error);
        return null;
    }
};

const getStatsRC = async () => {
    try {
        const results = await fetch(`http://smartflex.us-east-1.elasticbeanstalk.com/entrenamiento/stats`, {
            method: "GET",
            // No incluir el header "Content-Type" en una solicitud GET
        });
        const data = await results.json();
        return data;
    } catch (error) {
        console.error("Error al obtener los datos del usuario:", error);
        return null;
    }
};



// Para obtener los datos del entrenamiento // workout.html
document.addEventListener('DOMContentLoaded', async function () {

    const optionsRestart = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
    };

    // URL de tu endpoint
    const url = 'http://smartflex.us-east-1.elasticbeanstalk.com/entrenamiento/restart';

    // Realizar la solicitud fetch en cada carga de página
    fetch(url, optionsRestart)
        .then(response => response.json())
        .then(data => {
            // Manejar los datos recibidos
            console.log('Datos recibidos:', data);
        })
        .catch(error => {
            // Manejar errores
            console.error('Error en la solicitud fetch:', error);
            alert('Ocurrió un error al realizar la solicitud.');
        });

    // Obtén el contexto del lienzo (canvas)
    var ECG = document.getElementById('graphECG').getContext('2d');

    // Definir los datos para la gráfica
    // Jalar los datos de la base de datos
    const statsData = await getStatsECG();

    //let dataECG = [];
    let d1 = statsData[0].ECG;
    let d2 = statsData[1].ECG;
    let d3 = statsData[2].ECG;
    let d4 = statsData[3].ECG;
    let d5 = statsData[4].ECG;
    let d6 = statsData[5].ECG;
    let d7 = statsData[6].ECG;
    let d8 = statsData[7].ECG;
    let d9 = statsData[8].ECG;
    let d10 = statsData[9].ECG;
    let d11 = statsData[10].ECG;
    let d12 = statsData[11].ECG;
    let d13 = statsData[12].ECG;
    let d14 = statsData[13].ECG;
    let d15 = statsData[14].ECG;
    let d16 = statsData[15].ECG;
    let d17 = statsData[16].ECG;
    let d18 = statsData[17].ECG;
    let d19 = statsData[18].ECG;
    let d20 = statsData[19].ECG;

    let dataECG = [d20, d19, d18, d17, d16, d15, d14, d13, d12, d11, d10, d9, d8, d7, d6, d5, d4, d3, d2, d1];

    let s1 = statsData[0].segundo;
    let s2 = statsData[1].segundo;
    let s3 = statsData[2].segundo;
    let s4 = statsData[3].segundo;
    let s5 = statsData[4].segundo;
    let s6 = statsData[5].segundo;
    let s7 = statsData[6].segundo;
    let s8 = statsData[7].segundo;
    let s9 = statsData[8].segundo;
    let s10 = statsData[9].segundo;
    let s11 = statsData[10].segundo;
    let s12 = statsData[11].segundo;
    let s13 = statsData[12].segundo;
    let s14 = statsData[13].segundo;
    let s15 = statsData[14].segundo;
    let s16 = statsData[15].segundo;
    let s17 = statsData[16].segundo;
    let s18 = statsData[17].segundo;
    let s19 = statsData[18].segundo;
    let s20 = statsData[19].segundo;
    let labelsECG = [s20, s19, s18, s17, s16, s15, s14, s13, s12, s11, s10, s9, s8, s7, s6, s5, s4, s3, s2, s1];

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
                beginAtZero: true
            }
        }
    };

    // Crear la instancia de la gráfica
    var myChart = new Chart(ECG, {
        type: 'line', // Tipo de gráfica
        data: data,
        options: options
    });


    //setInterval(updateChart, 1000);


    // Obtén el contexto del lienzo (canvas)
    var temperatura = document.getElementById('graphTemperatura').getContext('2d');

    // Definir los datos para la gráfica
    // Jalar los datos de la base de datos
    const statsDataTemp = await getStatsTemperatura();

    let d1t = statsDataTemp[0].temperatura;
    let d2t = statsDataTemp[1].temperatura;
    let d3t = statsDataTemp[2].temperatura;
    let d4t = statsDataTemp[3].temperatura;
    let d5t = statsDataTemp[4].temperatura;
    let d6t = statsDataTemp[5].temperatura;
    let d7t = statsDataTemp[6].temperatura;
    let d8t = statsDataTemp[7].temperatura;
    let d9t = statsDataTemp[8].temperatura;
    let d10t = statsDataTemp[9].temperatura;
    let d11t = statsDataTemp[10].temperatura;
    let d12t = statsDataTemp[11].temperatura;
    let d13t = statsDataTemp[12].temperatura;
    let d14t = statsDataTemp[13].temperatura;
    let d15t = statsDataTemp[14].temperatura;
    let d16t = statsDataTemp[15].temperatura;
    let d17t = statsDataTemp[16].temperatura;
    let d18t = statsDataTemp[17].temperatura;
    let d19t = statsDataTemp[18].temperatura;
    let d20t = statsDataTemp[19].temperatura;

    let dataTemperatura = [d20t, d19t, d18t, d17t, d16t, d15t, d14t, d13t, d12t, d11t, d10t, d9t, d8t, d7t, d6t, d5t, d4t, d3t, d2t, d1t];

    let labelsTemperatura = [s20, s19, s18, s17, s16, s15, s14, s13, s12, s11, s10, s9, s8, s7, s6, s5, s4, s3, s2, s1];

    var data = {
        labels: labelsTemperatura, // Eje X
        datasets: [{
            label: 'Temperatura en °C',
            data: dataTemperatura,
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
                min: 20, // Establecer el valor mínimo del eje y
                beginAtZero: false
            }
        }
    };

    // Crear la instancia de la gráfica
    var myChart = new Chart(temperatura, {
        type: 'line', // Tipo de gráfica
        data: data,
        options: options
    });




    var ritmoCardiaco = document.getElementById('graphRitmoCardiaco').getContext('2d');

    // Definir los datos para la gráfica
    // Jalar los datos de la base de datos
    const statsDatarC = await getStatsRC();

    let d1rC = statsDatarC[0].ritmoCardiaco;
    let d2rC = statsDatarC[1].ritmoCardiaco;
    let d3rC = statsDatarC[2].ritmoCardiaco;
    let d4rC = statsDatarC[3].ritmoCardiaco;
    let d5rC = statsDatarC[4].ritmoCardiaco;
    let d6rC = statsDatarC[5].ritmoCardiaco;
    let d7rC = statsDatarC[6].ritmoCardiaco;
    let d8rC = statsDatarC[7].ritmoCardiaco;
    let d9rC = statsDatarC[8].ritmoCardiaco;
    let d10rC = statsDatarC[9].ritmoCardiaco;
    let d11rC = statsDatarC[10].ritmoCardiaco;
    let d12rC = statsDatarC[11].ritmoCardiaco;
    let d13rC = statsDatarC[12].ritmoCardiaco;
    let d14rC = statsDatarC[13].ritmoCardiaco;
    let d15rC = statsDatarC[14].ritmoCardiaco;
    let d16rC = statsDatarC[15].ritmoCardiaco;
    let d17rC = statsDatarC[16].ritmoCardiaco;
    let d18rC = statsDatarC[17].ritmoCardiaco;
    let d19rC = statsDatarC[18].ritmoCardiaco;
    let d20rC = statsDatarC[19].ritmoCardiaco;

    let dataRC = [d20rC, d19rC, d18rC, d17rC, d16rC, d15rC, d14rC, d13rC, d12rC, d11rC, d10rC, d9rC, d8rC, d7rC, d6rC, d5rC, d4rC, d3rC, d2rC, d1rC];

    let labelsRC = [s20, s19, s18, s17, s16, s15, s14, s13, s12, s11, s10, s9, s8, s7, s6, s5, s4, s3, s2, s1];

    var data = {
        labels: labelsRC, // Eje X
        datasets: [{
            label: 'Ritmo Cardiaco',
            data: dataRC,
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
                beginAtZero: true
            }
        }
    };

    // Crear la instancia de la gráfica
    var myChart = new Chart(ritmoCardiaco, {
        type: 'line', // Tipo de gráfica
        data: data,
        options: options
    });


    const updateData = async () => {
        // Obtener los datos actualizados para ECG
        const statsDataECG = await getStatsECG();
        // Actualizar los datos de la gráfica ECG
        updateChart(ECG, statsDataECG);
    
        // Obtener los datos actualizados para Temperatura
        const statsDataTemp = await getStatsTemperatura();
        // Actualizar los datos de la gráfica de Temperatura
        updateChart(temperatura, statsDataTemp);
    
        // Obtener los datos actualizados para Ritmo Cardiaco
        const statsDataRC = await getStatsRC();
        // Actualizar los datos de la gráfica de Ritmo Cardiaco
        updateChart(ritmoCardiaco, statsDataRC);
    };


    const updateChart = (chart, newData) => {
        // Actualizar los datos y las etiquetas de la gráfica
        chart.data.labels = newData.map(entry => entry.segundo);
        chart.data.datasets[0].data = newData.map(entry => entry.ECG);
    
        // Actualizar la gráfica
        chart.update();
    };

    

    document.addEventListener('DOMContentLoaded', async function () {
        // ... (código existente)
    
        // Crear la instancia de la gráfica ECG
        var myChartECG = new Chart(ECG, {
            type: 'line',
            data: dataECG,
            options: options
        });
    
        // Crear la instancia de la gráfica de Temperatura
        var myChartTemperatura = new Chart(temperatura, {
            type: 'line',
            data: dataTemperatura,
            options: options
        });
    
        // Crear la instancia de la gráfica de Ritmo Cardiaco
        var myChartRC = new Chart(ritmoCardiaco, {
            type: 'line',
            data: dataRC,
            options: options
        });
    
        // Actualizar los datos cada 1000 milisegundos (1 segundo)
        setInterval(updateData, 1000);
    });
    








    // Barra de progreso
    // Obtén la referencia del elemento de la barra de progreso
    var progressBar = document.getElementById("time");

    // Inicializa el valor de la barra de progreso
    let progressValue = 0;



    // Define el valor de incremento de la barra de progreso

    let selectedTraining = localStorage.getItem('selectedTraining');

    if (selectedTraining == "Caminadora") {
        workoutSeconds = 1 / 6;
    } else if (selectedTraining == "Bicicleta") {
        workoutSeconds = 1 / 9;
    }

    // Define la función que incrementa el valor de la barra de progreso
    function incrementarProgreso() {
        if (progressValue < 100) {
            // Incrementa el valor
            progressValue += workoutSeconds;

            // Actualiza el valor de la barra de progreso
            progressBar.value = progressValue;
        } else {
            // Si ya alcanzó el 100%, detén el temporizador
            clearInterval(temporizador);
            window.location.href = 'profile.html';
        }
    }

    var botonDetener = document.getElementById('stop');

    // Agrega un evento de clic al botón
    botonDetener.addEventListener('click', function () {
        // Redirige a la página que desees
        window.location.href = 'profile.html';
    });

    function ReiniciarCounter() {
        // Multiplicar progressValue por 0
        progressValue *= 0;

        // Puedes imprimir el nuevo valor en la consola para verificar
        console.log("Nuevo valor de progressValue:", progressValue);
    }

    // Obtener el botón por su ID
    var pausaPlayButton = document.getElementById("reiniciar");

    // Agregar un event listener para el clic en el botón
    pausaPlayButton.addEventListener("click", ReiniciarCounter);

    // Establece un temporizador que llama a la función cada segundo (1000 milisegundos)
    var temporizador = setInterval(incrementarProgreso, 1000);


    var pausaPlayButton = document.getElementById("pausa-play");

    function togglePausaPlay() {
        if (temporizador) {
            clearInterval(temporizador);
            temporizador = null;
        } else {
            iniciarTemporizador();
        }
    }
    
    function iniciarTemporizador() {
        temporizador = setInterval(incrementarProgreso, 1000);
    }
    
    pausaPlayButton.addEventListener("click", togglePausaPlay);
});
