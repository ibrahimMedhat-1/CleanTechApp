
import 'package:flutter/material.dart';

class HandlePasswordValidateServices {
  String validatePassword(String password) {
    if (password.length < 8) {
      return 'Weak';
    }
    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    bool hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (hasUppercase && hasLowercase && hasDigits && hasSpecialCharacters) {
      return 'Strong';
    } else {
      return 'Moderate';
    }
  }

  Color getColorForStrength(String strength) {
    switch (strength) {
      case 'Weak':
        return Colors.red;
      case 'Moderate':
        return Colors.orange;
      case 'Strong':
        return Colors.green;
      default:
        return Colors.black;
    }
  }
}
