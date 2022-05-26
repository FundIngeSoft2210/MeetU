import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_u/model/entities/student.dart';
import 'package:meet_u/ui/screens/student/profile_screen/Widgets/appbar.dart';
import 'package:meet_u/ui/screens/student/profile_screen/Widgets/profile_widget.dart';
import 'package:meet_u/ui/screens/student/profile_screen/profile_screen.dart';
import 'package:meet_u/ui/screens/user/LoginScreen/loginScreen.dart';

import '../../../../event_controller/event_controller.dart';
import 'Widgets/button_widget.dart';
import 'Widgets/textfield_widget.dart';

class EditProfileScreen extends StatefulWidget {
  Student student;

  EditProfileScreen({Key? key, required this.student}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final EventController _eventController = EventController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 15),
              ProfileWidget(
                  imagePath: widget.student.imagePath ??
                      "https://images.unsplash.com/photo-1606062663931-277af9e93298?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070",
                  isEdit: true,
                  onClicked: () async {}),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Nombre(s)",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: widget.student.name,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Apellido(s)",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      hintText: widget.student.lastName,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Descripción",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      hintText: widget.student.description.toString() != 'null'
                          ? widget.student.description.toString()
                          : "Ingresar Descripción.",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildUpgradeButton("Borrar Cuenta", true),
                  const SizedBox(width: 8),
                  buildUpgradeButton("Guardar", false),
                ],
              ))
            ]),
      );

  Widget buildUpgradeButton(String text, bool end) => ButtonWidget(
        text: text,
        onClicked: () async {
          end
              ? {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title:
                                Text("¿Está segura(o) de eliminar su cuenta?"),
                            actions: [
                              TextButton(
                                  onPressed: () => {
                                        _eventController.deleteFromAuth(),
                                        _eventController.signOut(),
                                        _eventController
                                            .deleteUser(widget.student.id!),
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginScreen()))
                                      },
                                  child: Text("Sí")),
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("No"))
                            ],
                          )),
                }
              : {
                  widget.student.name = _nameController.text == ""
                      ? widget.student.name
                      : _nameController.text,
                  widget.student.lastName = _lastNameController.text == ""
                      ? widget.student.lastName
                      : _lastNameController.text,
                  widget.student.description = _descriptionController.text == ""
                      ? widget.student.description
                      : _descriptionController.text,
                  _eventController.updateStudent(widget.student),
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ProfileScreen(student: widget.student)))
                };
        },
        end: end,
      );
}
