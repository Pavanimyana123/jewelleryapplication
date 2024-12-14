const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const purityRoutes = require('./routes/purityRoutes');
const productRoutes = require('./routes/productRoutes');
const metalTypeRoutes = require('./routes/metalTypeRoutes');
const designMasterRoutes = require('./routes/designMasterRoutes');
const accountRoutes = require('./routes/accountRoutes');

const accountsgroupRoutes = require('./routes/accountGroup');

const receiptRoutes = require('./routes/receiptRoutes');
const paymentRoutes = require('./routes/paymentRoutes');
const repairRoutes = require('./routes/repairRoutes');
const account_details = require('./routes/accountdetailsRoutes');
const receipt_accountname = require("./routes/receiptaccountname/receiptaccountnameroute");
const payment_accountname = require("./routes/paymentaccountname/paymentaccountnameroute");
const estimateRoutes = require("./routes/estimateRoutes");

const openingTagsRoutes = require('./routes/openingTagsRoutes');
const salesroute = require("./routes/sales/salesroute");
const taxSlabRoutes = require('./routes/taxSlabRoutes');


const app = express();
app.use(cors());
const PORT = 5000;

app.use(bodyParser.json());



app.use('/', purityRoutes);
app.use('/', productRoutes);
app.use('/', metalTypeRoutes);
app.use('/', designMasterRoutes);
app.use('/', accountRoutes);

app.use('/', accountsgroupRoutes);

app.use('/', receiptRoutes);
app.use('/', paymentRoutes);
app.use('/', repairRoutes);
app.use('/', account_details);
app.use("/", receipt_accountname);
app.use("/", payment_accountname);

app.use('/', estimateRoutes);

app.use("/", openingTagsRoutes);
app.use("/", salesroute);
app.use("/", taxSlabRoutes);



app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
