import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meet_u/model/entities/student.dart';
import 'package:meet_u/ui/screens/student/profile_screen/Widgets/appbar.dart';
import 'package:meet_u/ui/screens/student/profile_screen/Widgets/profile_widget.dart';

import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  Student student;

  ProfileScreen({Key? key, required this.student}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: buildAppBar(context),
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 15),
                ProfileWidget(
                  imagePath: widget.student.imagePath ??
                      "https://images.unsplash.com/photo-1606062663931-277af9e93298?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070",
                  onClicked: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => EditProfileScreen(student: widget.student)),
                    );
                  },
                ),
                const SizedBox(height: 24),
                buildName(widget.student),
                const SizedBox(height: 40),
                Row(children: const <Widget>[
                  Expanded(
                      child: Divider(
                        height: 10,
                      )),
                ]),
                buildAbout(widget.student),
              ],
            )));
  }

  Widget buildName(Student student) =>
      Column(
        children: [
          Text(
            widget.student.name + " " + widget.student.lastName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(widget.student.email.toString(),
              style: const TextStyle(color: Colors.grey))
        ],
      );

  Widget buildAbout(Student student) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Descripción",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 16,
          ),
          Text("  " +
              (widget.student.description.toString() != 'null'
                  ? widget.student.description.toString()
                  : "Este usuario aun no ha ingresado una descripción."))
        ],
      );
}
