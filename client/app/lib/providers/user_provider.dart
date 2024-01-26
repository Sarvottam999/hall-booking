import 'package:flutter/material.dart';
import 'package:oyo/models/userModel.dart';
import 'package:intl/intl.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
    likes: []
    // cart: [],
  );
  User get user => _user;

    DateTime _selectedDate = DateTime.now();
  bool _isDateSelectedAval = false;
  DateTime get selectedDate => _selectedDate;

  String get selectedDateFormated => DateFormat('MMM dd yyyy').format(_selectedDate);
  bool get isDateSelectedAval => _isDateSelectedAval;

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setIsDateSelectedAval(bool value) {
    _isDateSelectedAval = value;
    notifyListeners();
  }



  void setUser(Map<String, dynamic>  user) {
    print(user);
    _user = User.fromMap(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }

   bool getFav({ required String hallid })   {
  final present = _user.likes.contains( hallid);

  print("=============> present : $present;");

    return present;
     

   
    

    
  }


}
