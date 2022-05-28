import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {


  return AppBar(
    leading: const BackButton(),
    title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Image.asset(
        'assets/images/MeetU_Logo.png',
        fit: BoxFit.contain,
        height: 32,
      )
    ]),
    backgroundColor: Colors.black,
    elevation: 0,
  );
}
