const express = require('express');
const router = express.Router();
const accountsgroupController = require('./../controllers/accountGroup');

router.get('/accountsgroup', accountsgroupController.getAccountsGroup);

module.exports = router;
