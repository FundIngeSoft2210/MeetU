import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meet_u/ui/pages/LoginScreen/loginScreen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meet_u/utils/utils.dart';

class PasswordScreen extends StatefulWidget {

  const PasswordScreen({Key? key}) : super(key: key);


  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();

    void dispose() {
      _emailController.dispose();

      super.dispose();
    }

    return SafeArea(
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
                    Expanded(
                      flex: 2,
                      child: Container(
                          child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "MeetÜ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
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
                          flex: 1,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Ingrese el Correo Electrónico de su Cuenta:",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              height: 0.5,
                            )),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              hintText: "Correo Electrónico",
                              prefixIcon: Icon(Icons.mail, color: Colors.black),
                            ),
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (email) => (email != null &&
                                !EmailValidator.validate(email)) ||
                                (email != null &&
                                    !email.endsWith('javeriana.edu.co'))
                                ? 'Enter a valid email'
                                : null,
                          ),
                        ),

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
                                  child: Text("Reestablecer Contraseña",
                                      style: TextStyle(fontSize: 20)),
                                )),
                            onTap: () async {
                              try {
                                await FirebaseAuth.instance
                                    .sendPasswordResetEmail(
                                    email: _emailController.text.trim());
                                Utils.showSnackBar(
                                    'Se envió un correo a su email.');
                              } on FirebaseAuthException catch (e){
                                print (e);
                                Utils.showSnackBar(e.message);
                              }
                            },
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              height: 5,
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
                                              Navigator.of(context).pushReplacement(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                      const LoginScreen()));
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
      ),
    ));
  }
}
