const express = require('express');
const productController = require('../controllers/productController');

const router = express.Router();

// POST: Add a new product
router.post('/api/products', productController.createProduct);
router.get('/get/products', productController.getProducts);
// router.get('/api/products', productController.fetchProducts);


module.exports = router;
