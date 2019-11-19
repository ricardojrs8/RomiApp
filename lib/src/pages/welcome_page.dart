import 'package:flutter/material.dart';
import 'package:romi/media_detail.dart';


class WelcomePage extends StatelessWidget {
  static const String routeName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Stack(
      children: <Widget>[
        MediaDetail(),
      ],
      )
    );
  }
}