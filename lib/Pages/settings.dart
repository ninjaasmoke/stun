import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loginpage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Settings extends StatefulWidget {

  final String name;
  final String photoUrl;
  final String email;

  Settings({Key key,@required this.name,this.photoUrl,this.email}): super(key: key);

  @override
  _SettingsState createState() => _SettingsState( name: name, photoUrl: photoUrl, email: email
  );

}

class _SettingsState extends State<Settings> {

  final String name;
  final String photoUrl;
  final String email;

  _SettingsState({@required this.name,this.photoUrl,this.email});
  final GoogleSignIn _gSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111111),
      appBar: CupertinoNavigationBar(
        middle: Text("Settings", style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          child: Container(
            height: 25,
            width: 40,
            alignment: Alignment.centerLeft,
            child: Icon(Icons.arrow_back_ios, color: Colors.grey,size: 20,)),
          onTap: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
        backgroundColor: CupertinoColors.darkBackgroundGray,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             Center(
               child: CircleAvatar(
                 backgroundImage: NetworkImage(photoUrl),
                 radius: 80,
               ),
             ),
             SizedBox(
                height: 10,
              ),
             Divider(
               color: Colors.grey,
               height: 30,
             ),
              SizedBox(
                height: 10,
              ),
              Text(name,
                style: TextStyle(color: Colors.white,
                    fontSize: 20),
              ),
              
              SizedBox(
                height: 30,
              ),
              Text(email,
                style: TextStyle(color: Colors.white,
                    fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                child: Hero(
                  tag: 'dasher',
                                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: Colors.white,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) => CupertinoAlertDialog(
                            title: Text("Sign Out?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),),
                            content: Text("\nAre you sure you want to sign out?\n\nYou will no longer be able to access Istriwaala",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14)
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("Yes",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14)),
                                onPressed: () async {
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.remove('userEmail');
                                  prefs.remove('userName');
                                  prefs.remove('userPhoto');
                                  prefs.setBool('login', false);
                                  _gSignIn
                                      .signOut()
                                      .catchError((error) => print(error));
                                  print('Signed out');
                                  Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (BuildContext context) => LoginPage()), ModalRoute.withName('/'));
                                },
                              ),
                              Hero(
                                tag: "dasher",
                                                            child: FlatButton(
                                  child: Text("Cancel",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14)
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ));
                    },
                    child: Text(
                      "Sign Out",
                      style: TextStyle(
                        fontFamily: 'nsan',
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
               Divider(
               color: Colors.grey,
               height: 30,
             ),
             SizedBox(height: MediaQuery.of(context).size.height* .3,),
             Center(
               child: CupertinoButton(
                 child: Text("I am a customer", 
                 style: TextStyle(color: Colors.grey[600]),),
                 onPressed: () {},
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}