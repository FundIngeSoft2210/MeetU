import 'package:flutter/material.dart';
import 'package:meet_u/event_controller/admin_event_controller.dart';
import '../../../../model/entities/admin.dart';


class AddGroupScreen extends StatefulWidget {
  Admin admin;
  AddGroupScreen({Key? key, required this.admin}) : super(key: key);

  @override
  State<AddGroupScreen> createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends State<AddGroupScreen> {


  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final AdminEventController _adminEventController=AdminEventController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.orange),
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Agregar grupo",
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                )
              ),
            ),

            Expanded(
              flex: 1,
              child: TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: "Nombre",
                  prefixIcon: Icon(Icons.add, color: Colors.black),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                value == null || value.isEmpty
                    ? 'Ingrese un nombre válido'
                    : null,
              ),
            ),
            Expanded(
              flex: 1,
              child: TextFormField(
                controller: _imageUrlController,
                decoration: const InputDecoration(
                  hintText: "Url imagen",
                  prefixIcon: Icon(Icons.add, color: Colors.black),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                value == null || value.isEmpty
                    ? 'Ingrese una url válida'
                    : null,
              ),
            ),


            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 50,
                    right: 50,
                    top: 30,
                    bottom:30
                ),
                child: InkWell(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          border: Border.all(color: Colors.black),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(10))),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text("Agregar grupo",
                            style: TextStyle(fontSize: 20)),
                      )),
                  onTap: ()async{
                    await _adminEventController.addGroup(widget.admin, _nameController.text, _imageUrlController.text);
                  }
                ),
              )
            ),




            Expanded(
              flex: 6,
              child: Container(),
            )

          ],
        ),
      ),
    );
  }
}
