const express = require('express')
const router = express.Router()
const entrenamientoController = require('../controllers/usuario.controller.js');

router.get('/all', entrenamientoController.getUsuarios);
router.get('/:id', entrenamientoController.getProfile);
router.post('/new', entrenamientoController.newProfile);

module.exports = router;