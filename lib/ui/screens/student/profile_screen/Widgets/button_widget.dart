import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final bool end;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
    required this.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: const StadiumBorder(),
      primary: end ?  Colors.red: Colors.orange,
      onPrimary: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal:  32, vertical: 12,),

    ),
      onPressed: onClicked,
      child: Text(text));
}
