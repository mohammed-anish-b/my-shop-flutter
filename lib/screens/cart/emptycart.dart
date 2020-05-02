import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 500,
        child: SvgPicture.asset('assets/images/mtcart.svg'),
      ),
    );
  }
}