import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  final Color color;

  Loading({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: Center(
        child: SpinKitThreeBounce(
          color: color,
          size: 30.0,
        ),
      ),
    );
  }
}
