const express = require('express');
const { registerUser } = require('../Controllers/registerController');
const { loginUser } = require('../Controllers/loginController');


const router = express.Router();

// Routes
router.post('/register', registerUser);
router.post('/login', loginUser);



module.exports = router;
