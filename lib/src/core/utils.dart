import 'package:flutter/widgets.dart';

import 'package:pet_app/resources/l10n/l10n.dart';
import 'package:pet_app/src/core/services/auth_service.dart';
import 'package:pet_app/src/feature/auth/constants/aut_form_type.dart';

abstract class Utils {
  //*Check if an email is valid
  static bool validateEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  static bool validatePassword(String password) {
    RegExp regex = RegExp(r'^.{0,3}$');
    return !(regex.hasMatch(password));
  }

  static bool checkIfPasswordsAreEquals(
      String password, String confirmPassword) {
    return password.compareTo(confirmPassword) == 0;
  }

  static String? getAuthFormTextByEnum(
      {required BuildContext context,
      required FormErrorMessage? formErrorMessage,
      required AuthFormType authFormType}) {
    if (formErrorMessage != null) {
      switch (formErrorMessage) {
        case FormErrorMessage.email:
          return authFormType == AuthFormType.email
              ? context.l10n.loginScreenInvalidEmail
              : null;
        case FormErrorMessage.password:
          return authFormType == AuthFormType.password
              ? context.l10n.loginScreenPasswordWeek
              : null;
        case FormErrorMessage.confirmPassword:
          return authFormType == AuthFormType.confirmPassword
              ? context.l10n.signupScreenPasswordDontMatch
              : null;
        default:
          return null;
      }
    }
    return null;
  }
}
