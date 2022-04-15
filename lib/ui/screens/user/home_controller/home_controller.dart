import 'package:flutter/material.dart';
import 'package:meet_u/event_controller/event_controller.dart';
import 'package:meet_u/model/entities/student.dart';
import 'package:meet_u/ui/screens/student/home_screen/home_screen.dart';



class HomeController extends StatefulWidget {
  String userId;
  HomeController({Key? key, required this.userId}) : super(key: key);

  @override
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {

  final EventController _eventController=EventController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async=>false,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: StreamBuilder(
              stream:_eventController.currentUser(widget.userId),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(!snapshot.hasData || snapshot.hasError){
                  return const CircularProgressIndicator(color: Colors.orange,);
                }
                else{
                  if(snapshot.data!["isAdmin"]){
                    return Container(color: Colors.red,);
                  }
                  return HomeScreen(student: Student.fromJson(snapshot.data!.data()));
                }
              },
            )
        ),
      ),
    );
  }


}