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

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              padding: const EdgeInsets.all(60.0),
              child: Column(
                children: [
                  /// Username text field
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Username',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                  ),

                  /// Password text field
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock_outlined),
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
