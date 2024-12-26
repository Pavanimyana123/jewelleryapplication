const PurchaseModel = require('../models/purchaseModel');

const PurchaseController = {
  addPurchase: (req, res) => {
    const { formData, tableData } = req.body;

    if (!formData || !tableData || !Array.isArray(tableData)) {
      return res.status(400).json({ error: 'Invalid or missing formData or tableData' });
    }

    const mergedValues = tableData.map((item) => [
      formData.account_name,
      formData.mobile,
      formData.email,
      formData.address1,
      formData.address2,
      formData.city,
      formData.pincode,
      formData.state,
      formData.state_code,
      formData.aadhar_card,
      formData.gst_in,
      formData.pan_card,
      formData.terms,
      formData.indent,
      formData.bill_no,
      formData.type,
      formData.rate_cut,
      formData.date,
      formData.bill_date,
      formData.due_date,
      formData.Purchase_rate,
      item.code || null,
      item.product_id || null,
      item.product_name || null,
      item.metal_type || null,
      item.design_name || null,
      item.purity || null,
      item.hsn || null,
      item.product_type || null,
      item.stock_type || null,
      item.pcs || null,
      item.gross_weight || null,
      item.stone_weight || null,
      item.net_weight || null,
      item.unit_weight || null,
      item.waste_percentage || null,
      item.waste_amount || null,
      item.pure_weight || null,
      item.alloy || null,
      item.cost || null,
      item.total_weight || null,
      item.wt_rate_amount || null,
      item.mc_per_gram || null,
      item.mc || null,
      item.stone_amount || null,
      item.total_amount || null,
      item.stone || null,
      item.stone_pcs || null,
      item.stone_ct || null,
      item.cwp || null,
      item.gms || null,
      item.stone_rate || null,
      item.clarity || null,
      item.rate || null,
      item.clear || null,
      item.class || null,
      item.cut || null,
    ]);

    PurchaseModel.insertPurchase(mergedValues, (err, result) => {
      if (err) {
        console.error('Insertion error:', err);
        return res.status(500).json({ error: 'Failed to save data', details: err });
      }

      res.status(201).json({ message: 'Purchase and items added successfully' });
    });
  },

  getPurchases: (req, res) => {
    PurchaseModel.getAllPurchases((err, results) => {
      if (err) {
        console.error('Error fetching purchases:', err);
        return res.status(500).json({ error: 'Failed to fetch purchases', details: err });
      }

      res.status(200).json({ purchases: results });
    });
  },
};

module.exports = PurchaseController;
