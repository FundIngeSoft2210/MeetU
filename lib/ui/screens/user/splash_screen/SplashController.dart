import 'package:flutter/material.dart';
import 'package:meet_u/ui/screens/user/splash_screen/splash_screen.dart';
import '../../../animations/fade_route_animation.dart';
import '../start_screen/start_screen.dart';


class SplashController extends StatefulWidget {
  const SplashController({Key? key}) : super(key: key);

  @override
  _SplashControllerState createState() => _SplashControllerState();
}

class _SplashControllerState extends State<SplashController> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.push(
          context, FadeRoute(page: StartScreen())
      );
    }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
