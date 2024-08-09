const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
    res.send('Product Catalog Service');
});

app.listen(port, () => {
    console.log(`Product catalog listening at http://localhost:${port}`);
});

