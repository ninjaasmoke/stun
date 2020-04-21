import 'package:flutter/material.dart';
import 'package:istriwaala2/Anim/showup.dart';
class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  final controller = PageController(
  );
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff155545), Color(0xff051515)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
      ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: PageView(
            controller: controller,
            children: <Widget>[
              Page1(),
              Page2(),
            ],
          ),
        ),
    ]
    );
  }
}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ShowUp(
            delay: 500,
            child: Text(
              "Istriwaala is designed to be used, both by the customer and the Istriwaala.\n\n",
              style: TextStyle(color: Color(0xff629292),
              fontSize: 30),
            ),
          ),
          ShowUp(
            delay: 800,
            child: Text(
              "Here you can choose to either be a customer or an Istriwaala.",
              style: TextStyle(color: Color(0xff629292),
                  fontSize: 30),
            ),
          ),
          SizedBox(
            height: 200,
          ),
          Text(
            "Swipe\n",
            style: TextStyle(color: Color(0xff124242),
            fontSize: 25),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.arrow_back_ios,
                color: Color(0xff125252),
                size: 30,
              ),
              Icon(
                Icons.arrow_back_ios,
                color: Color(0xff125252),
                size: 30,
              ),
              Icon(
                Icons.arrow_back_ios,
                color: Color(0xff125252),
                size: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}


class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10),
        child: ShowUp(
          delay: 500,
          child: Text(
            "Here you can choose to either be a customer or an Istriwaala.",
            style: TextStyle(color: Color(0xff629292),
                fontSize: 30),
          ),
        ),
      ),
    );
  }
}

