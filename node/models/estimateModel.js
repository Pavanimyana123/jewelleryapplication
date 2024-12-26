const db = require("../db");
const insertEstimate = (data, callback) => {
  const sql = `
    INSERT INTO estimate (
      date, pcode, estimate_number, code, product_id, product_name, metal_type, design_master, purity, gross_weight,
      stones_weight, stones_price, weight_bw, wastage_on, wastage_percent,
      wastage_weight, total_weight, making_charges_on, mc_per_gram, total_mc,
      rate, rate_amt, tax_percent, tax_vat_amount, total_rs, total_amount
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `;

  db.query(sql, [
    data.date,
    data.pcode,
    data.estimate_number,
    data.code,
    data.product_id,
    data.product_name,
    data.metal_type,
    data.design_master,
    data.purity,
    data.gross_weight,
    data.stones_weight,
    data.stones_price,
    data.weight_bw,
    data.wastage_on,
    data.wastage_percent,
    data.wastage_weight,
    data.total_weight,
    data.making_charges_on,
    data.mc_per_gram,
    data.total_mc,
    data.rate,
    data.rate_amt,
    data.tax_percent,
    data.tax_vat_amount,
    data.total_rs,
    data.total_amount // Include the total amount here
  ], callback);
};


const getEstimates = (callback) => {
    const sql = "SELECT * FROM estimate";
    db.query(sql, callback);
  };

const updateEstimate = (id, data, callback) => {
    const sql = `UPDATE estimate SET
      date = ?, pcode = ?, estimate_number = ?,code = ?, product_id = ?, product_name = ?,metal_type = ?,design_master = ?,purity = ?, gross_weight = ?,
      stones_weight = ?, stones_price = ?, weight_bw = ?, wastage_on = ?, wastage_percent = ?,
      wastage_weight = ?, total_weight = ?, making_charges_on = ?, mc_per_gram = ?, total_mc = ?,
      rate = ?,rate_amt = ?, tax_percent = ?, tax_vat_amount = ?, total_rs = ?
    WHERE id = ?`;
  
    db.query(sql, [
      data.date, data.pcode, data.estimate_number,data.code, data.product_id, data.product_name,data.metal_type,data.design_master,data.purity, data.gross_weight,
      data.stones_weight, data.stones_price, data.weight_bw, data.wastage_on, data.wastage_percent,
      data.wastage_weight, data.total_weight, data.making_charges_on, data.mc_per_gram, data.total_mc,
      data.rate, data.rate_amt, data.tax_percent, data.tax_vat_amount, data.total_rs, id
    ], callback);
  };
  
  const deleteEstimate = (id, callback) => {
    const sql = "DELETE FROM estimate WHERE id = ?";
    db.query(sql, [id], callback);
  };

  const getLastEstimateNumber = (callback) => {
    const query = "SELECT estimate_number FROM estimate WHERE estimate_number LIKE 'EST%' ORDER BY estimate_id DESC";
    db.query(query, callback);
  };

  const getAllUniqueEstimates = (callback) => {
    const sql = `
      SELECT * 
      FROM estimate e1
      WHERE e1.estimate_id = (
        SELECT MAX(e2.estimate_id) 
        FROM estimate e2
        WHERE e1.estimate_number = e2.estimate_number
      )
    `;
    db.query(sql, callback);
  };
  
  const getByEstimateNumber = (estimateNumber, callback) => {
    const sql = `
      SELECT 
        date, pcode, estimate_number, code, product_id, product_name, metal_type, 
        design_master, purity, gross_weight, stones_weight, stones_price, weight_bw, 
        wastage_on, wastage_percent, wastage_weight, total_weight, making_charges_on, 
        mc_per_gram, total_mc, rate, rate_amt, tax_percent, tax_vat_amount, total_rs, total_amount
      FROM estimate
      WHERE estimate_number = ?
    `;
    db.query(sql, [estimateNumber], callback);
  };

  module.exports = {
    insertEstimate,
    getEstimates,
    updateEstimate,
    deleteEstimate,
    getLastEstimateNumber,
    getAllUniqueEstimates,
    getByEstimateNumber,
  };
