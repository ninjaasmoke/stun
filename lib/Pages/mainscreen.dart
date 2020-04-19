import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:istriwaala2/Anim/showup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:istriwaala2/Pages/settings.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "ISTRIWAALA",
          style: TextStyle(
            fontSize: 20.0,
            letterSpacing: 2,
            fontWeight: FontWeight.w500,
            color: Colors.grey[200],
          ),
        ),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xff151515),
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 18.0),
            shrinkWrap: false,
            children: <Widget>[
              Container(
                height: 260,
                width: 260,
                child: CircleAvatar(
                  backgroundImage: AssetImage('Assets/istri6.png'),
                  radius: 75,
                ),
                alignment: Alignment.center,
              ),
              FlatButton(
                child: Text(
                  "      Hey, dear\nIstriwaala user",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.history,
                  color: Colors.blue[600],
                ),
                label: Text(
                  "My History",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.heart_solid,
                  color: Colors.red[400],
                ),
                label: Text(
                  "Favourites",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.account_balance_wallet,
                  color: Colors.brown[500],
                ),
                label: Text(
                  "Online Wallet",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[200],
                  ),
                ),
              ),
              FlatButton.icon(
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => Settings(
                name:  prefs.getString('userName'),
                photoUrl: prefs.getString('userPhoto'),
                email: prefs.getString('userEmail'),)));
                  },
                  icon: Icon(
                    Icons.settings,
                    color: Colors.grey[200],
                  ),
                  label: Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[300],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 200.0,
                  width: 600.0,
//                  child: Carousel(
//                    animationDuration: Duration(milliseconds: 2000),
//                    showIndicator: false,
//                    dotSize: 0.0,
//                    images: [
//                      //AssetImage('assets/kleider.jpg'),
//                      //AssetImage('assets/clem.jpg'),
//                    ],
//                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Choose a service",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              Divider(
                height: 30.0,
                color: Colors.white,
              ),
              SizedBox(
                height: 10.0,
              ),
              ShowUp(
                delay: 500,
                child: SizedBox(
                  width: 250.0,
                  height: 50.0,
                  child: FlatButton.icon(
                    icon: Icon(
                      Icons.pin_drop,
                    ),
                    color: Colors.red[600],
                    onPressed: () {},
                    label: Text(
                      "Ironing",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              ShowUp(
                delay: 800,
                child: SizedBox(
                  width: 250.0,
                  height: 50.0,
                  child: FlatButton.icon(
                    icon: Icon(
                      Icons.local_laundry_service,
                    ),
                    color: Colors.green[500],
                    onPressed: () {},
                    label: Text(
                      "Dry Cleaning",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              ShowUp(
                delay: 1100,
                child: SizedBox(
                  width: 250.0,
                  height: 50.0,
                  child: FlatButton.icon(
                    icon: Icon(
                      Icons.transfer_within_a_station,
                    ),
                    color: Colors.blue[400],
                    onPressed: () {},
                    label: Text(
                      "Washing",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              ShowUp(
                delay: 1400,
                child: SizedBox(
                  width: 250.0,
                  height: 50.0,
                  child: FlatButton.icon(
                    icon: Icon(
                      Icons.content_cut,
                    ),
                    color: Colors.orange[300],
                    onPressed: () {},
                    label: Text(
                      "Darning",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
