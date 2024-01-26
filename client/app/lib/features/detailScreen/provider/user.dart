import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class UserJourDate extends ChangeNotifier {
  DateTime _selectedDate = DateTime.now();
  bool _isDateSelectedAval = false;

  DateTime get selectedDate => _selectedDate;
  bool get isDateSelectedAval => _isDateSelectedAval;

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setIsDateSelectedAval(bool value) {
    _isDateSelectedAval = value;
    notifyListeners();
  }
}
