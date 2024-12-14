const PaymentModel = require('../models/paymentModel');

exports.addPayment = (req, res) => {
    const {
        date, mode, cheque_number, receipt_no, account_name,
        total_amt, discount_amt, cash_amt, remarks
    } = req.body;

    if (!date || !mode || !receipt_no || !account_name || !total_amt) {
        return res.status(400).json({ error: 'Required fields are missing.' });
    }

    const paymentData = [
        date, mode, cheque_number || null, receipt_no, account_name,
        total_amt, discount_amt || 0, cash_amt || 0, remarks || null
    ];

    PaymentModel.addPayment(paymentData, (err, result) => {
        if (err) {
            console.error('Error inserting payment record:', err.message);
            return res.status(500).json({ error: 'Failed to add payment record.' });
        }
        res.status(201).json({ message: 'Payment record added successfully.', paymentId: result.insertId });
    });
};

exports.getPayments = (req, res) => {
    const { date, mode, account_name } = req.query;

    let conditions = [];
    let values = [];

    if (date) conditions.push('date = ?') && values.push(date);
    if (mode) conditions.push('mode = ?') && values.push(mode);
    if (account_name) conditions.push('account_name LIKE ?') && values.push(`%${account_name}%`);

    PaymentModel.getPayments(conditions, values, (err, results) => {
        if (err) {
            console.error('Error retrieving payment records:', err.message);
            return res.status(500).json({ error: 'Failed to retrieve payment records.' });
        }
        res.status(200).json({ payments: results });
    });
};

exports.updatePayment = (req, res) => {
    const { payment_id } = req.params;
    const {
        date, mode, cheque_number, receipt_no, account_name,
        total_amt, discount_amt, cash_amt, remarks
    } = req.body;

    if (!payment_id) {
        return res.status(400).json({ error: 'Payment ID is required.' });
    }

    let updates = [];
    let values = [];

    if (date) updates.push('date = ?') && values.push(date);
    if (mode) updates.push('mode = ?') && values.push(mode);
    if (cheque_number) updates.push('cheque_number = ?') && values.push(cheque_number);
    if (receipt_no) updates.push('receipt_no = ?') && values.push(receipt_no);
    if (account_name) updates.push('account_name = ?') && values.push(account_name);
    if (total_amt) updates.push('total_amt = ?') && values.push(total_amt);
    if (discount_amt) updates.push('discount_amt = ?') && values.push(discount_amt);
    if (cash_amt) updates.push('cash_amt = ?') && values.push(cash_amt);
    if (remarks) updates.push('remarks = ?') && values.push(remarks);

    if (updates.length === 0) {
        return res.status(400).json({ error: 'No fields provided for update.' });
    }

    values.push(payment_id);

    PaymentModel.updatePayment(updates, values, (err, result) => {
        if (err) {
            console.error('Error updating payment record:', err.message);
            return res.status(500).json({ error: 'Failed to update payment record.' });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Payment record not found.' });
        }
        res.status(200).json({ message: 'Payment record updated successfully.' });
    });
};

exports.deletePayment = (req, res) => {
    const { payment_id } = req.params;

    PaymentModel.deletePayment(payment_id, (err, result) => {
        if (err) {
            console.error('Error deleting payment record:', err.message);
            return res.status(500).json({ error: 'Failed to delete payment record.' });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Payment record not found.' });
        }
        res.status(200).json({ message: 'Payment record deleted successfully.' });
    });
};
