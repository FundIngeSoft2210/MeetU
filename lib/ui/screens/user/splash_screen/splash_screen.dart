import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.black,
          child:  Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/MeetU_Logo.png")
                  )
              ),
            ),
          ),
        )
    );
  }
}





