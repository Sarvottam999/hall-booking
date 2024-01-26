// servicers for favourite


 
import 'package:flutter/material.dart';
import 'package:oyo/constant/error_handling.dart';
import 'package:oyo/constant/utils.dart';
import 'package:oyo/features/home/models/venueModel.dart';
import 'package:oyo/constant/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class FavService {
 

  FavService();

  Future<List<Hall>> getUserFavoriteHalls( {required  String userId,     required BuildContext context,
}) async {
      List<Hall> productList = [];

    try {
      final res = await http.post(Uri.parse('$url/api/user/get-favs',),
      headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // 'x-auth-token': userProvider.user.token,
        },
        body:  json.encode (
          {
            "userId": "$userId",

          }
      
      ));

      if (res .statusCode == 200) {
        final data = json.decode(res.body);
        // final favoriteHalls = List<Map<String, dynamic>>.from(data['favoriteHalls']);
        // return favoriteHalls;
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
     }
     } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }


  Future<bool> addToFavorites({required userId,  required hallId,   required BuildContext context,
}) async {
 
    try {
      print("------------------- inside add to fav -------------------");
      final res = await http.post(Uri.parse('$url/api/user/add-fav'),
      headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // 'x-auth-token': userProvider.user.token,
        },
        body:  json.encode (
          {
            "hallId": "$hallId",
            "userId": "$userId",

          }
        ));

      if (res .statusCode == 200) {
        final data = json.decode(res.body);
        // final favoriteHalls = List<Map<String, dynamic>>.from(data['favoriteHalls']);
        // return favoriteHalls;
          print("********* resoponse  **********");
      print(res.body);
       if (data["value"] == true) {
               showSnackBar(context, "add in your favourite");

      } else {
         showSnackBar(context, "not able to add in your favourite");

        return false;
      }

    
     }
     } catch (e) {
      showSnackBar(context, e.toString());
          return false;
    }

      return true;      


  }


  Future<bool> removeFromFavorites({required userId,  required hallId,   required BuildContext context, }) async {
 
    try {
      print("------------------- inside remove from fav -------------------");
      final res = await http.post(Uri.parse('$url/api/user/rem-fav'),
      headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // 'x-auth-token': userProvider.user.token,
        },
        body:  json.encode (
          {
            "hallId": "$hallId",
            "userId": "$userId",

          }
        ));
 if (res .statusCode == 200) {
        final data = json.decode(res.body);
        // final favoriteHalls = List<Map<String, dynamic>>.from(data['favoriteHalls']);
        // return favoriteHalls;
          print("********* resoponse  **********");
      print(res.body);
       if (data["value"] == true) {
               showSnackBar(context, "removed in your favourite");

      } else {
               showSnackBar(context, "not remove to add in your favourite");

        return false;
      }

    
     }
     } catch (e) {

      showSnackBar(context, e.toString());
          return false;

    }

      return true;      

 
  }






 

  

  

}
