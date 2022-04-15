import 'package:flutter/material.dart';



class GroupScreen extends StatefulWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex:1,
                child: Text(
              "Grupos a los que pertenezco:",
                  style: TextStyle(
            color:Colors.black,
          fontSize:20
        )
            )
            ),
            Expanded(
                flex:1,
                child: Text(
                "Grupos que te pueden interesar:",
                style: TextStyle(
                    color:Colors.black,
                    fontSize:20
                )
            )
            ),
             ],
        )
      )
    );

  }
}

