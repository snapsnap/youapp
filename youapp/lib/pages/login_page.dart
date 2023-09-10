import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youapp/common/palette.dart';
import 'package:youapp/common/variable.dart';
import 'package:youapp/component/background.dart';
import 'package:youapp/component/loading_page.dart';
import 'package:youapp/component/notif_dialog.dart';
import 'package:youapp/pages/dashboard_page.dart';
import 'package:youapp/pages/register_page.dart';
import 'package:youapp/utils/bloc/auth/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: BlocProvider(
        create: (context) => AuthBloc(),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if(state is LoginLoading){
              LoadingPage.show(context);
            }
            if(state is LoginFailed){
              LoadingPage.hide(context);
              NotifDialog.show(
                  context: context,
                  color: "red",
                  icon: "gagal",
                  title: "Ooops..",
                  subtitle: state.message ?? "Error system",
                  buttontext: "I understand",
                  onPressed: () async {
                    Navigator.of(context).pop();
                  });
            }
            if(state is LoginSuccess){
              LoadingPage.hide(context);
              Navigator.of(context).pushReplacementNamed(DashboardPage.routeName, arguments: {
                "isBioEdit": false
              });
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: Stack(
                alignment: Alignment.center,
                children: [
                  const Background(),
                  SingleChildScrollView(
                    child: SafeArea(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Login",
                                style: GoogleFonts.inter(
                                  color: primaryText,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              _buildTextForm(),
                              const SizedBox(
                                height: 10,
                              ),
                              _buildTextFormPass(),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                lightBlue),
                                        minimumSize: MaterialStateProperty.all(
                                            const Size(double.infinity,
                                                buttonHeight + 10)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                side: const BorderSide(
                                                    color:
                                                        Colors.transparent)))),
                                    child: Text(
                                      "Login",
                                      style: GoogleFonts.roboto(
                                        color: primaryText,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    onPressed: () {
                                      if(formKey.currentState!.validate()){
                                        BlocProvider.of<AuthBloc>(context).add(Login(
                                          _usernameController.text,
                                          _usernameController.text,
                                          _passwordController.text,
                                        ));
                                      }
                                    }),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "No account?",
                                    style: GoogleFonts.inter(
                                      color: primaryText,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushReplacementNamed(RegisterPage.routeName);
                                    },
                                    child: Text(
                                      "Register here",
                                      style: GoogleFonts.inter(
                                        color: yellowText,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  TextFormField _buildTextForm() {
    return TextFormField(
      controller: _usernameController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10.0), right: Radius.circular(10.0))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10.0), right: Radius.circular(10.0))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: skyBlue),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10.0), right: Radius.circular(10.0))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: skyBlue),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10.0), right: Radius.circular(10.0))),
        hintText: 'Enter Username/Email',
        hintStyle: TextStyle(
            color: hintColor,
            fontStyle: FontStyle.normal,
            fontSize: 13,
            fontWeight: FontWeight.w400),
        fillColor: transGreenColor,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      ),
      style: GoogleFonts.inter(
        color: primaryText,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "* Empty Username";
        }
        return null;
      },
    );
  }

  TextFormField _buildTextFormPass() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_passwordVisible,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10.0), right: Radius.circular(10.0))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10.0), right: Radius.circular(10.0))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: skyBlue),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10.0), right: Radius.circular(10.0))),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: skyBlue),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10.0), right: Radius.circular(10.0))),
        hintText: 'Enter Password',
        hintStyle: const TextStyle(
            color: hintColor,
            fontStyle: FontStyle.normal,
            fontSize: 13,
            fontWeight: FontWeight.w400),
        fillColor: transGreenColor,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        suffixIcon: IconButton(
          color: primaryText,
          splashRadius: 1.0,
          icon: Icon(!_passwordVisible
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
      style: GoogleFonts.inter(
        color: primaryText,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "* Password tidak boleh kosong";
        }

        return null;
      },
    );
  }
}
