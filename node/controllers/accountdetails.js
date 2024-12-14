const accountDetailsModel = require('../models/Accountdetails');

// Controller to insert data into account_details table
const addAccountDetails = (req, res) => {
    const data = req.body;

    accountDetailsModel.insertAccountDetails(data, (err, result) => {
        if (err) {
            console.error('Error inserting data:', err.message);
            return res.status(500).json({ message: 'Failed to insert data', error: err.message });
        }
        res.status(200).json({ message: 'Data inserted successfully', id: result.insertId });
    });
};

// Controller to fetch all account details
const getAllAccountDetails = (req, res) => {
    accountDetailsModel.getAllAccountDetails((err, results) => {
        if (err) {
            console.error('Error fetching data:', err.message);
            return res.status(500).json({ message: 'Failed to fetch data', error: err.message });
        }
        res.status(200).json(results);
    });
};

// Controller to fetch account details by ID
const getAccountDetailsById = (req, res) => {
    const { id } = req.params;

    accountDetailsModel.getAccountDetailsById(id, (err, result) => {
        if (err) {
            console.error('Error fetching data:', err.message);
            return res.status(500).json({ message: 'Failed to fetch data', error: err.message });
        }
        if (result.length === 0) {
            return res.status(404).json({ message: 'Record not found' });
        }
        res.status(200).json(result[0]);
    });
};

// Controller to update an account detail
const updateAccountDetails = (req, res) => {
    const { id } = req.params;
    const data = req.body;

    accountDetailsModel.updateAccountDetails(id, data, (err, result) => {
        if (err) {
            console.error('Error updating data:', err.message);
            return res.status(500).json({ message: 'Failed to update data', error: err.message });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ message: 'Record not found' });
        }
        res.status(200).json({ message: 'Record updated successfully' });
    });
};

// Controller to delete an account detail
const deleteAccountDetails = (req, res) => {
    const { id } = req.params;

    accountDetailsModel.deleteAccountDetails(id, (err, result) => {
        if (err) {
            console.error('Error deleting data:', err.message);
            return res.status(500).json({ message: 'Failed to delete data', error: err.message });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ message: 'Record not found' });
        }
        res.status(200).json({ message: 'Record deleted successfully' });
    });
};

module.exports = {
    addAccountDetails,
    getAllAccountDetails,
    getAccountDetailsById,
    updateAccountDetails,
    deleteAccountDetails
};
