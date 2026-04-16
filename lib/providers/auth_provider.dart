import 'package:flutter/material.dart';

import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _currentUser;
  bool _isLoggedIn = false;

  UserModel? get currentUser => _currentUser;
  bool get isLoggedIn => _isLoggedIn;

  bool login(String email, String password) {
    if (email.isNotEmpty && password.isNotEmpty) {
      _currentUser = UserModel(
        name: 'Carlos',
        email: email,
        phone: '(00) 00000-0000',
        password: password,
      );
      _isLoggedIn = true;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool register(UserModel user) {
    _currentUser = user;
    _isLoggedIn = true;
    notifyListeners();
    return true;
  }

  bool forgotPassword(String email) {
    return email.isNotEmpty;
  }

  void logout() {
    _currentUser = null;
    _isLoggedIn = false;
    notifyListeners();
  }
}
