const express = require('express')
const router = express.Router()
const entrenamientoController = require('../controllers/entrenamiento.controller.js');

router.get('/', entrenamientoController.getEntrenamientos);

module.exports = router;