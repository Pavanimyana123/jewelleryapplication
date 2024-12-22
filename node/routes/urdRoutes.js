const express = require('express');
const urdPurchaseController = require('../controllers/urdController');

const router = express.Router();

// POST route for saving a purchase
router.post('/save-purchase', urdPurchaseController.saveUrdPurchase);

// GET route for fetching purchases
router.get('/get-purchases', urdPurchaseController.getUrdPurchases);

module.exports = router;