import 'package:flutter/material.dart';

class newGroup extends StatefulWidget {
  const newGroup({Key? key}) : super(key: key);

  @override
  State<newGroup> createState() => _newGroup ();
}

class _newGroup extends State<newGroup> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Nuevo Grupo"),
        backgroundColor : Colors.deepOrange,
      ),
      body: Column(
      children:[
       Expanded(
        flex: 1,
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Digite el nombre del nuevo grupo:",
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      Expanded(
          flex: 13,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name"
            ),
          )
            ),
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Ingrese el enlace de una imagen representativa:",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
        Expanded(
            flex: 13,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "URL"
              ),
            )
        ),
        Expanded(
          flex:1,
          child: Container(
            color: Colors.deepOrange,
            child: ElevatedButton(
              onPressed: (){

              },
              child: const Text(
                "Crear",
                style: TextStyle(
                    fontSize: 20
                )
              )
            )
          ),
        ),
            ]
            )
);

  }
}

