import 'package:advansio_test/common/utils/strings_utils.dart';
import 'package:flutter/material.dart';

class Utils {
  static String? validateEmail(String? input) {
    RegExp _emailRegExp = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    );
    if (input == null || input.isEmpty) {
      return StringsUtils.fieldReq;
    }

    if (!_emailRegExp.hasMatch(input)) {
      return StringsUtils.emailIsInvalid;
    }
    return null;
  }

  static String? validateTextField(String? input) {
    if (input == null || input.isEmpty) {
      return StringsUtils.fieldReq;
    }
    return null;
  }

  static String? validateImportantIdTextField(
      String? input, String? errorMessage) {
    if (input == null || input.isEmpty || input.length < 11) {
      return errorMessage ?? StringsUtils.fieldReq;
    }
    return null;
  }

  static String? validatePasswordTextField(String? input) {
    if (input == null || input.isEmpty || input.length < 6) {
      return StringsUtils.fieldReq;
    }
    return null;
  }

  static String? validatePinTextField(String? input, String? errorMessage) {
    if (input == null || input.isEmpty || input.length < 5) {
      return errorMessage ?? StringsUtils.fieldReq;
    }
    return null;
  }

  static void displaySnackBar(BuildContext context,
      {required String error}) async {
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => _displaySnackBar(context, error: error));
  }

  static void _displaySnackBar(BuildContext context,
      {required String error}) async {
    final snackBar = SnackBar(content: Text(error));
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    await Future.delayed(const Duration(seconds: 2));
  }
}
