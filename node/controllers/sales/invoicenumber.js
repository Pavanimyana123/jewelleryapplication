const invoiceModel = require("./../../models/sales/invoicenumber");

const getLastInvoiceNumber = (req, res) => {
  invoiceModel.getLastInvoiceNumber((err, result) => {
    if (err) {
      console.error("Error fetching last invoice number:", err);
      return res.status(500).json({ error: "Failed to fetch last invoice number" });
    }

    if (result.length > 0) {
      // Process invoice numbers to find the next one
      const invNumbers = result
        .map(row => row.invoice_number)
        .filter(invoice => invoice.startsWith("INV"))
        .map(invoice => parseInt(invoice.slice(3), 10)); // Extract numeric part

      const lastInvoiceNumber = Math.max(...invNumbers);
      const nextInvoiceNumber = `INV${String(lastInvoiceNumber + 1).padStart(3, "0")}`;

      res.json({ lastInvoiceNumber: nextInvoiceNumber });
    } else {
      res.json({ lastInvoiceNumber: "INV001" }); // Start with INV001
    }
  });
};

module.exports = { getLastInvoiceNumber };
