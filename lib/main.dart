import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splash.dart';
import 'package:google_fonts/google_fonts.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var userEmail = prefs.getString('userEmail');
  var userName = prefs.getString('userName');
  var userPhoto = prefs.getString('userPhoto');
  var login = prefs.getBool('login');
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.red,
      accentColor: Colors.black,
      textTheme: GoogleFonts.latoTextTheme(),
    ),
      debugShowCheckedModeBanner: false,
     home: Id(login: login),
    ));
}
