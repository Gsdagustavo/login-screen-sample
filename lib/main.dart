import 'package:flutter/material.dart';

/// Entry point for running the [Main App]
void main() {
  runApp(const MyApp());
}

/// [Main App]
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// Defines the app's title
      title: 'Login',
      debugShowCheckedModeBanner: false,

      /// Defines the default theme data
      theme: ThemeData(brightness: Brightness.light),

      routes: {'/loginPage': (_) => const LoginPage()},
      initialRoute: '/loginPage',
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

  void _sendForms() {
    if (_formsKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Logged in successfully')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Invalid credentials')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Sign in text
            Text(
              'SIGN IN',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),

            Padding(
              padding: const EdgeInsets.all(45.0),
              child: Column(
                children: [
                  /// Form to validate the inputs
                  Form(
                    key: _formsKey,

                    /// Text form fields
                    child: Column(
                      children: [
                        /// Username text field
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: TextFormField(
                            onTapUpOutside:
                                (_) => FocusScope.of(context).unfocus(),
                            validator: _usernameValidator,
                            controller: _usernameController,
                            decoration: InputDecoration(
                              hintText: 'Username',
                              prefixIcon: Icon(Icons.person_outline),
                            ),
                          ),
                        ),

                        /// Password text field
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: TextFormField(
                            onTapUpOutside:
                                (_) => FocusScope.of(context).unfocus(),
                            controller: _passwordController,
                            validator: _passwordValidator,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock_outlined),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      /// "Don't have an account?" text
                      Text('Don\'t have an account?'),

                      /// "Register Here" text
                      TextButton(
                        onPressed: null,
                        child: Text(
                          'Register Here',
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// Login button
                  Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: InkWell(
                      child: Ink(
                        decoration: BoxDecoration(color: Colors.black),
                        width: 175,
                        height: 60,
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
