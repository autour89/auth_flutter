import 'package:blog/screens/extensions/configuration.dart';
import 'package:blog/screens/extensions/strings.dart';
import 'package:flutter/material.dart';

extension StyleExtensions on BuildContext {
  InputDecoration inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.black26),
      fillColor: Colors.grey[200],
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0)),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5,
          style: BorderStyle.solid,
        ),
      ),
    );
  }
}

extension ValidationExtensions on String? {
  String? validateEmail({String? repeatEmail}) {
    if (this != null && repeatEmail != null && repeatEmail != this) {
      return Strings.emailNotMatch;
    }
    if (this == null || this!.isEmpty) {
      return Strings.notAnEmailTitle;
    }
    if (!RegExp(Configuration.emailRegExp).hasMatch(this!)) {
      return Strings.invalidEmailTitle;
    }
    return null;
  }

  String? validateRepeatEmail(String email) {
    if (this != email) {
      return '';
    }
    return null;
  }

  String? validatePassword() {
    if (this == null || this!.isEmpty) {
      return Strings.passwordError;
    }
    if (this!.length <= 3) {
      return Strings.passwordShort;
    }
    return null;
  }
}
