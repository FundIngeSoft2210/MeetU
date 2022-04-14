import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meet_u/external_services/auth.dart';
import 'package:meet_u/ui/screens/home_screen/home_screen.dart';
import 'package:meet_u/utils/utils.dart';
import '../LoginScreen/loginScreen.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;
  final  AuthService _authService=AuthService();


  @override
  void initState() {
    isEmailVerified = _authService.checkEmailIsVerified();
    if (!isEmailVerified) {
      _authService.sendVerificationEmail();
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }


  checkEmailVerified() async {
    await _authService.reload();
    setState(() => isEmailVerified = _authService.checkEmailIsVerified());
    if (isEmailVerified) timer?.cancel();
  }


   sendVerificationEmail() async {
    try {
      await _authService.sendVerificationEmail();
      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      Utils.showSnackBar("Debe esperar unos segundos antes de volver a enviar el correo de verificación");
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const HomeScreen()
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
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        child: const Align(
                                          alignment: Alignment.center,
                                          child: Text("Reenviar Email",
                                              style: TextStyle(fontSize: 20)),
                                        )),
                                    onTap: () {
                                      canResendEmail
                                          ? sendVerificationEmail()
                                          : Utils.showSnackBar(
                                              "Debe esperar unos segundos antes de volver a enviar el correo de verificación");
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
                                                      color: Colors.black,
                                                      fontSize: 16),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () {
                                                        _authService.signOut();
                                                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => const LoginScreen()));
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
}
