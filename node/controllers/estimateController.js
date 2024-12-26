const estimateModel = require("../models/estimateModel");

const addEstimate = (req, res) => {
  const data = req.body;

  // Simple validation
  if (!data.date || !data.estimate_number || !data.product_name) {
    return res.status(400).json({ message: 'Missing required fields' });
  }

  estimateModel.insertEstimate(data, (err, result) => {
    if (err) {
      console.error('Error inserting data:', err.message);
      return res.status(500).json({ message: 'Failed to insert data', error: err.message });
    }
    res.status(200).json({ message: 'Data inserted successfully', id: result.insertId });
  });
};


const getEstimates = (req, res) => {
    estimateModel.getEstimates((err, result) => {
      if (err) {
        console.error("Error fetching estimates:", err.message);
        return res.status(500).json({ message: "Failed to fetch estimates", error: err.message });
      }
      res.status(200).json(result);  // Send the list of estimates as JSON
    });
  };

  const updateEstimate = (req, res) => {
    const id = req.params.id;
    const data = req.body;
  
    estimateModel.updateEstimate(id, data, (err, result) => {
      if (err) {
        console.error("Error updating data:", err.message);
        return res.status(500).json({ message: "Failed to update estimate", error: err.message });
      }
      if (result.affectedRows === 0) {
        return res.status(404).json({ message: "Estimate not found" });
      }
      res.status(200).json({ message: "Estimate updated successfully" });
    });
  };
  
  // Controller to delete an estimate
  const deleteEstimate = (req, res) => {
    const id = req.params.id;
  
    estimateModel.deleteEstimate(id, (err, result) => {
      if (err) {
        console.error("Error deleting data:", err.message);
        return res.status(500).json({ message: "Failed to delete estimate", error: err.message });
      }
      if (result.affectedRows === 0) {
        return res.status(404).json({ message: "Estimate not found" });
      }
      res.status(200).json({ message: "Estimate deleted successfully" });
    });
  };

  const getLastEstimateNumber = (req, res) => {
    estimateModel.getLastEstimateNumber((err, result) => {
      if (err) {
        console.error("Error fetching last estimate number:", err);
        return res.status(500).json({ error: "Failed to fetch last estimate number" });
      }
  
      if (result.length > 0) {
        // Process estimate numbers to find the next one
        const estNumbers = result
          .map(row => row.estimate_number)
          .filter(estimate => estimate.startsWith("EST"))
          .map(estimate => parseInt(estimate.slice(3), 10)); // Extract numeric part
  
        const lastEstimateNumber = Math.max(...estNumbers);
        const nextEstimateNumber = `EST${String(lastEstimateNumber + 1).padStart(3, "0")}`;
  
        res.json({ lastEstimateNumber: nextEstimateNumber });
      } else {
        res.json({ lastEstimateNumber: "EST001" }); // Start with EST001
      }
    });
  };

  const getAllUniqueEstimates = (req, res) => {
    estimateModel.getAllUniqueEstimates((err, results) => {
      if (err) {
        console.error("Error fetching data:", err);
        return res.status(500).json({ message: "Error fetching data" });
      }
      res.json(results);
    });
  };
  
  // Controller to get estimate details by estimate_number
  const getEstimateDetailsByEstimateNumber = (req, res) => {
    const { estimate_number } = req.params;
  
    if (!estimate_number) {
      return res.status(400).json({ message: "Estimate number is required" });
    }
  
    estimateModel.getByEstimateNumber(estimate_number, (err, results) => {
      if (err) {
        console.error("Error fetching data:", err);
        return res.status(500).json({ message: "Error fetching data" });
      }
  
      if (!results.length) {
        return res.status(404).json({ message: "No data found for the given estimate number" });
      }
  
      // Extract unique and repeated data
      const uniqueData = {
        date: results[0].date,
        estimate_number: results[0].estimate_number,
        total_amount: results[0].total_amount,
      };
  
      const repeatedData = results.map((row) => ({
        code: row.code,
        product_id: row.product_id,
        product_name: row.product_name,
        metal_type: row.metal_type,
        design_master: row.design_master,
        purity: row.purity,
        gross_weight: row.gross_weight,
        stones_weight: row.stones_weight,
        stones_price: row.stones_price,
        weight_bw: row.weight_bw,
        wastage_on: row.wastage_on,
        wastage_percent: row.wastage_percent,
        wastage_weight: row.wastage_weight,
        total_weight: row.total_weight,
        making_charges_on: row.making_charges_on,
        mc_per_gram: row.mc_per_gram,
        total_mc: row.total_mc,
        rate: row.rate,
        rate_amt: row.rate_amt,
        tax_percent: row.tax_percent,
        tax_vat_amount: row.tax_vat_amount,
        total_rs: row.total_rs,
        
      }));
  
      res.json({ uniqueData, repeatedData });
    });
  };
  
  module.exports = {
    addEstimate,
    getEstimates,
    updateEstimate,
    deleteEstimate,
    getLastEstimateNumber,
    getAllUniqueEstimates,
    getEstimateDetailsByEstimateNumber
  };
