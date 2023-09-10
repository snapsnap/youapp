import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:youapp/component/background.dart';
import 'package:youapp/component/loading_page.dart';
import 'package:youapp/component/notif_dialog.dart';
import 'package:youapp/pages/dashboard_page.dart';
import 'package:youapp/pages/login_page.dart';
import 'package:youapp/utils/bloc/auth/auth_bloc.dart';

class LauncherPage extends StatefulWidget {
  static String routeName = "/launcher";
  const LauncherPage({super.key});

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  String? activeToken;

  getToken() async {
    final box = GetStorage();
    String token = box.read('token') ?? '';
    setState(() {
      activeToken = token;
    });
    if (activeToken!.isEmpty) {
      Navigator.of(context).pushNamed(LoginPage.routeName);
    }
  }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_){
    //   getToken();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(AuthChecking()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is AuthLoading){
            LoadingPage.show(context);
          }
          if(state is AuthUnauthenticated){
            LoadingPage.hide(context);
            NotifDialog.show(
                context: context,
                color: "red",
                icon: "gagal",
                title: "Ooops..",
                subtitle: "Error system",
                buttontext: "I understand",
                onPressed: () async {
                  Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
                });
          }
          if(state is AuthAuthenticated){
            LoadingPage.hide(context);
            Navigator.of(context).pushReplacementNamed(DashboardPage.routeName, arguments: {
              "isBioEdit": false
            });
          }
        },
        child: const Background(),
      ),
    );
  }
}
