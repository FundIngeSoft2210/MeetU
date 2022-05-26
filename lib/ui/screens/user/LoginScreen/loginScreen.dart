import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meet_u/event_controller/event_controller.dart';
import '../../student/recover_password_screen/passwordScreen.dart';
import '../../student/sign_up_screen/signUpScreen.dart';




class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final EventController _eventController=EventController();


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async=>false,
      child: SafeArea(
          child: Scaffold(
              body: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
                    child: Column(
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
                          flex: 4,
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
                                            "Ingresa tus credenciales:",
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
                                        flex: 2,
                                        child: TextField(
                                          controller: _passwordController,
                                          obscureText: true,
                                          decoration: const InputDecoration(
                                            hintText: "Contraseña",
                                            prefixIcon: Icon(Icons.lock, color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Align(
                                              alignment: Alignment.topRight,
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                        text: "¿Olviste tu contraseña?",
                                                        style: const TextStyle(
                                                            color: Colors.blue, fontSize: 16),
                                                        recognizer: TapGestureRecognizer()
                                                          ..onTap = () {
                                                            Navigator.of(context).push(
                                                                MaterialPageRoute(
                                                                    builder: (context) =>
                                                                    const RecoverPasswordScreen()));
                                                          }),
                                                  ],
                                                ),
                                              ))),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 0.5,
                                          )),
                                      Expanded(
                                        flex: 2,
                                        child: InkWell(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  border: Border.all(color: Colors.black),
                                                  borderRadius: const BorderRadius.all(
                                                      Radius.circular(10))),
                                              child: const Align(
                                                alignment: Alignment.center,
                                                child: Text("Iniciar Sesión",
                                                    style: TextStyle(fontSize: 20)),
                                              )),
                                          onTap: ()async{
                                            await _eventController.loginUsingEmailPassword(
                                                _emailController.text,
                                                _passwordController.text);
                                          },
                                        ),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 1,
                                          )),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                              color: Colors.orange,
                              child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 1.5,
                                            )),
                                        const Expanded(
                                          flex: 1,
                                          child: Text(
                                            "¿No tienes cuenta?",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 0.5,
                                            )),
                                        Expanded(
                                          flex: 2,
                                          child: InkWell(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(color: Colors.black),
                                                      borderRadius: const BorderRadius.all(
                                                          Radius.circular(10))),
                                                  child: const Align(
                                                    alignment: Alignment.center,
                                                    child: Text("Crear cuenta",
                                                        style: TextStyle(fontSize: 20)),
                                                  )),
                                              onTap: () async {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                        const SignUpScreen()));
                                                }
                                              ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 1.5,
                                            )),
                                      ],
                                    ),
                                  )
                              )
                          ),
                        ),
                      ],
                    ),
                  )
              )
          )
      ),
    );
  }
}
