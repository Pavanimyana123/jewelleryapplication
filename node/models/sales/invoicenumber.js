const db = require("./../../db");

const getLastInvoiceNumber = (callback) => {
  const query = "SELECT invoice_number FROM repair_details WHERE invoice_number LIKE 'INV%' ORDER BY id DESC";
  db.query(query, callback);
};

module.exports = { getLastInvoiceNumber };
