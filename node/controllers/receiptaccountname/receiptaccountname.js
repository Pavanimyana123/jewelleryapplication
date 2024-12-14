const { fetchAccountNames } = require("./../../models/receiptaccountname/receiptaccountname");

const getAccountNames = (req, res) => {
    const accountGroups = [
        "Income (Indirect)",
        "Income (Direct/Opr.)",
        "CUSTOMERS",
      ];

  fetchAccountNames(accountGroups, (err, results) => {
    if (err) {
      console.error("Error fetching account names: ", err);
      return res.status(500).send({ error: "Database query error" });
    }
    res.json(results);
  });
};

module.exports = { getAccountNames };
