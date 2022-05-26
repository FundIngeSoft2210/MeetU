import 'package:flutter/material.dart';
import 'package:meet_u/ui/screens/user/splash_screen/SplashController.dart';
import 'package:meet_u/utils/utils.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      debugShowCheckedModeBanner: false,
      home: const SplashController(),
    );
  }
}

