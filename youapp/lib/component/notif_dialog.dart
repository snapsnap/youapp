import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youapp/common/palette.dart';

import '../../common/variable.dart';

class NotifDialog extends StatelessWidget {
  static void show({Key? key, required BuildContext context, required String icon, required String title, required String subtitle, required String buttontext, required String color, required Function onPressed}) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => NotifDialog(
        key: key,
        icon: icon,
        title: title,
        subtitle: subtitle,
        buttontext: buttontext,
        color: color,
        onPressed: onPressed
      ),
    );
  }
  
  final String? icon;
  final String? title;
  final String? subtitle;
  final String? buttontext;
  final String? color;
  final Function onPressed;
  const NotifDialog({super.key, this.icon, this.title, this.subtitle, this.buttontext, this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            decoration: BoxDecoration(
              color: primaryGreenColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: transWhiteColor)
            ),
            padding: const EdgeInsets.all(20.0),
            child: Material(
              color: primaryGreenColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "$title",
                    style: GoogleFonts.roboto(
                      color: "$color" == "green" ? greenColor : "$color" == "red" ? redColor : "$color" == "orange" ? orangeColor : hintColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "$subtitle",
                    style: GoogleFonts.roboto(
                      color: hintColor,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: "$color" == "green" ? greenColor : "$color" == "red" ? redColor : "$color" == "orange" ? orangeColor : hintColor,
                      minimumSize: const Size(double.infinity, buttonHeight + 5),
                    ),
                    onPressed: onPressed as void Function()?,
                    child: Text(
                      "$buttontext",
                      style: GoogleFonts.roboto(
                        color: primaryMidgreenColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
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