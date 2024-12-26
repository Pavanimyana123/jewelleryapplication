const db = require('../db'); // Assuming you have a database connection file

// Function to insert purchase details into the database
const insertUrdPurchaseDetail = (customerDetails, item, callback) => {
  const query = `
    INSERT INTO urd_purchase_details 
    (customer_id, account_name, mobile, email, address1, address2, city, state, state_code, aadhar_card, gst_in, 
     pan_card, date, urdpurchase_number, product_id, product_name, metal, purity, hsn_code, gross, dust, touch_percent, 
     ml_percent, eqt_wt, remarks, rate, total_amount)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;

  db.query(query, [
    customerDetails.customer_id,
    customerDetails.account_name,
    customerDetails.mobile,
    customerDetails.email,
    customerDetails.address1,
    customerDetails.address2,
    customerDetails.city,
    customerDetails.state,
    customerDetails.state_code,
    customerDetails.aadhar_card,
    customerDetails.gst_in,
    customerDetails.pan_card,
    customerDetails.date,
    customerDetails.urdpurchase_number,
    item.product_id,
    item.product_name,
    item.metal,
    item.purity,
    item.hsn_code,
    item.gross,
    item.dust,
    item.touch_percent,
    item.ml_percent,
    item.eqt_wt,
    item.remarks,
    item.rate,
    item.total_amount,
  ], callback);
};

const getAllPurchases = (callback) => {
  const query = `
    SELECT 
      urd.customer_id, 
      urd.account_name, 
      urd.mobile, 
      urd.email, 
      urd.address1, 
      urd.address2, 
      urd.city, 
      urd.state, 
      urd.state_code, 
      urd.aadhar_card, 
      urd.gst_in, 
      urd.pan_card, 
      urd.date, 
      urd.urdpurchase_number, 
      urd.product_id, 
      urd.product_name, 
      urd.metal, 
      urd.purity, 
      urd.hsn_code, 
      urd.gross, 
      urd.dust, 
      urd.touch_percent, 
      urd.ml_percent, 
      urd.eqt_wt, 
      urd.remarks, 
      urd.rate, 
      urd.total_amount
    FROM urd_purchase_details urd
    ORDER BY urd.date DESC`;

  db.query(query, callback);
};

const getLastURDPurchaseNumber = (callback) => {
  const query = "SELECT urdpurchase_number FROM estimate WHERE urdpurchase_number LIKE 'EST%' ORDER BY id DESC";
  db.query(query, callback);
};


module.exports = { insertUrdPurchaseDetail,getAllPurchases,getLastURDPurchaseNumber };
