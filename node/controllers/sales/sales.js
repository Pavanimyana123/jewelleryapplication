const repairModel = require("./../../models/sales/sales");

exports.saveRepairDetails = (req, res) => {
  const { repairDetails } = req.body;

  if (!repairDetails || !repairDetails.length) {
    return res.status(400).json({ message: "No data to save" });
  }

  repairModel.insert(repairDetails, (err) => {
    if (err) {
      console.error("Error saving data:", err);
      return res.status(500).json({ message: "Error saving data" });
    }
    res.json({ message: "Data saved successfully" });
  });
};

exports.getAllUniqueRepairDetails = (req, res) => {
  repairModel.getAllUniqueInvoices((err, results) => {
    if (err) {
      console.error("Error fetching data:", err);
      return res.status(500).json({ message: "Error fetching data" });
    }
    res.json(results);
  });
};


exports.getRepairDetailsByInvoiceNumber = (req, res) => {
  const { invoice_number } = req.params;

  if (!invoice_number) {
    return res.status(400).json({ message: "Invoice number is required" });
  }

  repairModel.getByInvoiceNumber(invoice_number, (err, results) => {
    if (err) {
      console.error("Error fetching data:", err);
      return res.status(500).json({ message: "Error fetching data" });
    }

    if (!results.length) {
      return res.status(404).json({ message: "No data found for the given invoice number" });
    }

    // Extract unique and repeated data
    const uniqueData = {
      customer_id: results[0].customer_id,
      mobile: results[0].mobile,
      account_name: results[0].account_name,
      email: results[0].email,
      address1: results[0].address1,
      address2: results[0].address2,
      city: results[0].city,
      pincode: results[0].pincode,
      state: results[0].state,
      state_code: results[0].state_code,
      aadhar_card: results[0].aadhar_card,
      gst_in: results[0].gst_in,
      pan_card: results[0].pan_card,
      date: results[0].date,
      invoice_number: results[0].invoice_number,
      cash_amount: results[0].cash_amount,
      card_amount: results[0].card_amount,
      card_amt: results[0].card_amt,
      chq: results[0].chq,
      chq_amt: results[0].chq_amt,
      online: results[0].online,
      online_amt: results[0].online_amt,
      transaction_status: results[0].transaction_status,
      qty: results[0].qty,
      taxable_amount: results[0].taxable_amount,
      tax_amount: results[0].tax_amount,
      net_amount: results[0].net_amount,
    };

    const repeatedData = results.map((row) => ({
      code: row.code,
      product_id: row.product_id,
      metal: row.metal,
      product_name: row.product_name,
      metal_type: row.metal_type,
      design_name: row.design_name,
      purity: row.purity,
      gross_weight: row.gross_weight,
      stone_weight: row.stone_weight,
      weight_bw: row.weight_bw,
      stone_price: row.stone_price,
      va_on: row.va_on,
      va_percent: row.va_percent,
      wastage_weight: row.wastage_weight,
      total_weight_av: row.total_weight_av,
      mc_on: row.mc_on,
      mc_per_gram: row.mc_per_gram,
      making_charges: row.making_charges,
      rate: row.rate,
      rate_amt: row.rate_amt,
      tax_percent: row.tax_percent,
      tax_amt: row.tax_amt,
      total_price: row.total_price,
    }));

    res.json({ uniqueData, repeatedData });
  });
};
