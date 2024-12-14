const repairModel = require("./../../models/sales/sales");

exports.saveRepairDetails = (req, res) => {
  const { repairDetails } = req.body;

  if (!repairDetails || !repairDetails.length) {
    return res.status(400).json({ message: "No data to save" });
  }

  repairModel.insert(repairDetails, (err) => {
    if (err) {
      console.error("Error saving data:", err);
      return res.status(500).json({ message: "Error saving data" });
    }
    res.json({ message: "Data saved successfully" });
  });
};
