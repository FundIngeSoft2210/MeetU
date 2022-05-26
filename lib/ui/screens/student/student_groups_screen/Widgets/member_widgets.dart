import 'package:flutter/material.dart';

import '../../../../../event_controller/event_controller.dart';
import '../../../../../model/entities/student.dart';

class MemeberWidget extends StatelessWidget {
  String memberId;
  MemeberWidget({Key? key,required this.memberId}) : super(key: key);

  final EventController _eventController=EventController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: StreamBuilder(
        stream: _eventController.currentUser(memberId),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(!snapshot.hasData || snapshot.hasError){
            return const CircularProgressIndicator(color: Colors.orange,);
          }else{
            Student currentStudent=Student.fromJson(snapshot.data!.data());
            return Container(
              decoration:  BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.all(const Radius.circular(10))
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child:  Align(
                      alignment: Alignment.centerLeft,
                      child:Text(
                        "${currentStudent.name} ${currentStudent.lastName}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child:  Align(
                      alignment: Alignment.centerLeft,
                      child:Text(
                        "${currentStudent.career!.careerType.toString()} , ${currentStudent.career!.semester}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }
      ),
    );
  }
}
