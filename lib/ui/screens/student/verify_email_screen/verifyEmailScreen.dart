import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meet_u/event_controller/event_controller.dart';
import 'package:meet_u/ui/screens/user/start_screen/start_screen.dart';
import '../../../../model/entities/student.dart';



class VerifyEmailScreen extends StatefulWidget {
  Student student;
  VerifyEmailScreen({Key? key, required this.student}) : super(key: key);

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isEmailVerified = false;
  Timer? timer;
  final EventController _eventController=EventController();


  @override
  void initState(){
    isEmailVerified=_eventController.checkEmailIsVerified();
    if(isEmailVerified)_eventController.finishSignUp(widget.student);
    if (!isEmailVerified) {
      _eventController.sendVerificationEmail();
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

  /*@override
  void initState(){
    _eventController.checkEmailIsVerified().then((value)  {
      isEmailVerified=value;
      if(value){
        _eventController.finishSignUp(widget.student);
        Navigator.pop(context);
        Navigator.pop(context);
      };

    });
    if (!isEmailVerified) {
      _eventController.sendVerificationEmail();
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
    super.initState();
  }*/


  checkEmailVerified() async {
    bool check= _eventController.checkEmailIsVerified();
    setState(() => isEmailVerified = check);
    if (isEmailVerified){
      timer?.cancel();
     await _eventController.finishSignUp(widget.student);
    }
  }


  @override
  Widget build(BuildContext context) => isEmailVerified?
      StartScreen()
      :
      SafeArea(
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
                                    onTap: ()async{
                                      await _eventController.sendVerificationEmail();
                                      await checkEmailVerified();
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
                                                          _eventController.signOut();
                                                          Navigator.pop(context);
                                                          Navigator.pop(context);
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
