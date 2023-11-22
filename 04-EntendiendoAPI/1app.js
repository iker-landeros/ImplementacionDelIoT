// Declaración de variables
//var // Se genera variable global
//let // Se genera variable local (solo dentro de la función)
//const // Se genera variable constante

var x = 0;

function suma() {
    let y = 2
}

const ENDPOINT = "http://..."; // Variable constante

// Funciones
function suma(x,y){
    return x + y
}

console.log(suma(3,4))

const suma2 = function(x,y){
    return x + y
}

console.log(suma2(3,4))

//Arrow functions, Lambda functions
const suma3 = (x,y) => {
    return x + y
}

console.log(suma3(3,4))

// Implícitas
const suma4 = (x,y) => x + y

console.log(suma4(3,4))

// Strings
const cadena = "Hola mundo!"

console.log(cadena)

// Interpolación de cadenas, String literals
const usuario = "Iker"
console.log(`Hola ${usuario}!`)

// Arreglos
const arreglo = [1,2,3,4,5,6,7,8,9,10]
console.log(arreglo)

for(i=0; i<arreglo.length; i++){
    console.log(arreglo[i])
}

// Callback
console.log("FOR EACH")
arreglo.forEach((elemento) => {
    console.log(elemento)
})

// Map
console.log("MAP")
const nuevoArreglo = arreglo.map((elemento) => elemento * 2)
console.log(nuevoArreglo)


const arreglo1 = [1,2,3]
const arreglo2 = [4,5,6]

// Spread operator
const arreglo3 = [...arreglo1, ...arreglo2]
console.log(arreglo3)

const [a, ,c] = [...arreglo1]
console.log(a)
console.log(c)

const funcionQueDevuelveArreglo = () => {
    return ["Camisa", 15 ,400]
}

const [producto, ,precio] = [...funcionQueDevuelveArreglo()]
console.log(producto)


// Objetos
let alumno = {
    nombre: "Iker",
    edad: 21,
    carrera: "ITC",
    direccion: {
        calle: "Calle 1",
        numero: 123
    },
    estado: "Morelos",
}

console.log(alumno)

alumno = { 
    ...alumno,
    municipio: "Cuernavaca"
}
console.log(alumno)

const {nombre, municipio} = {...alumno}
console.log(nombre, municipio)