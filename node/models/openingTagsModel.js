const db = require('../db');

// Insert a new opening tag entry
const addOpeningTag = (data, callback) => {
    const sql = `
      INSERT INTO opening_tags_entry (
        product_id, Pricing, Tag_ID, Prefix, Category, Purity, PCode_BarCode,
        Gross_Weight, Stones_Weight, Stones_Price, WastageWeight, HUID_No,
        Wastage_On, Wastage_Percentage, Weight_BW, MC_Per_Gram, Making_Charges_On,
        TotalWeight_AW, Making_Charges, Status, Source, Stock_Point,
        Design_Master, product_Name
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    const values = [
        data.product_id, data.Pricing, data.Tag_ID, data.Prefix, data.Category,
        data.Purity, data.PCode_BarCode, data.Gross_Weight, data.Stones_Weight,
        data.Stones_Price, data.WastageWeight, data.HUID_No, data.Wastage_On,
        data.Wastage_Percentage, data.Weight_BW, data.MC_Per_Gram, data.Making_Charges_On,
        data.TotalWeight_AW, data.Making_Charges, data.Status, data.Source,
        data.Stock_Point, data.Design_Master, data.product_Name
    ];

    db.query(sql, values, callback);
};

// Fetch all opening tag entries
const getAllOpeningTags = (callback) => {
    const sql = `SELECT * FROM opening_tags_entry`;
    db.query(sql, callback);
};

module.exports = {
    addOpeningTag,
    getAllOpeningTags
};