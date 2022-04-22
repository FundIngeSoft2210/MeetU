import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meet_u/event_controller/event_controller.dart';
import 'package:meet_u/model/entities/student.dart';
import '../../../properties/loading_widget.dart';

class GroupsScreen extends StatefulWidget {
  Student student;
  GroupsScreen({Key? key, required this.student}) : super(key: key);

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {

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
                  stream: _eventController.getAllGroups(),
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
                              child: InkWell(
                                onTap: (){

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
                                                    image: CachedNetworkImageProvider(snapshot.data.docs[index]["imageUrl"])
                                                )
                                            ),
                                          ),
                                        )
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Text(
                                          snapshot.data.docs[index]["name"],
                                          style: const TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: InkWell(
                                        onTap: ()async{
                                          await _eventController.joinGroup(snapshot.data.docs[index]["id"], widget.student);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: const BoxDecoration(
                                              color: Colors.greenAccent,
                                            borderRadius: BorderRadius.all(Radius.circular(20))
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Unirme",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          )
                                        )
                                      )
                                    )
                                  ],
                                ),
                              )
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
