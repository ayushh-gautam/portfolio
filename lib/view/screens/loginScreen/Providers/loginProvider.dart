import 'package:flutter/foundation.dart';

class LoginProvider with ChangeNotifier {
  bool _obsecureText = true;
  bool get obsecureText => _obsecureText;
  void eyeButtonSwitch() {
    _obsecureText = !_obsecureText;
    notifyListeners();
  }
}
