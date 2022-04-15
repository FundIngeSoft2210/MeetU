import 'package:flutter/material.dart';
import 'package:meet_u/external_services/auth.dart';
import '../LoginScreen/loginScreen.dart';
import '../home_controller/home_controller.dart';


class StartScreen extends StatelessWidget {
  final AuthService _authService=AuthService();
  StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
      body: StreamBuilder(
          stream: _authService.authStatus,
          builder: (BuildContext context, AsyncSnapshot  snapshot) {
            if(!snapshot.hasData || snapshot.hasError){
              return const LoginScreen();
            } else {
              return HomeController(userId: snapshot.data.uid);
            }
          }
        )
  );
}