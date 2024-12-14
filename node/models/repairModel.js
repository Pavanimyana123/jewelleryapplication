
const db = require('../db');

const RepairModel = {
    add: (data) => {
        const sql = `
            INSERT INTO repairs (
                name, mobile, email, address1, address2, address3, city, staff, delivery_date, 
                place, metal, counter, entry_type, receipt_no, repair_no, date, type, item, 
                tag_no, description, purity, extra_weight, stone_value, making_charge, 
                handling_charge, total, status
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        `;
        const values = [
            data.name, data.mobile, data.email, data.address1, data.address2, data.address3, data.city, 
            data.staff, data.delivery_date, data.place, data.metal, data.counter, 
            data.entry_type, data.receipt_no, data.repair_no, data.date, data.type, data.item, 
            data.tag_no, data.description, data.purity, data.extra_weight, 
            data.stone_value, data.making_charge, data.handling_charge, data.total, data.status,
        ];
        return new Promise((resolve, reject) => {
            db.query(sql, values, (err, result) => {
                if (err) reject(err);
                resolve(result);
            });
        });
    },

    getAll: () => {
        return new Promise((resolve, reject) => {
            db.query('SELECT * FROM repairs', (err, results) => {
                if (err) reject(err);
                resolve(results);
            });
        });
    },

    getById: (id) => {
        return new Promise((resolve, reject) => {
            db.query('SELECT * FROM repairs WHERE repair_id = ?', [id], (err, results) => {
                if (err) reject(err);
                resolve(results[0]);
            });
        });
    },

    update: (id, data) => {
        const sql = `
            UPDATE repairs SET 
                name = ?, mobile = ?, email = ?, address1 = ?, address2 = ?, address3 = ?, city = ?, 
                staff = ?, delivery_date = ?, place = ?, metal = ?, counter = ?, 
                entry_type = ?, receipt_no = ?, repair_no = ?, date = ?, type = ?, item = ?, tag_no = ?, 
                description = ?, purity = ?, extra_weight = ?, stone_value = ?, 
                making_charge = ?, handling_charge = ?, total = ?, status = ?
            WHERE repair_id = ?
        `;
        const values = [
            data.name, data.mobile, data.email, data.address1, data.address2, data.address3, data.city,
            data.staff, data.delivery_date, data.place, data.metal, data.counter, 
            data.entry_type, data.receipt_no, data.repair_no, data.date, data.type, data.item, 
            data.tag_no, data.description, data.purity, data.extra_weight, 
            data.stone_value, data.making_charge, data.handling_charge, data.total, data.status, id
        ];
        return new Promise((resolve, reject) => {
            db.query(sql, values, (err, result) => {
                if (err) reject(err);
                resolve(result.affectedRows > 0);
            });
        });
    },

    remove: (id) => {
        return new Promise((resolve, reject) => {
            db.query('DELETE FROM repairs WHERE repair_id = ?', [id], (err, result) => {
                if (err) reject(err);
                resolve(result.affectedRows > 0);
            });
        });
    },

    addDetails: (repair_id, details) => {
        const insertDetailsQuery = `
            INSERT INTO repairdetails 
            (repair_id, metal_type, description, weight, qty, rate_type, rate) 
            VALUES ?
        `;

        const values = details.map((detail) => [
            repair_id,
            detail.metal_type,
            detail.description,
            detail.weight,
            detail.qty,
            detail.rate_type,
            detail.rate,
        ]);

        return new Promise((resolve, reject) => {
            db.query(insertDetailsQuery, [values], (err, result) => {
                if (err) reject(err);
                resolve(result);
            });
        });
    },

    updateStatus: (id, status) => {
        return new Promise((resolve, reject) => {
            db.query(
                "UPDATE repairs SET status = ? WHERE repair_id = ?",
                [status, id],
                (err, results) => {
                    if (err) {
                        console.error('Error updating status:', err);
                        return reject(new Error('Failed to update repair status'));
                    }

                    // Check if any rows were affected
                    if (results.affectedRows > 0) {
                        resolve(true); // Status updated successfully
                    } else {
                        resolve(false); // No rows were updated (possibly invalid ID)
                    }
                }
            );
        });
    },




};

module.exports = RepairModel;
