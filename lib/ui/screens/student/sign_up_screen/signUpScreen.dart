import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meet_u/model/entities/career_type.dart';
import 'package:meet_u/model/entities/gender.dart';
import '../../../../event_controller/event_controller.dart';
import '../../../properties/loading_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  List<String> semesters = ['1er Semestre', '2do Semestre', '3er Semestre', '4to Semestre', '5to Semestre', '6to Semestre', '7mo Semestre', '8vo Semestre', '9no Semestre', '10mo Semestre'];
  String? selectedSemester = '1er Semestre';
  final TextEditingController _semesterController = TextEditingController();
  final EventController _eventController = EventController();
  CareerType careerType = CareerType.ingenieria_de_sistemas;
  bool loading = false;
  Gender gender = Gender.femenino;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        Scaffold(
            body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 1.2),
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
                                    "Ingrese sus credenciales:",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Expanded(flex: 1, child: Container()),
                              Expanded(
                                flex: 2,
                                child: TextFormField(
                                  controller: _nameController,
                                  decoration: const InputDecoration(
                                    hintText: "Nombre",
                                    prefixIcon:
                                        Icon(Icons.person, color: Colors.black),
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? 'Ingrese un nombre válido'
                                          : null,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: TextFormField(
                                  controller: _lastNameController,
                                  decoration: const InputDecoration(
                                    hintText: "Apellido",
                                    prefixIcon:
                                        Icon(Icons.person, color: Colors.black),
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? 'Ingrese un apellido válido'
                                          : null,
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                        padding: const EdgeInsets.all(7),
                                        child: DropdownButton<Gender>(
                                            value: gender,
                                            onChanged: (g) {
                                              setState(() {
                                                gender = g!;
                                              });
                                            },
                                            items: Gender.values
                                                .map((Gender classType) {
                                              return DropdownMenuItem<Gender>(
                                                  value: classType,
                                                  child: Text(
                                                    classType.name.toString(),
                                                  ));
                                            }).toList())),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                        padding: const EdgeInsets.all(7),
                                        child: DropdownButton<CareerType>(
                                            value: careerType,
                                            onChanged: (c) {
                                              setState(() {
                                                careerType = c!;
                                              });
                                            },
                                            items: CareerType.values
                                                .map((CareerType classType) {
                                              return DropdownMenuItem<
                                                      CareerType>(
                                                  value: classType,
                                                  child: Text(
                                                    classType.name.toString(),
                                                  ));
                                            }).toList())),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                          padding: const EdgeInsets.all(7),
                                          child: DropdownButton<String>(
                                            value: selectedSemester,
                                            items: semesters
                                                .map((item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Text(item),
                                                    ))
                                                .toList(),
                                            onChanged: (item) => setState(
                                                () => selectedSemester = item),
                                          )))),
                              Expanded(
                                flex: 2,
                                child: TextFormField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    hintText: "Correo Electrónico",
                                    prefixIcon:
                                        Icon(Icons.mail, color: Colors.black),
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (email) => (email != null &&
                                              !EmailValidator.validate(
                                                  email)) ||
                                          (email != null &&
                                              !email
                                                  .endsWith('javeriana.edu.co'))
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
                                    prefixIcon:
                                        Icon(Icons.lock, color: Colors.black),
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) =>
                                      value != null && value.length < 6
                                          ? 'Ingrese mínimo 6 caracteres'
                                          : null,
                                ),
                              ),
                              Expanded(flex: 1, child: Container()),
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: const Align(
                                        alignment: Alignment.center,
                                        child: Text("Crear Cuenta",
                                            style: TextStyle(fontSize: 20)),
                                      )),
                                  onTap: () async {
                                    setState(() {
                                      loading = true;
                                    });
                                    await _eventController.studentSignUp(
                                        _emailController.text,
                                        _passwordController.text,
                                        _nameController.text,
                                        _lastNameController.text,
                                        careerType,
                                        selectedSemester!,
                                        gender,
                                        context);
                                    setState(() {
                                      loading = false;
                                    });
                                  },
                                ),
                              ),
                              Expanded(flex: 1, child: Container()),
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
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10))),
                                          child: const Align(
                                            alignment: Alignment.center,
                                            child: Text("Iniciar Sesión",
                                                style: TextStyle(fontSize: 20)),
                                          )),
                                      onTap: () {
                                        Navigator.pop(context);
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
          ),
        )),
        Positioned(
          child: loading ? LoadingWidget() : Container(),
        ),
      ],
    ));
  }
}
