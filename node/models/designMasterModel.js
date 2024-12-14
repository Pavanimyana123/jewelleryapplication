// models/designMasterModel.js
const db = require('../db');

// Insert new designmaster record
const createDesignMaster = (data, callback) => {
  const sql = `
    INSERT INTO designmaster (metal, short_id, item_type, design_item, design_name, wastage_percentage, making_charge, design_short_code, brand_category, mc_type)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `;
  db.query(sql, [
    data.metal,
    data.short_id,
    data.item_type,
    data.design_item,
    data.design_name,
    data.wastage_percentage,
    data.making_charge,
    data.design_short_code,
    data.brand_category,
    data.mc_type
  ], callback);
};

// Get all designmaster records
const getAllDesignMasters = (callback) => {
  const sql = 'SELECT * FROM designmaster';
  db.query(sql, callback);
};

// Get designmaster by ID
const getDesignMasterById = (id, callback) => {
  const sql = 'SELECT * FROM designmaster WHERE design_id = ?';
  db.query(sql, [id], callback);
};

// Update designmaster record by ID
const updateDesignMaster = (id, data, callback) => {
  const sql = `
    UPDATE designmaster
    SET metal = ?, short_id = ?, item_type = ?, design_item = ?, design_name = ?, wastage_percentage = ?, making_charge = ?, design_short_code = ?, brand_category = ?, mc_type = ?
    WHERE design_id = ?
  `;
  db.query(sql, [
    data.metal,
    data.short_id,
    data.item_type,
    data.design_item,
    data.design_name,
    data.wastage_percentage,
    data.making_charge,
    data.design_short_code,
    data.brand_category,
    data.mc_type,
    id
  ], callback);
};

// Delete designmaster record by ID
const deleteDesignMaster = (id, callback) => {
  const sql = 'DELETE FROM designmaster WHERE design_id = ?';
  db.query(sql, [id], callback);
};

module.exports = {
  createDesignMaster,
  getAllDesignMasters,
  getDesignMasterById,
  updateDesignMaster,
  deleteDesignMaster
};
