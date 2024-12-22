const ratesModel = require('../models/ratesModel');

const addRates = (req, res) => {
    const {
        rate_date,
        rate_time,
        rate_16crt,
        rate_18crt,
        rate_22crt,
        rate_24crt,
        silver_rate,
    } = req.body;

    // Validate input
    if (!rate_date || !rate_time || !rate_16crt || !rate_18crt || !rate_22crt || !rate_24crt || !silver_rate) {
        return res.status(400).json({ error: "All fields are required" });
    }

    const rateData = { rate_date, rate_time, rate_16crt, rate_18crt, rate_22crt, rate_24crt, silver_rate };

    // Insert into `rates`
    ratesModel.insertRates(rateData, (err, ratesResult) => {
        if (err) {
            console.error("Error inserting into rates table:", err);
            return res.status(500).json({ error: "Error inserting into rates table" });
        }

        // Update `current_rates`
        ratesModel.updateCurrentRates(rateData, (err, updateResult) => {
            if (err) {
                console.error("Error updating current_rates table:", err);
                return res.status(500).json({ error: "Error updating current_rates table" });
            }

            // If no rows updated, insert a new record into `current_rates`
            if (updateResult.affectedRows === 0) {
                ratesModel.insertCurrentRates(rateData, (err, insertResult) => {
                    if (err) {
                        console.error("Error inserting into current_rates table:", err);
                        return res.status(500).json({ error: "Error inserting into current_rates table" });
                    }

                    res.status(200).json({
                        message: "Data successfully added to rates and current_rates",
                        ratesInsertId: ratesResult.insertId,
                        currentRatesInsertId: insertResult.insertId,
                    });
                });
            } else {
                res.status(200).json({
                    message: "Data successfully added to rates and updated current_rates",
                    ratesInsertId: ratesResult.insertId,
                });
            }
        });
    });
};

const fetchCurrentRates = (req, res) => {
    ratesModel.getCurrentRates((err, result) => {
        if (err) {
            console.error("Error fetching from current_rates table:", err);
            return res.status(500).json({ error: "Error fetching from current_rates table" });
        }

        if (result.length === 0) {
            return res.status(404).json({ error: "No data found in current_rates table" });
        }

        res.status(200).json(result[0]);
    });
};

const fetchRates = (req, res) => {
    ratesModel.getRates((err, result) => {
        if (err) {
            console.error("Error fetching from rates table:", err);
            return res.status(500).json({ error: "Error fetching from rates table" });
        }

        if (result.length === 0) {
            return res.status(404).json({ error: "No data found in rates table" });
        }

        res.status(200).json(result);
    });
};

module.exports = { addRates, fetchRates, fetchCurrentRates };
