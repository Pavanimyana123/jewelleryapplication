const db = require('../db');

const PurchaseModel = {
  insertPurchase: (mergedValues, callback) => {
    const sql = `
      INSERT INTO purchase (
        account_name, mobile, email, address1, address2, city, pincode, state, state_code, aadhar_card, gst_in, pan_card,
        indent, bill_no, type, rate_cut, date, bill_date, due_date, Purchase_rate, 
        product_id, product_name, metal_type, design_name, purity, hsn, product_type, stock_type, pcs, gross_weight, stone_weight, net_weight,
        unit_weight, waste_percentage, waste_amount, pure_weight, alloy, cost, total_weight,
        wt_rate_amount, mc_per_gram, mc, stone_amount, total_amount, stone, stone_pcs, stone_ct, cwp, gms, stone_rate, clarity, rate, clear, class, cut
      ) VALUES ?`;

    db.query(sql, [mergedValues], callback);
  },

  getAllPurchases: (callback) => {
    const sql = 'SELECT * FROM purchase';
    db.query(sql, callback);
  },
};

module.exports = PurchaseModel;
