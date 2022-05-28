import 'dart:io';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String? imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Colors.orange;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 3,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath!);

    return ClipOval(
        child: Material(
      color: Colors.transparent,
      child: Ink.image(
        image: image,
        fit: BoxFit.cover,
        width: 128,
        height: 128,

      ),
    ));
  }

  Widget buildEditIcon(Color color) => buildCircle(
      color: Colors.white,
      all: 2,
      child: buildCircle(
        color: color,
        all: 0,
        child: IconButton(
          onPressed: (onClicked),
          icon: Icon(isEdit ? Icons.add_a_photo : Icons.edit),
          color: Colors.white,
          iconSize: 20,
        ),
      ));

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          width: 40,
          height: 40,
          child: child,
        ),
      );
}
