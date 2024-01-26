// servicers for favourite


 
import 'package:flutter/material.dart';
import 'package:oyo/constant/error_handling.dart';
import 'package:oyo/constant/utils.dart';
import 'package:oyo/models/venueModel.dart';
import 'package:oyo/constant/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class FavService {
 

  FavService();

  Future<List<Hall>> getUserFavoriteHalls( {required  String userId,     required BuildContext context,
}) async {
      List<Hall> productList = [];

    try {
      http.Response res = await http.post(Uri.parse('$url/api/user/get-favs',),
      headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // 'x-auth-token': userProvider.user.token,
        },
        body:  json.encode (
          {
            "userId": "$userId",

          }
      
      ));

        // final favoriteHalls = List<Map<String, dynamic>>.from(data['favoriteHalls']);
        // return favoriteHalls;
          print("********* resoponse  **********");
      print(res.body);

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print("inside on success");
           final data = json.decode(res.body);

          productList = hallFromJson(res.body);
          
        },
      );
     } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }







 

  

  

}
