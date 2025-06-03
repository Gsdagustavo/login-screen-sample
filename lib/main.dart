import 'package:flutter/material.dart';
import 'package:login_screen/view/pages/login_page.dart';

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
