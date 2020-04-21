import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Anim/splash.dart';
import 'package:google_fonts/google_fonts.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var login = prefs.getBool('login');
  runApp(MyApp(login: login));
}

class MyApp extends StatefulWidget {
  final bool login;
  MyApp({@required this.login});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      ),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.black,
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: Id(login: widget.login),
      ),
    );
  }
}

