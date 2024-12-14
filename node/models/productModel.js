const db = require('../db');

// Insert a new product
const addProduct = (productData, callback) => {
    const sql = `INSERT INTO product (
        product_name, rbarcode, Category, design_master, purity, item_prefix,
        short_name, sale_account_head, purchase_account_head, status, tax_slab,tax_slab_id,
        hsn_code, maintain_tags, op_qty, op_value, op_weight, huid_no
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;

    const values = [
        productData.product_name, productData.rbarcode, productData.Category, productData.design_master, 
        productData.purity, productData.item_prefix, productData.short_name, productData.sale_account_head, 
        productData.purchase_account_head, productData.status, productData.tax_slab, productData.tax_slab_id,
        productData.hsn_code, productData.maintain_tags, productData.op_qty, 
        productData.op_value, productData.op_weight, productData.huid_no
    ];

    db.query(sql, values, callback);
};

// Fetch all products
const getAllProducts = (callback) => {
    const sql = 'SELECT * FROM product';
    db.query(sql, (err, results) => {
      if (err) {
        return callback(err, null);
      }
      callback(null, results);
    });
  };

module.exports = {
    addProduct,
    getAllProducts
};
