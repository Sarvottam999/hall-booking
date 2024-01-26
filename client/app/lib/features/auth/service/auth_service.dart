import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oyo/constant/constant.dart';
import 'package:oyo/constant/utils.dart';
import 'package:oyo/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AuthService {
  // sign up user
  // void signUpUser({
  //   required BuildContext context,
  //   required String email,
  //   required String password,
  //   required String name,
  // }) async {
  //   try {
  //     User user = User(
  //       id: '',
  //       name: name,
  //       password: password,
  //       email: email,
  //       address: '',
  //       type: '',
  //       token: '',
  //       cart: [],
  //     );

  //     http.Response res = await http.post(
  //       Uri.parse('$uri/api/signup'),
  //       body: user.toJson(),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //     );

  //     httpErrorHandle(
  //       response: res,
  //       context: context,
  //       onSuccess: () {
  //         showSnackBar(
  //           context,
  //           'Account created! Login with the same credentials!',
  //         );
  //       },
  //     );
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  // }

  // sign in user
  // void signInUser({
  //   required BuildContext context,
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     http.Response res = await http.post(
  //       Uri.parse('$uri/api/signin'),
  //       body: jsonEncode({
  //         'email': email,
  //         'password': password,
  //       }),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //     );
  //     httpErrorHandle(
  //       response: res,
  //       context: context,
  //       onSuccess: () async {
  //         SharedPreferences prefs = await SharedPreferences.getInstance();
  //         Provider.of<UserProvider>(context, listen: false).setUser(res.body);
  //         await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
  //         Navigator.pushNamedAndRemoveUntil(
  //           context,
  //           BottomBar.routeName,
  //           (route) => false,
  //         );
  //       },
  //     );
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  // }

  // get user data
  void getUserData(
    BuildContext context,
  ) async {
    try {
      print("insode get user data");
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // String? token = prefs.getString('x-auth-token');

      // if (token == null) {
      //   prefs.setString('x-auth-token', '');
      // }

      // var tokenRes = await http.post(
      //   Uri.parse('$uri/tokenIsValid'),
      //   headers: <String, String>{
      //     'Content-Type': 'application/json; charset=UTF-8',
      //     'x-auth-token': token!
      //   },
      // );

      // var response = jsonDecode(tokenRes.body);

      // if (response == true) {
        print("****************>   get request");
        http.Response userRes = await http.post(
          Uri.parse('$url/api/getuser'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            // 'x-auth-token': token
          },
          body: json.encode( {
            '_id': "65b2faeeb373952ef9467710",
          }),
        );

        print("****************>   get response");
        print(userRes.body);

        print("****************>   setting user");
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      // }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
