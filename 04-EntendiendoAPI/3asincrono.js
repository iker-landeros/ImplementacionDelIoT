// Promesas
// Async/Await

const funcion = () => {
    const x = 0
    return new Promise((resolve, reject) => {
        if (x == 0)
            resolve("Se cumplió la promesa")
        else
            reject("No se cumplió la promesa")
    })
}

/*const resultado = funcion()
.then(resultado => {
    console.log(resultado)
})
.catch(error => {
    console.log(error)
})*/

const nuevaPromesa = new Promise((resolve, reject) => {
    setTimeout(() => {
        resolve("Este es el resultado de la promesa")
    }, 3000)
})

console.log("Voy a pedir datos al servidor")
nuevaPromesa.then(resultado => {
    console.log(resultado)
})
console.log("Ya terminé")


const nuevaPromesa2 = () => {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve("Este es el resultado de la promesa")
        }, 3000)
    })
}

// Async/Await
// El await reuiere ejecutarse dentro de una función con async
const funcionAsync = async () => {
    console.log("Voy a esperar el resultado...")
    const resultado = await nuevaPromesa2()
    console.log(resultado)
}