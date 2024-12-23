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

        // Calculate total price from details
        const totalPrice = details.reduce((total, detail) => {
            return total + (Number(detail.qty || 0) * Number(detail.rate || 0));
        }, 0);

        // Update the repair's total and status
        const updateRepair = `
            UPDATE repairs 
            SET status = 'Receive from Workshop', total = ? 
            WHERE repair_id = ?
        `;
        const result = await new Promise((resolve, reject) => {
            db.query(updateRepair, [totalPrice, repair_id], (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });

        if (result.affectedRows === 0) {
            throw new Error('Failed to update repair total');
        }

        await db.commit();

        res.status(201).json({ message: 'Repair details added and status updated successfully' });
    } catch (error) {
        await db.rollback();
        console.error('Error processing request:', error);
        res.status(500).json({ error: 'Failed to process request' });
    }
};


exports.fetchAllRepairDetails = async (req, res) => {
    try {
        const details = await RepairModel.fetchAllDetails();
        res.status(200).json(details);
    } catch (error) {
        console.error('Error fetching repair details:', error.message);
        res.status(500).json({ error: 'Failed to fetch repair details' });
    }
};

exports.fetchRepairDetailsByRepairId = async (req, res) => {
    const { repair_id } = req.params;

    if (!repair_id) {
        return res.status(400).json({ error: 'Repair ID is required' });
    }

    try {
        const details = await RepairModel.fetchDetailsByRepairId(repair_id);
        if (details.length === 0) {
            return res.status(404).json({ message: 'No repair details found for the given ID' });
        }
        res.status(200).json(details);
    } catch (error) {
        console.error('Error fetching repair details by ID:', error.message);
        res.status(500).json({ error: 'Failed to fetch repair details' });
    }
};

exports.getLastRPNNumber = async (req, res) => {
    try {
        const result = await RepairModel.getLastRPNNumber();

        if (result.length > 0) {
            // Process RPN numbers to find the next one
            const rpnNumbers = result
                .map(row => row.repair_no)
                .filter(rpn => rpn.startsWith("RPN"))
                .map(rpn => parseInt(rpn.slice(3), 10)); // Extract numeric part

            const lastRPNNumber = Math.max(...rpnNumbers);
            const nextRPNNumber = `RPN${String(lastRPNNumber + 1).padStart(3, "0")}`;

            res.status(200).json({ lastRPNNumber: nextRPNNumber });
        } else {
            res.status(200).json({ lastRPNNumber: "RPN001" }); // Start with RPN001
        }
    } catch (error) {
        console.error("Error fetching last RPN number:", error.message);
        res.status(500).json({ error: "Failed to fetch last RPN number" });
    }
};







  
  
