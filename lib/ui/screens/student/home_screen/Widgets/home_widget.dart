import 'package:flutter/material.dart';


class HomeWidget extends StatelessWidget {

  String title;
  VoidCallback onTap;
  IconData icon;
  HomeWidget({Key? key, required this.onTap,
    required this.title, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onTap,
        child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [

                Expanded(
                  flex: 5,
                  child: Stack(
                    children: [
                      const Center(
                        child: Icon(
                          Icons.circle,
                          size: 110,
                          color: Colors.orange,
                        ),
                      ),
                      Center(
                        child: Icon(
                          icon,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Container(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          )
                      ),
                    ),
                  ),
                ),

              ],
            )
        ),
      ),
    );
  }
}


