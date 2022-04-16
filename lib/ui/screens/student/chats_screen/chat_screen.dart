import 'package:flutter/material.dart';
import 'package:meet_u/model/entities/chat/group_chat.dart';
import 'package:meet_u/model/entities/chat/message.dart';
import 'package:meet_u/model/entities/student.dart';
import 'package:meet_u/ui/screens/student/chats_screen/Widgets/message_box.dart';

import '../../../../event_controller/event_controller.dart';
import '../../../properties/loading_widget.dart';

class ChatScreen extends StatefulWidget {
  String groupName;
  String groupId;
  Student student;

  ChatScreen({Key? key, required this.student, required this.groupId, required this.groupName}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final EventController _eventController=EventController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.orange),
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                child: StreamBuilder(
                  stream: _eventController.getGroupChat(widget.groupId),
                  builder: (BuildContext context, AsyncSnapshot snapshot){
                    if(!snapshot.hasData){
                      return Container(child: LoadingWidget(),color: Colors.white);
                    }else{

                      return Column(
                        children: [
                          Expanded(
                            flex: 8,
                            child: snapshot.data.docs[0]["messages"]==null?
                                Container()
                                :
                            Container(
                              child: ListView.builder(
                                itemCount: snapshot.data.docs[0]["messages"].length,
                                  itemBuilder: (_, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                      bottom: 10,
                                      top: 10
                                    ),
                                    child: MessageBox(
                                      student: widget.student,
                                      message: Message.fromJson(snapshot.data.docs[0]["messages"][index]),
                                    )
                                  );
                                  }
                              ),
                            )
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 15,
                                  right: 15
                              ),
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: TextFormField(
                                      controller: _messageController,
                                      decoration: const InputDecoration(
                                        hintText: "Mensaje...",
                                      ),
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: ()async{
                                        await _eventController.sendGroupMessage(
                                            _messageController.text,
                                            widget.student,GroupChat.fromJson(snapshot.data.docs[0].data()));
                                        _messageController.clear();
                                      },
                                      child: const Icon(
                                        Icons.send,
                                        color: Colors.orange,
                                        size: 30,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
