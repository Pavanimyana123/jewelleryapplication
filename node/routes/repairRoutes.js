const express = require('express');
const repairController = require('../controllers/repairController');

const router = express.Router();

router.post('/add/repairs', repairController.addRepair);
router.get('/get/repairs', repairController.getRepairs);
router.get('/get/repairs/:id', repairController.getRepairById);
router.put('/put/repairs/:id', repairController.updateRepair);
router.delete('/delete/repairs/:id', repairController.deleteRepair);
router.post('/update/repair-status/:id', repairController.updateRepairStatus);
router.post('/add/repair-details', repairController.addRepairDetails);



module.exports = router;
