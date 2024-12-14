const db = require('./../db');

const getAccountsGroupNames = (callback) => {
  const query = 'SELECT `AccountsGroupName` FROM `accountgroup`';
  db.query(query, (err, results) => {
    if (err) {
      return callback(err, null);
    }
    callback(null, results);
  });
};

module.exports = {
  getAccountsGroupNames,
};
