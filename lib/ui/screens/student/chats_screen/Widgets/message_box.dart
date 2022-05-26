import 'package:flutter/material.dart';
import 'package:meet_u/model/entities/chat/message.dart';
import 'package:meet_u/model/entities/student.dart';

class MessageBox extends StatelessWidget {
  Message message;
  Student student;
  MessageBox({Key? key, required this.message, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: message.author_id==student.id?Colors.cyan.withOpacity(0.5):Colors.grey.withOpacity(0.5),
      ),
      margin: EdgeInsets.only(
        left: message.author_id==student.id?150:0,
        right: message.author_id==student.id?0:150
      ),
      padding: EdgeInsets.only(
          left: message.author_id==student.id?0:20,
          right: message.author_id==student.id?20:0,
      ),
      child: Align(
        alignment: message.author_id==student.id?Alignment.centerRight:Alignment.centerLeft,
        child: Column(
          children: [

            Align(
                alignment: message.author_id==student.id?Alignment.centerRight:Alignment.centerLeft,
              child: Text(
                message.date.toString(),
                style: const TextStyle(
                  fontSize: 10,
                ),
                textAlign: message.author_id==student.id?TextAlign.right :TextAlign.left,
              ),

            ),

            Align(
              alignment: message.author_id==student.id?Alignment.centerRight:Alignment.centerLeft,
              child: Text(
                message.author_id==student.id?student.name:"Member",
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
                textAlign: message.author_id==student.id?TextAlign.right :TextAlign.left,
              ),
            ),

            Align(
              alignment: message.author_id==student.id?Alignment.centerRight:Alignment.centerLeft,
              child:  Text(
                message.message,
                style: const TextStyle(
                  fontSize: 20,
                ),
                textAlign: message.author_id==student.id?TextAlign.right :TextAlign.left,
              ),
            ),
          ],
        )
      ),
    );
  }
}
