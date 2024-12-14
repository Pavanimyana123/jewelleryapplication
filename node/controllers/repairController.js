const RepairModel = require('../models/repairModel');
const db = require('../db');

exports.addRepair = async (req, res) => {
    try {
        const result = await RepairModel.add(req.body);
        res.status(201).json({ message: 'Repair entry added successfully', repairId: result.insertId });
    } catch (error) {
        console.error('Error inserting repair entry:', error.message);
        res.status(500).json({ error: 'Failed to insert repair entry' });
    }
};

exports.getRepairs = async (req, res) => {
    try {
        const results = await RepairModel.getAll();
        res.status(200).json(results);
    } catch (error) {
        console.error('Error fetching repair entries:', error.message);
        res.status(500).json({ error: 'Failed to fetch repair entries' });
    }
};

exports.getRepairById = async (req, res) => {
    try {
        const result = await RepairModel.getById(req.params.id);
        if (!result) {
            return res.status(404).json({ message: 'Repair entry not found' });
        }
        res.status(200).json(result);
    } catch (error) {
        console.error('Error fetching repair entry:', error.message);
        res.status(500).json({ error: 'Failed to fetch repair entry' });
    }
};

exports.updateRepair = async (req, res) => {
    try {
        const updated = await RepairModel.update(req.params.id, req.body);
        if (!updated) {
            return res.status(404).json({ message: 'Repair entry not found' });
        }
        res.status(200).json({ message: 'Repair entry updated successfully' });
    } catch (error) {
        console.error('Error updating repair entry:', error.message);
        res.status(500).json({ error: 'Failed to update repair entry' });
    }
};

exports.deleteRepair = async (req, res) => {
    try {
        const deleted = await RepairModel.remove(req.params.id);
        if (!deleted) {
            return res.status(404).json({ message: 'Repair entry not found' });
        }
        res.status(200).json({ message: 'Repair entry deleted successfully' });
    } catch (error) {
        console.error('Error deleting repair entry:', error.message);
        res.status(500).json({ error: 'Failed to delete repair entry' });
    }
};

exports.updateRepairStatus = async (req, res) => {
    try {
      const { status } = req.body; // `status` is coming from the body
      const { id } = req.params;   // `id` is coming from the URL
  
      if (!id || !status) {
        return res.status(400).json({ error: "id and status are required" });
      }
  
      await RepairModel.updateStatus(id, status); // Ensure this function exists in your model
      res.status(200).json({ message: "Status updated successfully" });
    } catch (error) {
      console.error("Error updating repair status:", error.message);
      res.status(500).json({ error: "Failed to update repair status" });
    }
  };

  exports.addRepairDetails = async (req, res) => {
    const { repair_id, details } = req.body;

    if (!repair_id || !Array.isArray(details) || details.length === 0) {
        return res.status(400).json({ error: 'Invalid input data' });
    }

    try {
        await db.beginTransaction();

        // Add repair details
        await RepairModel.addDetails(repair_id, details);

        // Update repair status
        const statusUpdated = await RepairModel.updateStatus(repair_id, 'Receive from Workshop');
        if (!statusUpdated) {
            throw new Error('Failed to update repair status');
        }

        await db.commit();

        res.status(201).json({ message: 'Repair details added and status updated successfully' });
    } catch (error) {
        await db.rollback();
        console.error('Error processing request:', error);
        res.status(500).json({ error: 'Failed to process request' });
    }
};

  





  
  
