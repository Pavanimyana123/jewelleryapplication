// controllers/metalTypeController.js
const metalTypeModel = require('../models/metalTypeModel');

// Create a new MetalType record
const createMetalType = (req, res) => {
  const data = req.body;
  metalTypeModel.createMetalType(data, (err, result) => {
    if (err) {
      console.error(err);
      res.status(500).send('Error inserting data');
    } else {
      res.status(201).send({ id: result.insertId, message: 'MetalType record created' });
    }
  });
};

// Get all MetalType records
const getAllMetalTypes = (req, res) => {
  metalTypeModel.getAllMetalTypes((err, results) => {
    if (err) {
      console.error(err);
      res.status(500).send('Error fetching data');
    } else {
      res.status(200).send(results);
    }
  });
};

// Get a single MetalType record by ID
const getMetalTypeById = (req, res) => {
  const { id } = req.params;
  metalTypeModel.getMetalTypeById(id, (err, results) => {
    if (err) {
      console.error(err);
      res.status(500).send('Error fetching data');
    } else if (results.length === 0) {
      res.status(404).send('Record not found');
    } else {
      res.status(200).send(results[0]);
    }
  });
};

// Update a MetalType record by ID
const updateMetalType = (req, res) => {
  const { id } = req.params;
  const data = req.body;
  metalTypeModel.updateMetalType(id, data, (err, result) => {
    if (err) {
      console.error(err);
      res.status(500).send('Error updating data');
    } else {
      res.status(200).send({ message: 'MetalType record updated' });
    }
  });
};

// Delete a MetalType record by ID
const deleteMetalType = (req, res) => {
  const { id } = req.params;
  metalTypeModel.deleteMetalType(id, (err, result) => {
    if (err) {
      console.error(err);
      res.status(500).send('Error deleting data');
    } else {
      res.status(200).send({ message: 'MetalType record deleted' });
    }
  });
};

module.exports = {
  createMetalType,
  getAllMetalTypes,
  getMetalTypeById,
  updateMetalType,
  deleteMetalType
};
