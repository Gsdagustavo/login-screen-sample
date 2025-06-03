import 'package:flutter/material.dart';
import 'package:login_screen/controller/providers/login_provider.dart';
import 'package:provider/provider.dart';

/// This is a login page that has features such as validation, alignment, InkWell, etc.
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<LoginProvider>(
          builder: (context, loginProvider, child) {
            return Column(
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
                        key: loginProvider.formsKey,

                        /// Text form fields
                        child: Column(
                          children: [
                            /// Username text field
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: TextFormField(
                                onTapUpOutside:
                                    (_) => FocusScope.of(context).unfocus(),
                                validator: loginProvider.usernameValidator,
                                controller: loginProvider.usernameController,
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
                                validator: loginProvider.passwordValidator,
                                controller: loginProvider.passwordController,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  prefixIcon: Icon(Icons.lock_outlined),
                                ),

                                /// Hides the text
                                obscureText: true,
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// Register labels
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
                          onTap: () => loginProvider.sendForms(context),
                          child: Ink(
                            decoration: BoxDecoration(color: Colors.black),
                            width: 175,
                            height: 60,
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
