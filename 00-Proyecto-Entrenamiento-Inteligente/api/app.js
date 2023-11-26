const express = require('express');
const cors = require('cors');

const entrenamiento = require('./routes/entrenamiento');

const app = express();


app.use(express.json());

app.use(cors({
    origin: (origin, callback) => {
        const VALID_DOMAINS = [
            "http://127.0.0.1:5500/"
        ]

        if (VALID_DOMAINS.includes(origin)) {
            return callback(null, true)
        }

        // Si origin no existe o no tiene nada, es porque
        // la petición se está haciendo desde el mismo dominio
        if (!origin){
            return callback(null, true)
        }

        return callback(new Error("No permitido por CORS"))
    }
}))

app.use('/entrenamiento',entrenamiento);

app.listen(3000, () => console.log('Server started on port 3000'));