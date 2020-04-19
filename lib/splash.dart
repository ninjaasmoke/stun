import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'mainscreen.dart';

class Id extends StatefulWidget {
  final bool login;
  Id({@required this.login});
  @override
  _IdState createState() => _IdState(login);
}

class _IdState extends State<Id> {
  _IdState(login);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      image: Image.asset("Assets/istri1.jpg",),
      backgroundColor: Colors.black,
      loaderColor: Colors.grey[400].withOpacity(0.2),
      photoSize: 150.0,
      navigateAfterSeconds:  widget.login != null && widget.login != false? MainScreen(): LoginPage(),
    );
  }
}
