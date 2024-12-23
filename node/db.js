const mysql = require('mysql');

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'react_db'
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL database:', err);
    return;
  }
  console.log('Connected to MySQL database');
});


// const db = mysql.createPool({
//   host: 'auth-db613.hstgr.io',
//   user: 'u330334144_react_db_user',
//   password: 'React@3iq#',
//   database: 'u330334144_react_db',
//   port: 3306,
//   connectionLimit: 10, // Adjust as needed
//   multipleStatements: true
// });

// db.getConnection((err, connection) => {
//   if (err) {
//     console.error('Error getting connection from pool:', err);
//     return;
//   }
//   console.log('Connected to MySQL database');
//   connection.release(); // Release the connection back to the pool
// });




module.exports = db;
