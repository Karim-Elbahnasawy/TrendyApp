import 'package:flutter/material.dart';
import 'package:trendy_app/config/language/app_localizations.dart';

abstract class AppValidators {
  static String? validateName(String? name, BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    if (name == null || name.trim().isEmpty) {
      return appLocalizations.name_required;
    }
    if (name.length < 6) {
      return appLocalizations.name_length;
    }
    return null;
  }

  static String? validateEmail(String? email, BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    RegExp regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (email == null || email.trim().isEmpty) {
      return appLocalizations.email_required;
    }
    if (!regExp.hasMatch(email)) {
      return appLocalizations.email_bad_format;
    }
    return null;
  }
    static String? validatePhoneNumber(String? phoneNumber, BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    RegExp regExp = RegExp(
      r'^\+?(\d{1,3})?[-.\s]?(\(?\d{2,4}?\)?)?[-.\s]?(\d{3,4})[-.\s]?(\d{4})$',
    );
    if (phoneNumber == null || phoneNumber.trim().isEmpty) {
      return appLocalizations.phone_required;
    }
    if (!regExp.hasMatch(phoneNumber)) {
      return appLocalizations.phone_bad_format;
    }
    return null;
  }

  static String? checkPassword;
  static String? validatePassword(String? password, BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    RegExp regExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    checkPassword = password;
    if (password == null || password.trim().isEmpty) {
      return appLocalizations.password_required;
    }
    if (!regExp.hasMatch(password)) {
      return appLocalizations.weak_password;
    }
    return null;
  }

  static String? validateRePassword(String? rePassword, BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    RegExp regExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (rePassword == null || rePassword.trim().isEmpty) {
      return appLocalizations.confirm_password_required;
    }
    if (!regExp.hasMatch(rePassword)) {
      return appLocalizations.weak_password;
    }
    if (rePassword != checkPassword) {
      return appLocalizations.password_not_match;
    }
    return null;
  }




}