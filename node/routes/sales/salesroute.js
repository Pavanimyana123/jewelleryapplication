const express = require("express");
const router = express.Router();
const repairController = require("./../../controllers/sales/sales");

router.post("/save-repair-details", repairController.saveRepairDetails);

module.exports = router;
