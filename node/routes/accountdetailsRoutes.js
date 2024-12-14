const express = require('express');
const router = express.Router();
const accountDetailsController = require('../controllers/accountdetails');

// Define routes and link them to controller methods
router.post('/account-details', accountDetailsController.addAccountDetails);
router.get('/get/account-details', accountDetailsController.getAllAccountDetails);
router.get('/get/account-details/:id', accountDetailsController.getAccountDetailsById);
router.put('/edit/account-details/:id', accountDetailsController.updateAccountDetails);
router.delete('/delete/account-details/:id', accountDetailsController.deleteAccountDetails);

module.exports = router;
