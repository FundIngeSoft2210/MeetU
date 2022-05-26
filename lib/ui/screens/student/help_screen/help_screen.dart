import 'package:flutter/material.dart';
import 'package:meet_u/model/entities/student.dart';

import '../../../../utils/utils.dart';


class HelpScreen extends StatefulWidget {
  Student student;
  HelpScreen({Key? key, required this.student}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {

  final TextEditingController controller= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
              flex: 2,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Align(
                  child: Text("¿En qué te podemos ayudar?, Sugerir tema, problemas técnicos, otros",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.orangeAccent
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Container(
                child: Align(
                  child: TextFormField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Sugerencias...",
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
                flex: 1,
                child: InkWell(
                    onTap: (){
                      Utils.showSnackBar("Gracias por tu sugerencia!",Colors.green);
                    },
                    child: Container(
                        margin: EdgeInsets.all(30),
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Center(
                          child: Text(
                            "Enviar!",
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
              flex: 2,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
