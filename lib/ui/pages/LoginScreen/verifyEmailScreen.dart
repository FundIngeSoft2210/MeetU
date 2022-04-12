import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meet_u/ui/pages/LoginScreen/loginScreen.dart';
import 'package:meet_u/ui/pages/MainMenu/mainMenuScreen.dart';
import 'package:meet_u/utils/utils.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 3),
            (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      Utils.showSnackBar("Debe esperar unos segundos antes de volver a enviar el correo de verificación");
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const MainMenuScreen()
      : SafeArea(
    child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.black,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/MeetU_Logo.png"))),
                            ),
                          )),
                      const Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "MeetÜ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                height: 1,
                              )),
                          const Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "Se ha enviado un correo de verificación a su email.",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                height: 1,
                              )),

                          Expanded(
                            flex: 1,
                            child: InkWell(
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      border: Border.all(color: Colors.black),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: const Align(
                                    alignment: Alignment.center,
                                    child: Text("Reenviar Email",
                                        style: TextStyle(fontSize: 20)),
                                  )),
                              onTap: ()  {
                                canResendEmail ? sendVerificationEmail():Utils.showSnackBar("Debe esperar unos segundos antes de volver a enviar el correo de verificación");
                              },
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Container(
                                height: 1,
                              )),
                          Expanded(
                              flex: 1,
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "Cancelar",
                                            style: const TextStyle(
                                                color: Colors.black, fontSize: 16),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                FirebaseAuth.instance.signOut();
                                                Navigator.of(context).pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) => LoginScreen()));
                                              }),
                                      ],
                                    ),
                                  ))),
                        ],
                      )),
                ),
              ),
            ),
          ],
        )),
  );

/*
  @override
  Widget build(BuildContext context) => isEmailVerified
      ? MainMenuScreen()
      : Scaffold(
          appBar: AppBar(
            title: Text('Verificar Correo'),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Se ha enviado un correo de verificación a su email.',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height:24),
                ElevatedButton.icon(
                  style:ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                  ),
                  icon: Icon(Icons.email, size: 32),
                  label: Text('Reenviar Correo',
                  style: TextStyle(fontSize: 24),
                  ),
                  onPressed: canResendEmail ? sendVerificationEmail:Utils.showSnackBar("Debe esperar unos segundos antes de volver a enviar el correo."),
                ),
                SizedBox(height: 8,),
                TextButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 24),
                    ),
                    onPressed: () async{
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));

                    },
                )
              ],
          ),
          )
  );*/
}
