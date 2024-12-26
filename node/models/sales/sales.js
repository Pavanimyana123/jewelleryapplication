const db = require("./../../db");

exports.insert = (repairDetails, callback) => {
  if (!Array.isArray(repairDetails) || repairDetails.length === 0) {
    return callback(new Error("Invalid repairDetails array"));
  }

  // Precompute totals outside the map loop
  const taxableAmount = repairDetails.reduce((sum, detail) => {
    const stonePrice = parseFloat(detail.stone_price) || 0;
    const makingCharges = parseFloat(detail.making_charges) || 0;
    const rateAmt = parseFloat(detail.rate_amt) || 0;
    return sum + stonePrice + makingCharges + rateAmt;
  }, 0);

  const taxAmount = repairDetails.reduce((sum, detail) => {
    const taxAmt = parseFloat(detail.tax_amt) || 0;
    return sum + taxAmt;
  }, 0);

  const netAmount = taxableAmount + taxAmount;

  // Map to SQL values
  const values = repairDetails.map((item) => [
    item.customer_id || null,
    item.mobile || null,
    item.account_name || null,
    item.email || null,
    item.address1 || null,
    item.address2 || null,
    item.city || null,
    item.pincode || null,
    item.state || null,
    item.state_code || null,
    item.aadhar_card || null,
    item.gst_in || null,
    item.pan_card || null,
    item.terms || null,
    item.date || null,
    item.invoice_number || null,
    item.code || null,
    item.product_id || null,
    item.metal || null,
    item.product_name || null,
    item.metal_type || null,
    item.design_name || null,
    item.purity || null,
    item.gross_weight || null,
    item.stone_weight || null,
    item.weight_bw || null,
    item.stone_price || null,
    item.va_on || null,
    item.va_percent || null,
    item.wastage_weight || null,
    item.total_weight_av || null,
    item.mc_on || null,
    item.mc_per_gram || null,
    item.making_charges || null,
    item.rate || null,
    item.rate_amt || null,
    item.tax_percent || null,
    item.tax_amt || null,
    item.total_price || null,
    item.cash_amount || null,
    item.card_amount || null,
    item.card_amt || null,
    item.chq || null,
    item.chq_amt || null,
    item.online || null,
    item.online_amt || null,
    item.transaction_status || null,
    item.qty || null,
    taxableAmount,
    taxAmount,
    netAmount,
  ]);

  const sql = `
    INSERT INTO repair_details (
      customer_id, mobile, account_name, email, address1, address2, city, 
      pincode, state, state_code, aadhar_card, gst_in, pan_card,terms, date, 
      invoice_number, code, product_id, metal, product_name, metal_type, design_name, purity, 
      gross_weight, stone_weight, weight_bw, stone_price, va_on, va_percent, 
      wastage_weight, total_weight_av, mc_on, mc_per_gram, making_charges, rate, 
      rate_amt, tax_percent, tax_amt, total_price, cash_amount, card_amount, 
      card_amt, chq, chq_amt, online, online_amt, transaction_status, qty,
      taxable_amount, tax_amount, net_amount
    ) VALUES ?`;

  db.query(sql, [values], callback);
};


exports.getAllUniqueInvoices = (callback) => {
  const sql = `
    SELECT * 
    FROM repair_details r1
    WHERE r1.id = (
      SELECT MAX(r2.id) 
      FROM repair_details r2
      WHERE r1.invoice_number = r2.invoice_number
    )
  `;
  db.query(sql, callback);
};

exports.getByInvoiceNumber = (invoiceNumber, callback) => {
  const sql = `
    SELECT 
      code, product_id, metal, product_name, metal_type, design_name, purity, 
      gross_weight, stone_weight, weight_bw, stone_price, va_on, va_percent, 
      wastage_weight, total_weight_av, mc_on, mc_per_gram, making_charges, rate, 
      rate_amt, tax_percent, tax_amt, total_price,
      customer_id, mobile, account_name, email, address1, address2, city, 
      pincode, state, state_code, aadhar_card, gst_in, pan_card,terms, date, 
      invoice_number, cash_amount, card_amount, card_amt, chq, chq_amt, online, 
      online_amt, transaction_status, qty, taxable_amount, tax_amount, net_amount
    FROM repair_details
    WHERE invoice_number = ?
  `;
  db.query(sql, [invoiceNumber], callback);
};
