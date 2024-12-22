const productModel = require('../models/productModel');

// Handle adding a new product
const createProduct = (req, res) => {
    productModel.addProduct(req.body, (err, result) => {
        if (err) {
            console.error('Error inserting product:', err);
            res.status(500).json({ message: 'Database error', error: err });
        } else {
            res.status(201).json({ message: 'Product added successfully', product_id: result.insertId });
        }
    });
};

// Handle fetching all products
const getProducts = (req, res) => {
    productModel.getAllProducts((err, products) => {
      if (err) {
        console.error('Error fetching products:', err);
        res.status(500).json({ message: 'Database error', error: err });
      } else {
        res.status(200).json(products);
      }
    });
  };

  // Controller to handle fetching a product by ID
const getProductById = (req, res) => {
  const { id } = req.params;

  productModel.getProductById(id, (err, result) => {
      if (err) {
          console.error('Error fetching product:', err);
          res.status(500).json({ message: 'Database error', error: err });
      } else if (result.length === 0) {
          res.status(404).json({ message: 'Product not found' });
      } else {
          res.status(200).json(result[0]);
      }
  });
};

// Update a product
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
const deleteProduct = (product_id, callback) => {
  const sql = `DELETE FROM product WHERE product_id = ?`;
  db.query(sql, [product_id], callback);
};

const checkAndInsertProduct = async (req, res) => {
  const { product_name, Category, design_master, purity } = req.body;

  // Validate request
  if (!product_name || !Category || !design_master || !purity) {
    return res.status(400).json({ error: 'All fields are required.' });
  }

  try {
    // Check if the product already exists
    const existingProducts = await productModel.checkProductExists(product_name, Category, design_master, purity);
    if (existingProducts.length > 0) {
      return res.json({ exists: true, message: 'Product already exists!' });
    }

    // Insert the product
    // await productModel.insertProduct(product_name, Category, design_master, purity);
    res.status(201).json({ exists: false, message: 'Product saved successfully!' });
  } catch (error) {
    console.error('Error in product operation:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
};

module.exports = {
    createProduct,
    getProducts,
    getProductById,
    updateProduct,
    checkAndInsertProduct,
    deleteProduct
};
