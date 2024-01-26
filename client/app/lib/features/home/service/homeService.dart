import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oyo/constant/constant.dart';
import 'package:oyo/constant/error_handling.dart';
import 'package:oyo/constant/utils.dart';
import 'package:oyo/models/userModel.dart';
import 'package:oyo/models/venueModel.dart';
import 'package:oyo/providers/user_provider.dart';
import 'package:provider/provider.dart';
class HomeService  {


  Future<List<Hall>> fetchSearchedProduct({
    required BuildContext context,
  }) async {
    // final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Hall> productList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$url/api/halls'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // 'x-auth-token': userProvider.user.token,
        },
      );

      print("********* resoponse  **********");
      print(res.body);

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print("inside on success");
          productList = hallFromJson(res.body);
          
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }


    
   
}
