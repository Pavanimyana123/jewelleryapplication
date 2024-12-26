const companyModel = require('../models/companyInfoModel');

// Controller to add a new company
const addCompany = (req, res) => {
  const {
    company_name, address, address2, city, pincode, state, state_code,
    country, mobile, phone, website, gst_no, pan_no, bank_name,
    bank_account_no, ifsc_code, branch, bank_url
  } = req.body;

  // Validate required fields
  if (!company_name || !address || !city || !pincode || !state || !state_code || !country || !mobile) {
    return res.status(400).json({ error: "Required fields are missing." });
  }

  const companyData = {
    company_name, address, address2, city, pincode, state, state_code,
    country, mobile, phone, website, gst_no, pan_no, bank_name,
    bank_account_no, ifsc_code, branch, bank_url
  };

  // Call the model to insert the company
  companyModel.addCompany(companyData, (err, company_id) => {
    if (err) {
      console.error("Error inserting company details:", err);
      return res.status(500).json({ error: "Database error." });
    }

    res.status(201).json({
      message: "Company added successfully.",
      company_id
    });
  });
};

const getCompanies = (req, res) => {
  companyModel.getAllCompanies((err, results) => {
    if (err) {
      console.error("Error fetching company details:", err);
      return res.status(500).json({ error: "Database error." });
    }

    res.status(200).json(results);
  });
};

const getCompany = (req, res) => {
  const id = req.params.id;

  companyModel.getCompanyById(id, (err, result) => {
    if (err) {
      console.error("Error fetching company details by ID:", err);
      return res.status(500).json({ error: "Database error." });
    }

    if (result.length === 0) {
      return res.status(404).json({ error: "Company not found." });
    }

    res.status(200).json(result[0]); // Return the first result, as id is unique
  });
};

// Update company details
const updateCompany = (req, res) => {
  const id = req.params.id;
  const companyData = req.body;

  // Validate required fields
  if (!companyData.company_name || !companyData.address || !companyData.city || !companyData.pincode || 
      !companyData.state || !companyData.state_code || !companyData.country || !companyData.mobile) {
    return res.status(400).json({ error: "Required fields are missing." });
  }

  companyModel.updateCompanyById(companyData, id, (err, result) => {
    if (err) {
      console.error("Error updating company details:", err);
      return res.status(500).json({ error: "Database error." });
    }

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Company not found." });
    }

    res.status(200).json({ message: "Company updated successfully." });
  });
};

// Delete company by ID
const deleteCompany = (req, res) => {
  const id = req.params.id;

  companyModel.deleteCompanyById(id, (err, result) => {
    if (err) {
      console.error("Error deleting company details:", err);
      return res.status(500).json({ error: "Database error." });
    }

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Company not found." });
    }

    res.status(200).json({ message: "Company deleted successfully." });
  });
};


module.exports = {
  addCompany,
  getCompanies,
  getCompany,
  updateCompany,
  deleteCompany
};
