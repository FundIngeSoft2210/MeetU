import 'package:flutter/material.dart';
import 'package:meet_u/event_controller/event_controller.dart';
import 'package:meet_u/model/entities/event.dart';
import 'package:meet_u/model/entities/student.dart';
import '../../../properties/loading_widget.dart';
import 'Widget/calendar_event_box.dart';

class CalendarEventsScreen extends StatefulWidget {
  Student student;
  CalendarEventsScreen({Key? key, required this.student}) : super(key: key);


  @override
  State<CalendarEventsScreen> createState() => _CalendarEventsScreenState();
}

class _CalendarEventsScreenState extends State<CalendarEventsScreen> {

  final EventController _eventController=EventController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              flex: 8,
              child: StreamBuilder(
                stream: _eventController.getStudentEvents(widget.student.id!),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(!snapshot.hasData){
                    return Container(child: LoadingWidget(),color: Colors.white);
                  }else{
                    return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (_, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              top: 20,
                              bottom: 20
                            ),
                            child: CalendarEventBox(event: Event.fromJson(snapshot.data.docs[index].data()))
                          );
                        }
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
