const iniciar = document.getElementById('iniciar');
iniciar.addEventListener('click', () => {
    const user = document.getElementById('user').value;
    const password = document.getElementById('password').value;

    fetch('http://localhost:3000/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },        
        body: JSON.stringify({
            user: user,
            password: password
        }),
    })
    const data = await result.json();
    if(data.ok && data.ok === true){
        alert("Iniciaste sesión correctamente")
    }else{
        alert("Usuario o contraseña incorrectos")
    }
})