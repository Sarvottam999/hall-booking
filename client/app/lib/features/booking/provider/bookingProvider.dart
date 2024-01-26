import 'package:flutter/material.dart';
import 'package:oyo/models/bookingModels.dart';
import 'package:oyo/models/userModel.dart';
import 'package:intl/intl.dart';

class BookingProvider extends ChangeNotifier {
    List<BookingModel>  _bookingList = [];
   
  List<BookingModel> get bookingList => _bookingList;

  void setBookingList(List<BookingModel> bookingList) {
    print(" inside setBookingList");
    print(bookingList);
    _bookingList = bookingList;
    notifyListeners();
  }

  // remove from cart
   
  



   


}
