const express = require("express");
const Booking = require("../models/booking");
const moment = require("moment");
const Hall = require("../models/hall");
const ObjectId = require('mongoose').Types.ObjectId;

const bookingRouter = express.Router();

// Create a new booking:

bookingRouter.post("/api/booking", async (req, res) => {
  try {
    const newBooking = await Booking.create(req.body);
    res.status(201).json(newBooking);
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error" });
  }
});
bookingRouter.get("/api/booking", async (req, res) => {
  try {
    const list = await Booking.find(req.body);
    res.status(201).json(list);
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error" });
  }
});

// Retrieve all bookings for a specific user
bookingRouter.post("/booking/allBookingsSpecificUser", async (req, res) => {
  var returnData = [];
  // return hotelname, adress , booking date, status
  // try {
  //   const bookings = await Booking.find({ userId: req.body.userId });
  //   res.json(bookings);
  // } catch (error) {
  //   res.status(500).json({ error: 'Internal Server Error' });
  // }

  try {
    const bookUserings = await Booking.find({ userId: req.body.userId });

    
    // const hallIds = bookings.map((booking){

    //     return booking.hallId;


    //  } );

    for (let booking of bookings) {
      const hall = await Hall.findById(booking.hallId);
if(hall){
      returnData.push({
        hallName: hall.name,
        hallLocation: hall.location,
        bookingDate: booking.bookingDate,
        status: booking.status,
      });
    }
    }
    // console.log(hallIds);

   
    
    // // Assuming you want to find halls with these ObjectIds
    // const hall = await Hall.find({ _id: { $in: a } });
    // // console.log(halls);
    // for (let hall of bookings) {

        

      // const hall = await Hall.findById(booking.hallId);

      //  returnData.push({
      //   hallName: hall.name,
      //   hallLocation: hall.location,
      //   bookingDate: booking.bookingDate,
      //   status: booking.status,
      // });
    // }

    if (  !returnData) {
      return res.status(404).json({ error: "internal server error" });
    }
    res.status(200).json(returnData);
  } catch (error) {
    console.log(error);
// res.status(500).json(error);
  }
});

// Retrieve all bookings for a specific hall
bookingRouter.get(
  "/booking/allBookingsSpecificHall/:hallId",
  async (req, res) => {
    try {
      const bookings = await Booking.find({ hallId: req.params.hallId });
      res.json(bookings);
    } catch (error) {
      res.status(500).json({ error: "Internal Server Error" });
    }
  }
);

// Retrieve information about a specific booking
bookingRouter.get(
  "/booking/infoSpecificBooking/:bookingId",
  async (req, res) => {
    try {
      const booking = await Booking.findById(req.params.bookingId);
      if (!booking) {
        return res.status(404).json({ error: "Booking not found" });
      }
      res.json(booking);
    } catch (error) {
      res.status(500).json({ error: "Internal Server Error" });
    }
  }
);

// Update the status or details of a booking
bookingRouter.put("booking/:bookingId", async (req, res) => {
  try {
    const updatedBooking = await Booking.findByIdAndUpdate(
      req.params.bookingId,
      req.body,
      { new: true }
    );
    if (!updatedBooking) {
      return res.status(404).json({ error: "Booking not found" });
    }
    res.json(updatedBooking);
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error" });
  }
});

//   // Assuming you have a Booking model in your MongoDB schema

bookingRouter.post("/api/booking/availability", async (req, res) => {
  const { hallId, date } = req.body;

  try {
    console.log(req.body);
    console.log(new Date(date));
    const existingBooking = await Booking.findOne({
      hallId,
      bookingDate: new Date(date),
    });
    console.log(existingBooking);

    if (existingBooking) {
      res.json({
        available: false,
        message: "Hall not available on the specified date.",
      });
    } else {
      res.json({
        available: true,
        message: "Hall is available on the specified date.",
      });
    }
    // res.json
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error" });
  }
});

// delete all bookings
bookingRouter.delete("/api/booking", async (req, res) => {
  try {
    await Booking.deleteMany();
    res.status(204).end();
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error" });
  }
});

// bookingRouter.get('/api/booking/availability', async (req, res) => {
//     const { hallId, date } = req.body;

//     // console.log(date);

//     try {
//         const parsedDate = moment(date, 'YYYY-MM-DD', true); // Parse date using moment.js
//         if (parsedDate.isValid()) {
//             console.log(parsedDate.toDate());
//             res.json({ success: true });
//         } else {
//             res.status(400).json({ error: 'Invalid date format' });
//         }
//     } catch (error) {
//         res.status(500).json({ error: 'Internal Server Error' });
//     }
// });

module.exports = bookingRouter;
