import 'package:flutter/material.dart';
import 'package:meet_u/model/entities/student.dart';
import 'package:meet_u/ui/screens/student/profile_screen/Widgets/appbar.dart';
import 'package:meet_u/ui/screens/student/profile_screen/Widgets/profile_widget.dart';

import 'Widgets/button_widget.dart';
import 'Widgets/textfield_widget.dart';

class EditProfileScreen extends StatefulWidget {
  Student student;

  EditProfileScreen({Key? key, required this.student}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
              TextFieldWidget(
                label: "Nombre(s)",
                text: widget.student.name,
                onChanged: (firstname) {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: "Apellido(s)",
                text: widget.student.lastName,
                onChanged: (lastname) {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: "Descripción",
                text: widget.student.description.toString() != 'null'
                    ? widget.student.description.toString()
                    : "Ingresar Descripción.",
                maxLines: 5,
                onChanged: (description) {},
              ),
              const SizedBox(height: 24),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildUpgradeButton("Cerrar Cuenta", true),
                  const SizedBox(width: 8),
                  buildUpgradeButton("Guardar", false),
                ],
              ))
            ]),
      );

  Widget buildUpgradeButton(String text, bool end) => ButtonWidget(
        text: text,
        onClicked: () {},
        end: end,
      );
}
