const db = require("./../../db");

exports.insert = (repairDetails, callback) => {
  const values = repairDetails.map((item) => {
    // Calculate totals for each repair detail
    const taxableAmount = repairDetails.reduce((sum, detail) => sum + detail.rate_amt, 0);
    const taxAmount = repairDetails.reduce((sum, detail) => sum + detail.tax_amt, 0);
    const netAmount = taxableAmount + taxAmount;

    return [
      item.customer_id,
      item.mobile,
      item.account_name,
      item.email,
      item.address1,
      item.address2,
      item.city,
      item.pincode,
      item.state,
      item.state_code,
      item.aadhar_card,
      item.gst_in,
      item.pan_card,
      item.date,
      item.invoice_number,
      item.code,
      item.product_id,
      item.metal,
      item.product_name,
      item.metal_type,
      item.design_name,
      item.purity,
      item.gross_weight,
      item.stone_weight,
      item.weight_bw,
      item.stone_price,
      item.va_on,
      item.va_percent,
      item.wastage_weight,
      item.total_weight_av,
      item.mc_on,
      item.mc_per_gram,
      item.making_charges,
      item.rate,
      item.rate_amt,
      item.tax_percent,
      item.tax_amt,
      item.total_price,
      item.cash_amount,
      item.card_amount,
      item.card_amt,
      item.chq,
      item.chq_amt,
      item.online,
      item.online_amt,
      item.transaction_status,
      item.qty,
      taxableAmount,
      taxAmount,
      netAmount,
    ];
  });

  const sql = `
    INSERT INTO repair_details (
      customer_id, mobile, account_name, email, address1, address2, city, 
      pincode, state, state_code, aadhar_card, gst_in, pan_card, date, 
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
      pincode, state, state_code, aadhar_card, gst_in, pan_card, date, 
      invoice_number, cash_amount, card_amount, card_amt, chq, chq_amt, online, 
      online_amt, transaction_status, qty, taxable_amount, tax_amount, net_amount
    FROM repair_details
    WHERE invoice_number = ?
  `;
  db.query(sql, [invoiceNumber], callback);
};
