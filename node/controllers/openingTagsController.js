const openingTagsModel = require('../models/openingTagsModel');

// Handle adding a new opening tag entry
const createOpeningTag = (req, res) => {
    const {
        product_id,
        Pricing,
        Tag_ID,
        Prefix = "Default Prefix",
        Category = "Gold",
        Purity = "18K",
        PCode_BarCode = "Default Barcode",
        Gross_Weight = 0,
        Stones_Weight = 0,
        Stones_Price = 0,
        WastageWeight,
        HUID_No = "N/A",
        Wastage_On,
        Wastage_Percentage = 0,
        Weight_BW = 0,
        MC_Per_Gram = 0,
        Making_Charges_On = 0,
        TotalWeight_AW = 0,
        Making_Charges = 0,
        Status = "Active",
        Source = "Unknown",
        Stock_Point = "Default Stock Point",
        Design_Master = "Default Design",
        product_Name = "Unnamed Product"
    } = req.body;

    const data = {
        product_id,
        Pricing,
        Tag_ID,
        Prefix,
        Category,
        Purity,
        PCode_BarCode,
        Gross_Weight,
        Stones_Weight,
        Stones_Price,
        WastageWeight,
        HUID_No,
        Wastage_On,
        Wastage_Percentage,
        Weight_BW,
        MC_Per_Gram,
        Making_Charges_On,
        TotalWeight_AW,
        Making_Charges,
        Status,
        Source,
        Stock_Point,
        Design_Master,
        product_Name
    };

    openingTagsModel.addOpeningTag(data, (err, result) => {
        if (err) {
            console.error("Database error:", err);
            return res.status(500).json({ error: "Database insertion failed", details: err });
        }
        res.status(200).json({ message: "Data inserted successfully", result });
    });
};

// Handle fetching all opening tag entries
const getOpeningTags = (req, res) => {
    openingTagsModel.getAllOpeningTags((err, result) => {
        if (err) {
            console.error("Database error:", err);
            return res.status(500).json({ error: "Database query failed", details: err });
        }
        if (result.length === 0) {
            return res.status(404).json({ message: "No data found" });
        }
        res.status(200).json({ message: "Data retrieved successfully", result });
    });
};

module.exports = {
    createOpeningTag,
    getOpeningTags
};