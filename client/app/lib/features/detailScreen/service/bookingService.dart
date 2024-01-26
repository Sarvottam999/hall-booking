// services for booking
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:oyo/constant/constant.dart';
import 'package:oyo/constant/error_handling.dart';
import 'package:oyo/constant/utils.dart';
import 'package:oyo/features/booking/provider/bookingProvider.dart';
import 'package:oyo/features/detailScreen/provider/user.dart';
import 'package:oyo/models/bookingModels.dart';
import 'package:oyo/providers/user_provider.dart';
import 'package:provider/provider.dart';

class BookingService {
  Future bookHall({
    required BuildContext context,
    // required DateTime  bookinDate,
    required String hallId,
  }) async {
    final userProviser = Provider.of<UserProvider>(context, listen: false);
// print("********* date  **********");
// print(date);
    // final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$url/api/booking'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "userId": userProviser.user.id,
          "hallId": hallId,
          "bookingDate":
              DateFormat('yyyy-MM-dd').format((userProviser.selectedDate))
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          Map<String, dynamic> data = json.decode(res.body);
          showSnackBar(context, "booked you hall");

          // if (data["available"] == true) {
          //   Provider.of<UserProvider>(context, listen: false).setIsDateSelectedAval(true);
          // } else {
          //   Provider.of<UserProvider>(context, listen: false).setIsDateSelectedAval(false);
          // }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

// =============================================

  Future<void> getAllBooking({
    required BuildContext context,
    // required DateTime  bookinDate,
    // required String hallId,
  }) async {
    final userProviser = Provider.of<UserProvider>(context, listen: false);
// print("********* date  **********");
// print(date);
    // final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$url/api/booking/allBookingsSpecificUser'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "userId": userProviser.user.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print(res.body);

          // Map<String, dynamic> data = json.decode(res.body)  ;
          // showSnackBar(context, "booked you hall");

          // if (data["available"] == true) {
          Provider.of<BookingProvider>(context, listen: false)
              .setBookingList(bookingModelFromJson(res.body));
          // } else {
          //   Provider.of<UserProvider>(context, listen: false).setIsDateSelectedAval(false);
          // }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> deleteBooking({
    required BuildContext context,
    // required DateTime  bookinDate,
    required String bookingId,
  }) async {
    // final userProviser = Provider.of<UserProvider>(context, listen: false);
// print("********* date  **********");
// print(date);
    // final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.delete(
        Uri.parse('$url/api/booking/$bookingId'),

//     body: jsonEncode(<String, String>{
//       "userId" : userProviser.user.id,
// }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print(res.body);

          if (res.statusCode == 200) {
            showSnackBar(context, "Cancelled your booking");
            Provider.of<BookingProvider>(context, listen: false)
              .setBookingList([]);
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
