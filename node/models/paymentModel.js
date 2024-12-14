const db = require('../db');

const PaymentModel = {
    addPayment: (paymentData, callback) => {
        const query = `
            INSERT INTO payments (date, mode, cheque_number, receipt_no, account_name, total_amt, discount_amt, cash_amt, remarks)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        `;
        db.query(query, paymentData, callback);
    },

    getPayments: (conditions, values, callback) => {
        let query = 'SELECT * FROM payments';
        if (conditions.length > 0) {
            query += ' WHERE ' + conditions.join(' AND ');
        }
        db.query(query, values, callback);
    },

    updatePayment: (updates, values, callback) => {
        const query = `UPDATE payments SET ${updates.join(', ')} WHERE payment_id = ?`;
        db.query(query, values, callback);
    },

    deletePayment: (paymentId, callback) => {
        const query = 'DELETE FROM payments WHERE payment_id = ?';
        db.query(query, [paymentId], callback);
    }
};

module.exports = PaymentModel;
