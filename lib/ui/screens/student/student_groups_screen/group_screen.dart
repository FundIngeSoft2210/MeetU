import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:meet_u/model/entities/student.dart';
import 'package:meet_u/ui/screens/student/student_groups_screen/Widgets/event_box.dart';
import 'package:meet_u/ui/screens/student/student_groups_screen/Widgets/member_widgets.dart';
import 'package:meet_u/ui/screens/student/student_groups_screen/Widgets/post_box.dart';

import '../../../../event_controller/event_controller.dart';
import '../../../../model/entities/event.dart';
import '../../../../model/entities/post.dart';
import '../../../properties/loading_widget.dart';

class GroupScreen extends StatefulWidget {
  String groupId;
  Student student;

  GroupScreen({Key? key, required this.groupId, required this.student}) : super(key: key);
  @override
  State<GroupScreen> createState() => _GroupScreenState();
}


class _GroupScreenState extends State<GroupScreen> {

  bool addPost=false;
  bool addEvent=false;
  int currentOption=0;

  DateTime? eventDate;
  final TextEditingController _descriptionController = TextEditingController();
  final EventController _eventController=EventController();
  final TextEditingController _placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.orange),
          elevation: 0,
        ),
        body: StreamBuilder(
          stream: _eventController.getGroupStream(widget.groupId),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(!snapshot.hasData){
              return LoadingWidget();
            }else{
              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(snapshot.data["imageUrl"]),
                                      fit: BoxFit.fill
                                  )
                              ),
                            ),

                            Container(
                              color: Colors.black.withOpacity(0.3),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  snapshot.data["name"],
                                  style: const TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),


                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        currentOption=0;
                                      });
                                    },
                                    child: Container(
                                        margin: EdgeInsets.all(10),
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: Center(
                                          child: Text(
                                            "Posts",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.orange,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        )
                                    )
                                )
                            ),
                            Expanded(
                                flex: 2,
                                child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        currentOption=1;
                                      });
                                    },
                                    child: Container(
                                        margin: EdgeInsets.all(10),
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: Center(
                                          child: Text(
                                            "Eventos",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.orange,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        )
                                    )
                                )
                            ),

                            Expanded(
                                flex: 2,
                                child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        currentOption=3;
                                      });
                                    },
                                    child: Container(
                                        margin: EdgeInsets.all(10),
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: Center(
                                          child: Text(
                                            "Miembros",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.orange,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        )
                                    )
                                )
                            )

                          ],
                        ),

                      ),

                      Expanded(
                          flex: 6,
                          child: currentOption==0?
                          StreamBuilder(
                            stream: _eventController.getGroupPosts(widget.groupId),
                            builder: (BuildContext context, AsyncSnapshot snapshot){
                              if(!snapshot.hasData){
                                return LoadingWidget();
                              }else{
                                return Container(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: ListView.builder(
                                          itemCount: snapshot.data.docs.length,
                                          itemBuilder: (_, int index) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  top: 15,
                                                  left: 30,
                                                  right: 30,
                                                  bottom: 15
                                              ),
                                              child: PostBox(post: Post.fromJson(snapshot.data.docs[index].data())),
                                            );
                                          },
                                        ),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: !addPost?
                                          InkWell(
                                              onTap: (){
                                                setState(() {
                                                  addPost=true;
                                                });
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
                                                      "Añadir post",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                  )
                                              )
                                          )
                                              :
                                          Container()
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          )
                              :

                              currentOption==1?
                              StreamBuilder(
                                stream: _eventController.getGroupEvents(widget.groupId),
                                builder: (BuildContext context, AsyncSnapshot snapshot){
                                  if(!snapshot.hasData){
                                    return LoadingWidget();
                                  }else{
                                    return Column(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child:
                                          ListView.builder(
                                            itemCount: snapshot.data.docs.length,
                                            itemBuilder: (_, int index) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    top: 15,
                                                    left: 30,
                                                    right: 30,
                                                    bottom: 15
                                                ),
                                                child: EventBox(event: Event.fromJson(snapshot.data.docs[index].data())),
                                              );
                                            },
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: !addPost?
                                            InkWell(
                                                onTap: (){
                                                  setState(() {
                                                    addEvent=true;
                                                    addPost=false;
                                                  });
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
                                                        "Añadir evento",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                    )
                                                )
                                            )
                                                :
                                            Container()
                                        ),
                                      ],
                                    );
                                  }
                                },
                              )

                                  :

                              StreamBuilder(
                                stream: _eventController.getGroupMembers(widget.groupId),
                                builder: (BuildContext context, AsyncSnapshot snapshot){
                                  if(!snapshot.hasData){
                                    return LoadingWidget();
                                  }else{
                                    return Column(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child:
                                          ListView.builder(
                                            itemCount: snapshot.data.docs.length,
                                            itemBuilder: (_, int index) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    top: 15,
                                                    left: 30,
                                                    right: 30,
                                                    bottom: 15
                                                ),
                                                child: MemeberWidget(memberId: snapshot.data.docs[index]["student_id"])
                                          );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                },
                              )
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container()
                      ),

                      Expanded(
                        flex: 4,
                        child: !addPost?
                           !addEvent?
                               Container()
                           :
                           Container(
                             margin: EdgeInsets.only(
                                 left: 15,
                                 right: 15
                             ),
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
                                 borderRadius: BorderRadius.all(Radius.circular(10))
                             ),
                             child: Column(
                               children: [
                                 Expanded(
                                   flex: 2,
                                   child: TextFormField(
                                     controller: _descriptionController,
                                     decoration: const InputDecoration(
                                       hintText: "Descripción",
                                     ),
                                     autovalidateMode: AutovalidateMode.onUserInteraction,
                                   ),
                                 ),

                                 Expanded(
                                   flex: 2,
                                   child: TextFormField(
                                     controller: _placeController,
                                     decoration: const InputDecoration(
                                       hintText: "Lugar",
                                     ),
                                     autovalidateMode: AutovalidateMode.onUserInteraction,
                                   ),
                                 ),


                                 Expanded(
                                   flex: 2,
                                   child: Row(
                                     children: [
                                       Expanded(
                                         flex: 1,
                                         child: TextButton(
                                             onPressed: () {
                                               DatePicker.showDatePicker(context,
                                                   showTitleActions: true,
                                                   minTime: DateTime.now(),
                                                   maxTime: DateTime(2023, 12, 31),
                                                   onConfirm: (date) {
                                                     setState(() {
                                                       eventDate=date;
                                                     });
                                                   }, currentTime: DateTime.now(), locale: LocaleType.es);
                                             },
                                             child: Text(
                                               'Fecha',
                                               style: TextStyle(color: Colors.blue),
                                             )
                                         ),
                                       ),
                                       Expanded(
                                         flex: 1,
                                         child: Text(
                                           eventDate==null?
                                          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"
                                            :
                                            "${eventDate!.day}/${eventDate!.month}/${eventDate!.year}",
                                           style: TextStyle(
                                               fontSize: 18,
                                               color: Colors.black,
                                               fontWeight: FontWeight.bold
                                           ),
                                         ),
                                       )
                                     ],
                                   )
                                 ),

                                 Expanded(
                                     flex: 2,
                                     child: Row(
                                       children: [
                                         Expanded(
                                             flex: 1,
                                             child: InkWell(
                                                 onTap: ()async {
                                                   await _eventController.addEvent(widget.groupId,
                                                       _descriptionController.text,
                                                       _placeController.text, eventDate!, widget.student);
                                                   setState(() {
                                                     addPost=false;
                                                     addEvent=false;
                                                     _descriptionController.clear();
                                                     _placeController.clear();
                                                   });
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
                                                         "Añadir evento",
                                                         style: TextStyle(
                                                             fontSize: 18,
                                                             color: Colors.white,
                                                             fontWeight: FontWeight.bold
                                                         ),
                                                       ),
                                                     )
                                                 )
                                             )
                                         ),
                                         Expanded(
                                             flex: 1,
                                             child: InkWell(
                                                 onTap: (){
                                                   setState(() {
                                                     addPost=false;
                                                     addEvent=false;
                                                     _descriptionController.clear();
                                                     _placeController.clear();
                                                   });
                                                 },
                                                 child: Container(
                                                     margin: EdgeInsets.all(10),
                                                     width: double.infinity,
                                                     height: double.infinity,
                                                     decoration: const BoxDecoration(
                                                         color: Colors.red,
                                                         borderRadius: BorderRadius.all(Radius.circular(20))
                                                     ),
                                                     child: Center(
                                                       child: Text(
                                                         "Cancelar",
                                                         style: TextStyle(
                                                             fontSize: 18,
                                                             color: Colors.white,
                                                             fontWeight: FontWeight.bold
                                                         ),
                                                       ),
                                                     )
                                                 )
                                             )
                                         ),
                                       ],
                                     )
                                 ),


                               ],
                             ),
                           )
                            :
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                            right: 15
                          ),
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
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: TextFormField(
                                  controller: _descriptionController,
                                  decoration: const InputDecoration(
                                    hintText: "Qué estás pensando...?",
                                  ),
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: InkWell(
                                            onTap: ()async {
                                              await _eventController.add_Post(widget.student, widget.groupId, _descriptionController.text, null, null);
                                              setState(() {
                                                addPost=false;
                                                addEvent=false;
                                                _descriptionController.clear();
                                                _placeController.clear();

                                              });
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
                                                    "Añadir post",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                )
                                            )
                                        )
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: InkWell(
                                            onTap: (){
                                              setState(() {
                                                addPost=false;
                                                addEvent=false;
                                                _descriptionController.clear();
                                                _placeController.clear();
                                              });
                                            },
                                            child: Container(
                                                margin: EdgeInsets.all(10),
                                                width: double.infinity,
                                                height: double.infinity,
                                                decoration: const BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Cancelar",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                )
                                            )
                                        )
                                    ),
                                  ],
                                )
                              ),


                            ],
                          ),
                        ),
                      ),


                      Expanded(
                          flex: 5,
                          child: Container()
                      ),

                    ],
                  ),

                ],
              );
            }
          },
        )
      ),
    );
  }
}

