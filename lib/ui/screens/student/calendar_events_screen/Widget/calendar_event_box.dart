import 'package:flutter/material.dart';
import 'package:meet_u/model/entities/event.dart';
import '../../../../../event_controller/event_controller.dart';


class CalendarEventBox extends StatefulWidget {
  Event event;
  CalendarEventBox({Key? key, required this.event}) : super(key: key);

  @override
  State<CalendarEventBox> createState() => _CalendarEventBoxState();
}

class _CalendarEventBoxState extends State<CalendarEventBox> {
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
        child: Padding(
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
                      fontSize: 25,
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
                child:Text(
                  widget.event.description,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
