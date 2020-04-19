import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'mainscreen.dart';
import 'package:istriwaala2/Anim/showup.dart';
import 'dart:async';
import 'dart:io';
import 'package:app_settings/app_settings.dart';

class LoginPage extends StatefulWidget {
 
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  int dela = 700;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> _signIn(BuildContext context) async {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Signing in..."),
      duration: Duration(seconds: 4),
    ));

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    FirebaseUser userDetails =
        (await _firebaseAuth.signInWithCredential(credential)).user;
        
    ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);

    List<ProviderDetails> providerData = List<ProviderDetails>();
    providerData.add(providerInfo);

    // UserDetails details = UserDetails(
    //     userDetails.providerId,
    //     userDetails.displayName,
    //     userDetails.photoUrl,
    //     userDetails.email,
    //     userDetails.phoneNumber,
    //     providerData);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('login', true); 
    prefs.setString('userEmail', userDetails.email); 
    prefs.setString('userName', userDetails.displayName);
    prefs.setString('userPhoto', userDetails.photoUrl);
    prefs.setBool('login', true);
    

    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (context) => MainScreen()),
    );
    return userDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  ShowUp(
                    child: Text(
                      "Hi there,",
                      style: TextStyle(
                          fontSize: 40, color: Colors.amber.withOpacity(0.8)),
                    ),
                    delay: dela,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ShowUp(
                    child: Text(
                      "Are you tired of Searching for people who can wash, darn, iron and dry clean your clothes?",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    delay: dela + 400,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ShowUp(
                    child: Text(
                      "Not sure who is the best person to get the job done?",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    delay: dela+800,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ShowUp(
                    child: RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Try",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          )),
                      TextSpan(
                          text: " Istriwaala",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 50,
                          )),
                    ])),
                    delay: dela+1200,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ShowUp(
                    child: Text(
                      "We will help you find the right place...",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    delay: dela+1600,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  ShowUp(
                    delay: dela+2000,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.white.withOpacity(0.15),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Container(
                                  child: Text(
                                    "Welcome",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: GestureDetector(
                                  onTap: () async {
                                    try{
                                      final result = await InternetAddress.lookup('google.com');
                                        if(result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                                         _signIn(context)
                                      .then((FirebaseUser user) => print(user))
                                      .catchError((e) => print(e));
                                      }
                                    }on SocketException catch (_) {
                                      showDialog(context: context,
                                        builder: (_) => AlertDialog(
                                          contentPadding: EdgeInsets.fromLTRB(23,28,28,28),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                          elevation: 10,
                                          backgroundColor: Colors.grey[900],
                                          title: Text("Not Connected",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                           ),
                                          ),
                                          content: Text("You are not connected to the internet.\n\nCheck your connection and try again",
                                          style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14)),
                                          actions: <Widget>[
                                           FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),)
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        AppSettings.openDataRoamingSettings();
                                      },
                                      child: Text("Network Settings",
                                      style: TextStyle(color: Colors.red),)
                                    ),
                                  ],
                                        ));
                                    }

                                  },
                                  child: Container(
                                    width: 210,
                                    height: 50,
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        CircleAvatar(
                                          child: Image.asset(
                                              'Assets/google-logo.png'),
                                          backgroundColor: Colors.white,
                                          radius: 10,
                                        ),
                                        SizedBox(width: 10),
                                        Text("Continue with Google"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UserDetails {
  final String provDet;
  final String userName;
  final String photoURL;
  final String userEmail;
  final String userPhone;
  final List<ProviderDetails> providerData;
  UserDetails(this.provDet, this.userName, this.photoURL, this.userEmail,
      this.userPhone, this.providerData);
}

class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}
