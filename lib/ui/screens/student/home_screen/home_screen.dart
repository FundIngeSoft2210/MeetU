import 'package:flutter/material.dart';
import 'package:meet_u/event_controller/event_controller.dart';
import 'package:meet_u/model/entities/student.dart';
import 'package:meet_u/ui/properties/own_icons_icons.dart';
import 'package:meet_u/ui/screens/student/chats_screen/chats_screen.dart';
import 'package:meet_u/ui/screens/student/group_screen/groups_screen.dart';
import 'package:meet_u/ui/screens/student/help_screen/help_screen.dart';
import 'package:meet_u/ui/screens/student/profile_screen/profile_screen.dart';
import '../../../../model/entities/admin.dart';
import '../calendar_events_screen/calendar_events_screen.dart';
import '../student_groups_screen/student_groups_screen.dart';
import 'Widgets/home_widget.dart';


class HomeScreen extends StatefulWidget {
  Student student;
  HomeScreen({Key? key, required this.student}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
                flex: 7,
                child: Container(
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.center,
                    child: GridView(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,childAspectRatio: 1.6, mainAxisSpacing: 10,),
                      children: [
                        HomeWidget(onTap: ()async{
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen(student: widget.student)));
                        }, title: "Perfil", icon: OwnIcons.child,),

                        HomeWidget(onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => StudentGroupsScreen(student: widget.student)));
                        }, title: "Mis grupos", icon: OwnIcons.users),

                        HomeWidget(onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => GroupsScreen(student: widget.student)));
                        }, title: "Grupos", icon: OwnIcons.users),

                        HomeWidget(onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatsScreen(student: widget.student)));
                        }, title: "Chats", icon: OwnIcons.chat_empty),

                        HomeWidget(onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CalendarEventsScreen(student: widget.student)));
                        }, title: "Calendario", icon: OwnIcons.calendar),

                        HomeWidget(onTap: (){
                          _eventController.signOut();
                        }, title: "Cerrar sesión", icon: OwnIcons.cancel),

                        HomeWidget(onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HelpScreen(student: widget.student)));
                        }, title: "Ayuda", icon: OwnIcons.help),


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
