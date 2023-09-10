
import 'package:flutter/material.dart';
import 'package:youapp/pages/dashboard_page.dart';
import 'package:youapp/pages/launcher_page.dart';
import 'package:youapp/pages/login_page.dart';
import 'package:youapp/pages/register_page.dart';

var routesName = <String, WidgetBuilder>{
  LauncherPage.routeName: (context) => const LauncherPage(),
  LoginPage.routeName: (context) => const LoginPage(),
  RegisterPage.routeName: (context) => const RegisterPage(),
  DashboardPage.routeName: (context) {
    final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return DashboardPage(isBioEdit: args["isBioEdit"]);
  },
};