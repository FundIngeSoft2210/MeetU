import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meet_u/event_controller/event_controller.dart';
import 'package:meet_u/model/entities/student.dart';
import 'package:meet_u/ui/screens/student/chats_screen/chat_screen.dart';

import '../../../properties/loading_widget.dart';
import 'group_screen.dart';

class StudentGroupsScreen extends StatefulWidget {
  Student student;
  StudentGroupsScreen({Key? key, required this.student}) : super(key: key);

  @override
  State<StudentGroupsScreen> createState() => _StudentGroupsScreenState();
}

class _StudentGroupsScreenState extends State<StudentGroupsScreen> {

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
              child: Container(
                child: StreamBuilder(
                  stream: _eventController.getStudentGroups(widget.student.id!),
                  builder: (BuildContext context, AsyncSnapshot snapshot){
                    if(!snapshot.hasData){
                      return Container(child: LoadingWidget(),color: Colors.white);
                    }else{
                      return ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (_, int index) {
                            return  Container(
                              width: double.infinity,
                              height: 100,
                              padding: const EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                  top: 15
                              ),
                              child: Container(
                                  color: Colors.orange,
                                  child: FutureBuilder(
                                    future: _eventController.getGroup(snapshot.data.docs[index]["group_id"]),
                                    builder: (BuildContext context, AsyncSnapshot groupSnapshot){
                                      if(!groupSnapshot.hasData){
                                        return LoadingWidget();
                                      }else{
                                        return InkWell(
                                          onTap: (){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => GroupScreen(
                                                student: widget.student,
                                                groupId: snapshot.data.docs[index]["group_id"])));
                                          },
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 2,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 15,
                                                        right: 15
                                                    ),
                                                    child:Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: CachedNetworkImageProvider(groupSnapshot.data["imageUrl"].toString())
                                                          )
                                                      ),
                                                    ),
                                                  )
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                  child: Text(
                                                    groupSnapshot.data["name"],
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  child: Icon(
                                                    Icons.arrow_right,
                                                    size: 40,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                  )
                              ),
                            );
                          }
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
