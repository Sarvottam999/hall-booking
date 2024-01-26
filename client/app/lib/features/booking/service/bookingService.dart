// // search api services

// import 'dart:convert';

// import 'package:meta/meta.dart';
// import 'package:oyo/models/venueModel.dart';
// // import 'package:oyo/features/search/model/searchModel.dart';
// import 'package:oyo/constant/constant.dart';
// import 'package:oyo/constant/error_handling.dart';
// import 'package:oyo/constant/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

 
// class BookingService   {
//   Future<List<Hall>> bookHall({
//     required BuildContext context,required String searchValue
//   }) async {
//     // final userProvider = Provider.of<UserProvider>(context, listen: false);
//     List<Hall> productList = [];
//     try {
  
//       http.Response res = await http.post(
//         Uri.parse('$url/api/halls/search'),
//         headers: {
//           'Content-Type': 'application/json; charset=UTF-8',
//           // 'x-auth-token': userProvider.user.token,
//         },
       
//         body:  json.encode (
//           {
//             "searchParam": "$searchValue",
//           }
//         )
//       );

//       print("********* resoponse  **********");
//       print(res.body);

//       httpErrorHandle(
//         response: res,
//         context: context,
//         onSuccess: () {
//           print("inside on success");
//           productList = hallFromJson(res.body);
          
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//         print("*********** new value ********* ${ productList.length} `` `$searchValue`");
//     return productList;
//   }
// }


         