const express = require('express');
const PurchaseController = require('../controllers/purchaseController');

const router = express.Router();

router.post('/post/purchase', PurchaseController.addPurchase);
router.get('/get/purchases', PurchaseController.getPurchases);

module.exports = router;
