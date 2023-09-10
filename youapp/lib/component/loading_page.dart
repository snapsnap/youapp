import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  static void show(BuildContext context, {Key? key}) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => LoadingPage(key: key),
    );
  }

  static void hide(BuildContext context) {
    Navigator.pop(context);
  }

  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Container(
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(12.0),
          child: const CircularProgressIndicator(
            strokeWidth: 3.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
