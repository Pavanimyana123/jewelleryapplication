const db = require('../db');

// Add a new product stone detail
const addProductStoneDetails = (subproductname, weight, ratepergram, amount, totalweight, totalprice) => {
    return new Promise((resolve, reject) => {
      const query = `
        INSERT INTO productstockentry_stone_details (subproductname, weight, ratepergram, amount, totalweight, totalprice)
        VALUES (?, ?, ?, ?, ?, ?)
      `;
      db.query(query, [subproductname, weight, ratepergram, amount, totalweight, totalprice], (err, result) => {
        if (err) {
          reject(err);
        } else {
          resolve(result);
        }
      });
    });
  };

// Fetch all product stone details
const getStoneDetails = callback => {
    const query = 'SELECT * FROM productstockentry_stone_details';
    db.query(query, callback);
};

// Update a product stone detail
const updateStoneDetail = (data, id, callback) => {
    const query = `UPDATE productstockentry_stone_details 
                   SET subproductname = ?, weight = ?, ratepergram = ?, amount = ?,
                       totalweight = ?, totalprice = ? 
                   WHERE id = ?`;
    db.query(query, [...data, id], callback);
};

// Delete a product stone detail
const deleteStoneDetail = (id, callback) => {
    const query = 'DELETE FROM productstockentry_stone_details WHERE id = ?';
    db.query(query, [id], callback);
};

module.exports = {
    addProductStoneDetails,
    getStoneDetails,
    updateStoneDetail,
    deleteStoneDetail
};
