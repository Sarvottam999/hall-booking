import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:oyo/constant/constant.dart';
import 'package:oyo/constant/error_handling.dart';
import 'package:oyo/constant/utils.dart';
import 'package:oyo/features/detailScreen/provider/user.dart';
import 'package:oyo/providers/user_provider.dart';
import 'package:provider/provider.dart';


class DetailService {


    Future   checkAvailability({
    required BuildContext context, 
    required DateTime  date,
    required String hallId,
  }) async {
  final userProviser = Provider.of<UserJourDate>(context, listen: false);
// print("********* date  **********");
// print(date);
    // final userProvider = Provider.of<UserProvider>(context, listen: false);
     try {
      http.Response res = await http.post(
       Uri.parse('$url/api/booking/availability'),
       headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
  "hallId": hallId,
  "date": DateFormat('yyyy-MM-dd').format((date))
}),

     );

      

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {

          var data = json.decode(res.body) as Map<String, dynamic>;
          if (data["available"] == true) {
            Provider.of<UserProvider>(context, listen: false).setIsDateSelectedAval(true);
          } else {
            Provider.of<UserProvider>(context, listen: false).setIsDateSelectedAval(false);
          }
          
      
        },
      );
  
     
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
  
}