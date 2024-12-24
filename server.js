const express = require("express");
const path = require("path");
const app = express();
const port = 80;

// Serve static files from the src/views directory
app.use(express.static(path.join(__dirname, "src", "views")));

// Route to serve index.html
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "src", "views", "index.html"));
});

// Start the server - Modified to listen on all interfaces
app.listen(port, '0.0.0.0', () => {
  console.log(`Server is running at http://0.0.0.0:${port}`);
});
