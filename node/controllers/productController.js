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

module.exports = {
    createProduct,
    getProducts
};
