import 'package:flutter/material.dart';

class AppTheme {
  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    minimumSize: const Size(170, 50),
    backgroundColor: Colors.lightBlue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
  static const TextStyle authButtonText =
      TextStyle(color: Colors.white, fontSize: 18);
}
