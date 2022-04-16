import 'package:flutter/material.dart';
import 'package:meet_u/event_controller/event_controller.dart';
import 'package:meet_u/ui/properties/own_icons_icons.dart';
import 'package:meet_u/ui/screens/admin/add_group_screen/add_group_screen.dart';
import '../../../../model/entities/admin.dart';
import '../../student/home_screen/Widgets/home_widget.dart';



class AdminHomeScreen extends StatefulWidget {
  Admin admin;
  AdminHomeScreen({Key? key, required this.admin}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {

  final EventController _eventController=EventController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async=>false,
      child: SafeArea(
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
                flex: 1,
                child: Container(color: Colors.white,),
              ),
              Expanded(
                flex: 6,
                child: Container(
                    color: Colors.white,
                    child: Align(
                      alignment: Alignment.center,
                      child: GridView(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,childAspectRatio: 1.5,),

                        children: [

                          HomeWidget(onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  AddGroupScreen(admin: widget.admin,)));
                          }, title: "Agregar grupo", icon: Icons.add),

                          HomeWidget(onTap: (){

                          }, title: "Eliminar grupo", icon: Icons.remove),

                          HomeWidget(onTap: (){
                          }, title: "Ver mensajes soporte", icon: OwnIcons.help),

                          HomeWidget(onTap: (){
                            _eventController.signOut();
                          }, title: "Cerrar sesión", icon: OwnIcons.cancel),

                        ],
                      ),
                    )
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(color: Colors.white,),
              )
            ],
          ),
        ),
      ),
    );
  }
}