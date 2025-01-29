// // post
// // set
// // get
// // update
// // delete
// // console.log("Hello World");
// // console.log("Hello World");
// const name = "ayush";
// console.log(name);


// IMPORTS
const express = require('express');
const http = require('http');
const mongoose = require('mongoose');

// CREATING A SERVER
const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);

// middle ware
app.use(express.json()); // whatever data is stored/ received is in the json format.

// FRONTEND -> MIDDLEWARE -> BACKEND. MIDDLEWARE IS USED FOR MANIPULATING THE DATA

// CONNECT TO MONGODB


// LISTEN TO SERVER
server.listen(port, "0.0.0.0", () => {
    console.log(`Server started and running on port ${port}`);
})


// EVERYTING IN JS IS AN OBJECT

