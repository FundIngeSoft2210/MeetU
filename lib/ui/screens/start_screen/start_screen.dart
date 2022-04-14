import 'package:flutter/material.dart';
import 'package:meet_u/external_services/auth.dart';
import '../LoginScreen/loginScreen.dart';
import '../verify_email_screen/verifyEmailScreen.dart';

class StartScreen extends StatelessWidget {
  final AuthService _authService=AuthService();
  StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      body: StreamBuilder(
          stream: _authService.authStatus,
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.data != null &&
                snapshot.data.toString().isNotEmpty) {
              return const VerifyEmailScreen();
            } else {
              return const LoginScreen();
            }
          }));
}