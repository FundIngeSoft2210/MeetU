import 'package:flutter/material.dart';
import 'package:meet_u/model/entities/event.dart';
import 'package:meet_u/ui/properties/own_icons_icons.dart';
import '../../../../../event_controller/event_controller.dart';
import '../../../../properties/loading_widget.dart';

class EventBox extends StatefulWidget {
  Event event;
  EventBox({Key? key, required this.event}) : super(key: key);

  @override
  State<EventBox> createState() => _EventBoxState();
}

class _EventBoxState extends State<EventBox> {
  final EventController _eventController=EventController();

  @override
  Widget build(BuildContext context) {
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
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: FutureBuilder(
          future: _eventController.currentUser(widget.event.author_id).elementAt(0),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(!snapshot.hasData){
              return LoadingWidget();
            }else{
              return Padding(
                padding: const EdgeInsets.only(
                    left: 10,
                    right: 10
                ),
                child: Column(
                  children: [

                    Align(
                      alignment: Alignment.centerLeft,
                      child:Text(
                        "${widget.event.date.day}/${widget.event.date.month}/${widget.event.date.year}",
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),

                    const Divider(
                      height: 10,
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        snapshot.data["name"],
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child:Text(
                        widget.event.description,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    const Divider(
                      height: 10,
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        children:  const [

                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              OwnIcons.grin_hearts,
                              size: 30,
                              color: Colors.green,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              OwnIcons.surprise,
                              size: 30,
                              color: Colors.orangeAccent,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              OwnIcons.angry,
                              size: 30,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
          },
        )
    );
  }
}
