import 'package:flutter/material.dart';
import 'package:oyo/features/auth/model/userModel.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
    // cart: [],
  );

  User get user => _user;

  void setUser(String user) {
    print(user);
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
