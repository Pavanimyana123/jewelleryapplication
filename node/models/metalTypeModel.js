// models/metalTypeModel.js
const db = require('../db');

// Insert new metaltype record
const createMetalType = (data, callback) => {
  const sql = `
    INSERT INTO metaltype (metal_name, description, default_purity, default_purity_for_rate_entry, default_purity_for_old_metal, default_issue_purity)
    VALUES (?, ?, ?, ?, ?, ?)
  `;
  db.query(sql, [
    data.metal_name,
    data.description,
    data.default_purity,
    data.default_purity_for_rate_entry,
    data.default_purity_for_old_metal,
    data.default_issue_purity
  ], callback);
};

// Get all MetalTypes
const getAllMetalTypes = (callback) => {
  const sql = 'SELECT * FROM metaltype';
  db.query(sql, callback);
};

// Get metaltype by ID
const getMetalTypeById = (id, callback) => {
  const sql = 'SELECT * FROM metaltype WHERE metal_type_id = ?';
  db.query(sql, [id], callback);
};

// Update metaltype by ID
const updateMetalType = (id, data, callback) => {
  const sql = `
    UPDATE metaltype
    SET metal_name = ?, description = ?, default_purity = ?, default_purity_for_rate_entry = ?, default_purity_for_old_metal = ?, default_issue_purity = ?
    WHERE metal_type_id = ?
  `;
  db.query(sql, [
    data.metal_name,
    data.description,
    data.default_purity,
    data.default_purity_for_rate_entry,
    data.default_purity_for_old_metal,
    data.default_issue_purity,
    id
  ], callback);
};

// Delete metaltype by ID
const deleteMetalType = (id, callback) => {
  const sql = 'DELETE FROM metaltype WHERE metal_type_id = ?';
  db.query(sql, [id], callback);
};

module.exports = {
  createMetalType,
  getAllMetalTypes,
  getMetalTypeById,
  updateMetalType,
  deleteMetalType
};
