const express = require('express')
const router = express.Router()
const entrenamientoController = require('../controllers/entrenamiento.controller.js');

router.get('/all', entrenamientoController.getEntrenamientos);
router.get('/:id', entrenamientoController.getCurrentWorkout);

module.exports = router;