import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  final _formsKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  /// Validator for the username
  String? _usernameValidator(String? username) {
    return _validateString(username) ? null : 'Invalid username';
  }

  /// Validator for the password
  String? _passwordValidator(String? password) {
    return _validateString(password) ? null : 'Invalid password';
  }

  /// Returns [true] if the string is valid. Returns [false] otherwise
  ///
  /// In this context, [valid] means that the string is neither [null] nor [empty]
  bool _validateString(String? string) {
    return string?.isNotEmpty ?? false;
  }

  /// Validates the form state and shows a feedback snackbar
  void _sendForms(BuildContext context) {
    if (_formsKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Logged in successfully'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid credentials'),
          backgroundColor: Colors.red,
        ),
      );
    }

    /// Clears the input texts
    _usernameController.clear();
    _passwordController.clear();
  }
}
