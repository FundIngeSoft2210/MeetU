import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meet_u/ui/pages/ProfileScreen/profileScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No existe un usuario con ese email");
      }
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

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
                          child: TextField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              hintText: "Correo Electrónico",
                              prefixIcon: Icon(Icons.mail, color: Colors.black),
                            ),
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
                                              Navigator.of(context).pushReplacement(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ProfileScreen()));
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
                            onTap: () async {
                              User? user = await loginUsingEmailPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  context: context);
                              if (user != null) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => ProfileScreen()));
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
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ProfileScreen()));
                              },
                            ),
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

/*

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //Funcion Login
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No existe un usuario con ese email");
      }
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {

    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "MeetÜ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Log in",
            style: TextStyle(
              color: Colors.black,
              fontSize: 44.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 44.0,
          ),
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Correo",
              prefixIcon: Icon(Icons.mail, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 26.0,
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "Contraseña",
              prefixIcon: Icon(Icons.lock, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Text(
            "¿Olvidaste tu contraseña?",
            style: TextStyle(color: Colors.blue),
          ),
          const SizedBox(
            height: 88.0,
          ),
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: const Color(0xFF0069FE),
              elevation: 0.0,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              onPressed: () async {
                User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                print(user);
                if(user != null){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ProfileScreen()));
                }
              },
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
