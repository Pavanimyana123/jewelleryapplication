const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const userRoutes = require('./routes/userRoutes');
const purityRoutes = require('./routes/purityRoutes');
const productRoutes = require('./routes/productRoutes');
const metalTypeRoutes = require('./routes/metalTypeRoutes');
const designMasterRoutes = require('./routes/designMasterRoutes');
const accountRoutes = require('./routes/accountRoutes');
const accountGroupRoutes = require('./routes/accountGroup');
const receiptRoutes = require('./routes/receiptRoutes');
const paymentRoutes = require('./routes/paymentRoutes');
const repairRoutes = require('./routes/repairRoutes');
const accountDetailsRoutes = require('./routes/accountdetailsRoutes');
const receiptAccountNameRoutes = require("./routes/receiptaccountname/receiptaccountnameroute");
const paymentAccountNameRoutes = require("./routes/paymentaccountname/paymentaccountnameroute");
const estimateRoutes = require("./routes/estimateRoutes");
const openingTagsRoutes = require('./routes/openingTagsRoutes');
const salesRoutes = require("./routes/sales/salesroute");
const taxSlabRoutes = require('./routes/taxSlabRoutes');
const stoneDetailsRoutes = require('./routes/stoneDetailsRoutes');
const ratesRoutes = require('./routes/ratesRoute');
const invoiceRoutes = require("./routes/sales/invoiceroute");
const urdRoutes = require("./routes/urdRoutes");

const app = express();
const PORT = 5000;

app.use(cors());
app.use(bodyParser.json());
app.use('/', userRoutes);
app.use('/', purityRoutes);
app.use('/', productRoutes);
app.use('/', metalTypeRoutes);
app.use('/', designMasterRoutes);
app.use('/', accountRoutes);
app.use('/', accountGroupRoutes);
app.use('/', receiptRoutes);
app.use('/', paymentRoutes);
app.use('/', repairRoutes);
app.use('/', accountDetailsRoutes);
app.use("/", receiptAccountNameRoutes);
app.use("/", paymentAccountNameRoutes);
app.use('/', estimateRoutes);
app.use("/", openingTagsRoutes);
app.use("/", salesRoutes);
app.use("/", taxSlabRoutes);
app.use("/", stoneDetailsRoutes);
app.use('/', ratesRoutes);
app.use("/", invoiceRoutes);
app.use('/', urdRoutes);

// Start the server
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
