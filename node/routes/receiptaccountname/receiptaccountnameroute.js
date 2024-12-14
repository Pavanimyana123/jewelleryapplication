const express = require("express");
const { getAccountNames } = require("./../../controllers/receiptaccountname/receiptaccountname");

const router = express.Router();

// Route for fetching account names
router.get("/account-names", getAccountNames);

module.exports = router;
