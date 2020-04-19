import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchService extends StatefulWidget {
  final Color appBarColor;
  final String serviceName;
  final Icon serviceIcon;
  SearchService({@required this.appBarColor, this.serviceName, this.serviceIcon});

  @override
  _SearchServiceState createState() => _SearchServiceState();
}

class _SearchServiceState extends State<SearchService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.appBarColor,
      appBar: CupertinoNavigationBar(
        backgroundColor: widget.appBarColor,
        middle: Text(widget.serviceName,),
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          child: Container(
              height: 25,
              width: 40,
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 20,
              )),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        trailing: widget.serviceIcon,
      ),
    );
  }
}
