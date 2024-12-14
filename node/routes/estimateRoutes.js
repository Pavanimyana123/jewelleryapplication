const express = require('express');
const router = express.Router();
const estimateController = require("../controllers/estimateController");


router.post("/add/estimate", estimateController.addEstimate);
router.get('/get/estimates', estimateController.getEstimates);
router.put('/edit/estimate/:id', estimateController.updateEstimate);
router.delete('/delete/estimate/:id', estimateController.deleteEstimate);

module.exports = router;