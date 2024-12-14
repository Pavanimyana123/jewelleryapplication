const express = require('express');
const PaymentController = require('../controllers/paymentController');

const router = express.Router();

router.post('/post/payments', PaymentController.addPayment);
router.get('/get/payments', PaymentController.getPayments);
router.put('/edit/payments/:payment_id', PaymentController.updatePayment);
router.delete('/delete/payments/:payment_id', PaymentController.deletePayment);

module.exports = router;
