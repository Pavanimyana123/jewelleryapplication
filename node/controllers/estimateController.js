const estimateModel = require("../models/estimateModel");

// Controller to add a new estimate
const addEstimate = (req, res) => {
  const data = req.body;

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
  
  module.exports = {
    addEstimate,
    getEstimates,
    updateEstimate,
    deleteEstimate
  };
