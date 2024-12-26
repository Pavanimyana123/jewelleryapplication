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

// Function to fetch a product by ID
const getProductById = (id, callback) => {
  const sql = 'SELECT * FROM product WHERE product_id = ?';
  db.query(sql, [id], (err, result) => {
    callback(err, result);
  });
};

// Update a product
// const updateProduct = (req, res) => {
//   const { product_id } = req.params;
//   const {
//     product_name, rbarcode, Category, design_master, purity, item_prefix,
//     short_name, sale_account_head, purchase_account_head, status, tax_slab, tax_slab_id,
//     hsn_code, maintain_tags, op_qty, op_value, op_weight, huid_no
//   } = req.body;

//   const values = [
//     product_name, rbarcode, Category, design_master, purity, item_prefix,
//     short_name, sale_account_head, purchase_account_head, status, tax_slab, tax_slab_id,
//     hsn_code, maintain_tags, op_qty, op_value, op_weight, huid_no
//   ];

//   productModel.updateProduct(values, product_id, (err, result) => {
//     if (err) {
//       console.error('Error updating product:', err);
//       res.status(500).json({ message: 'Database error', error: err });
//     } else if (result.affectedRows === 0) {
//       res.status(404).json({ message: 'Product not found' });
//     } else {
//       res.status(200).json({ message: 'Product updated successfully' });
//     }
//   });
// };

const updateProduct = (values, product_id, callback) => {
  const sql = `UPDATE product 
               SET 
                  product_name = ?, rbarcode = ?, Category = ?, design_master = ?, purity = ?, 
                  item_prefix = ?, short_name = ?, sale_account_head = ?, purchase_account_head = ?, 
                  status = ?, tax_slab = ?, tax_slab_id = ?, hsn_code = ?, maintain_tags = ?, 
                  op_qty = ?, op_value = ?, op_weight = ?, huid_no = ?
               WHERE product_id = ?`;

  db.query(sql, [...values, product_id], callback);
};

// Delete a product
// const deleteProduct = (req, res) => {
//   const { product_id } = req.params;

//   productModel.deleteProduct(product_id, (err, result) => {
//     if (err) {
//       console.error('Error deleting product:', err);
//       res.status(500).json({ message: 'Database error', error: err });
//     } else if (result.affectedRows === 0) {
//       res.status(404).json({ message: 'Product not found' });
//     } else {
//       res.status(200).json({ message: 'Product deleted successfully' });
//     }
//   });
// };
const deleteProduct = (product_id, callback) => {
  const sql = `DELETE FROM product WHERE product_id = ?`;
  db.query(sql, [product_id], callback);
};

// Check if a product exists
const checkProductExists = (product_name, Category, design_master, purity) => {
  const query = `
    SELECT * FROM product 
    WHERE product_name = ? AND Category = ? AND design_master = ? AND purity = ?`;
  return new Promise((resolve, reject) => {
    db.query(query, [product_name, Category, design_master, purity], (err, results) => {
      if (err) return reject(err);
      resolve(results);
    });
  });
};

// Insert a new product
const insertProduct = (product_name, Category, design_master, purity) => {
  const query = `
    INSERT INTO product (product_name, Category, design_master, purity) 
    VALUES (?, ?, ?, ?)`;
  return new Promise((resolve, reject) => {
    db.query(query, [product_name, Category, design_master, purity], (err, results) => {
      if (err) return reject(err);
      resolve(results);
    });
  });
};

const getLastRbarcode = (callback) => {
  const query = "SELECT rbarcode FROM product WHERE rbarcode LIKE 'RB%' ORDER BY product_id DESC";
  db.query(query, callback);
};





module.exports = {
  addProduct,
  getAllProducts,
  getProductById,
  updateProduct,
  checkProductExists,
  insertProduct,
  deleteProduct,
  getLastRbarcode
};
