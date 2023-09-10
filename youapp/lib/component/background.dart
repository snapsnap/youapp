import 'package:flutter/material.dart';
import 'package:youapp/common/palette.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [primaryBlackColor, primaryGreenColor],
            begin: FractionalOffset(0.2, 1.2),
            end: FractionalOffset(0.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp
        ),
      ),
    );
  }
}