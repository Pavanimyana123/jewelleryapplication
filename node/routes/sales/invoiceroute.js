const express = require("express");
const invoiceController = require("./../../controllers/sales/invoicenumber");

const router = express.Router();

router.get("/lastInvoiceNumber", invoiceController.getLastInvoiceNumber);

module.exports = router;
