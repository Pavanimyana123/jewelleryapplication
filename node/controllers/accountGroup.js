const accountsgroupModel = require('./../models/accountGroup');

const getAccountsGroup = (req, res) => {
  accountsgroupModel.getAccountsGroupNames((err, results) => {
    if (err) {
      console.error('Error fetching accounts group names:', err);
      return res.status(500).json({ error: 'Database query failed' });
    }
    res.json(results);
  });
};

module.exports = {
  getAccountsGroup,
};
