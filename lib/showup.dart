import 'dart:async';
import 'package:flutter/material.dart';

class ShowUp extends StatefulWidget {

  final Widget child;
  final int delay;

  ShowUp({@required this.child, this.delay});

  @override
  _ShowUpState createState() => _ShowUpState();
}

class _ShowUpState extends State<ShowUp> with TickerProviderStateMixin {

  AnimationController _animationController;
  Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    final curve = CurvedAnimation(curve: Curves.decelerate, parent: _animationController);

    _animOffset = Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero).animate(curve);

    if(widget.delay == null) {
      _animationController.forward();
    }
    else {
      Timer(Duration(milliseconds: widget.delay), () {
        _animationController.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
      opacity: _animationController,
    );
  }
}
