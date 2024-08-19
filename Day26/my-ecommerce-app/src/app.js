const express = require('express');
const path = require('path');

const app = express();

// Set the port
const port = process.env.PORT || 3000;

// Serve static files from S3 (use full URLs to your S3 bucket)
app.use('/static', express.static('public'));

// Serve dynamic content
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'views', 'index.html'));
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
