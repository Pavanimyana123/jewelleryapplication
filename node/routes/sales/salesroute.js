const express = require("express");
const router = express.Router();
const repairController = require("./../../controllers/sales/sales");

router.post("/save-repair-details", repairController.saveRepairDetails);
router.get("/get-unique-repair-details", repairController.getAllUniqueRepairDetails);
router.get("/get-repair-details/:invoice_number", repairController.getRepairDetailsByInvoiceNumber);


module.exports = router;
