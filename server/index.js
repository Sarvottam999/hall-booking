const express = require("express");
const mongoose = require("mongoose");
const cors = require('cors');

const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const hallRouter = require("./routes/hall");
const bookingRouter = require("./routes/booking");



const PORT = 4000;
const app = express();
const DB ="mongodb+srv://sarvottamsharma999:9503444265Mongodb@cluster0.8y5r0ed.mongodb.net/?retryWrites=true&w=majority"
app.use(cors());

// Middleware for request logging
app.use((req, res, next) => {
   const startTime = new Date();
 
   // Capture the response status code
   res.on("finish", () => {
     const endTime = new Date();
     const elapsedTime = endTime - startTime;
     console.log(`[${endTime.toISOString()}] ${req.method} ${req.url} - ${res.statusCode} (${elapsedTime} ms)`);
   });
 
   next();
 });


 
app.use(express.json());
app.use(authRouter);
app.use(adminRouter)
app.use(hallRouter);
app.use(bookingRouter);


 mongoose.connect(DB  ).then(()=> {
    console.log("connect db successfully")
 }).catch((e)=>{
    console.log(e);
 });


app.listen(PORT, ()=> {
    console.log(`connected at prt ${PORT}`);
 
})

