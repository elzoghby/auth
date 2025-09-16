import 'package:flutter/material.dart';

class ValidationUtils {
  static String? validateEmailInput({
    required BuildContext context,
    required String? email,
    Map<String, String>? validState,
  }) {
    if (email != null && email.isNotEmpty) {
      final RegExp emailRegExp =
          RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
      if (!emailRegExp.hasMatch(email)) {
        return 'Enter a valid email address';
      }
    }

    if (validState?.containsKey("email") ?? false) {
      String errorMessage = validState!["email"]!.replaceFirst("email: ", "");
      return errorMessage;
    }

    return null; // Email is optional
  }
}
