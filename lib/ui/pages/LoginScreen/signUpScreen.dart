import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_u/ui/pages/LoginScreen/loginScreen.dart';
import 'package:meet_u/ui/pages/LoginScreen/verifyEmailScreen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meet_u/utils/utils.dart';

import '../../../external_services/database.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _passwordController2 = TextEditingController();

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
                              "Ingrese sus credenciales:",
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
                                ? 'Ingrese un email válido'
                                : null,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: "Contraseña",
                              prefixIcon: Icon(Icons.lock, color: Colors.black),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                value != null && value.length < 6
                                    ? 'Ingrese mínimo 6 caracteres'
                                    : null,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: _passwordController2,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: "Confirmar Contraseña",
                              prefixIcon: Icon(Icons.lock, color: Colors.black),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) => value != null &&
                                    value != _passwordController.text.trim()
                                ? 'La contraseña no es la misma'
                                : null,
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
                                    color: Colors.orange,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text("Crear Cuenta",
                                      style: TextStyle(fontSize: 20)),
                                )),
                            onTap: () async {
                              try {
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: _emailController.text.trim(),
                                        password:
                                            _passwordController.text.trim());
                              } on FirebaseAuthException catch (e) {
                                Utils.showSnackBar(e.message);
                              }
                              User? user = await Database.loginUsingEmailPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  context: context);
                              if (user != null) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const VerifyEmailScreen()));
                              }
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
                              "¿Ya tienes una cuenta?",
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
                                      child: Text("Iniciar Sesión",
                                          style: TextStyle(fontSize: 20)),
                                    )),
                                onTap: () async {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
                                }),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                width: 1.5,
                              )),
                        ],
                      ),
                    ))),
          )
        ],
      ),
    ));
  }
}
