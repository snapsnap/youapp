import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youapp/common/palette.dart';
import 'package:youapp/common/variable.dart';
import 'package:youapp/component/background.dart';
import 'package:youapp/component/loading_page.dart';
import 'package:youapp/component/notif_dialog.dart';
import 'package:youapp/pages/login_page.dart';
import 'package:youapp/utils/bloc/auth/auth_bloc.dart';

class RegisterPage extends StatefulWidget {
  static String routeName = "/register";
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool _passwordConfVisible = false;

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
            if(state is RegisterLoading){
              LoadingPage.show(context);
            }
            if(state is RegisterFailed){
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
            if(state is RegisterSuccess){
              LoadingPage.hide(context);
              NotifDialog.show(
                  context: context,
                  color: "green",
                  icon: "sukses",
                  title: "Yeaay..",
                  subtitle: "Success",
                  buttontext: "I understand",
                  onPressed: () async {
                    Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
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
                                "Register",
                                style: GoogleFonts.inter(
                                  color: primaryText,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              _buildTextEmail(),
                              const SizedBox(
                                height: 10,
                              ),
                              _buildTextForm(),
                              const SizedBox(
                                height: 10,
                              ),
                              _buildTextFormPass(),
                              const SizedBox(
                                height: 10,
                              ),
                              _buildTextFormConf(),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(lightBlue,),
                                        minimumSize: MaterialStateProperty.all(
                                          const Size(
                                            double.infinity,
                                            buttonHeight + 10,
                                          ),
                                        ),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                side: const BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                            ),
                                        ),
                                    ),
                                    child: Text(
                                      "Register",
                                      style: GoogleFonts.roboto(
                                        color: primaryText,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    onPressed: () {
                                      if(formKey.currentState!.validate()){
                                        BlocProvider.of<AuthBloc>(context).add(Register(
                                          _emailController.text,
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
                                    "Have an account?",
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
                                      Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
                                    },
                                    child: Text(
                                      "Login here",
                                      style: GoogleFonts.inter(
                                        color: const Color.fromARGB(
                                            255, 255, 247, 175),
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

  TextFormField _buildTextEmail() {
    return TextFormField(
      controller: _emailController,
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
        hintText: 'Create Email',
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
          return "* Empty Email";
        }
        return null;
      },
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
        hintText: 'Create Username',
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
        hintText: 'Create Password',
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
          return "* Password can not be empty";
        }

        return null;
      },
    );
  }

  TextFormField _buildTextFormConf() {
    return TextFormField(
      controller: _passwordConfController,
      obscureText: !_passwordConfVisible,
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
        hintText: 'Confirm Password',
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
          return "* Password confirmation can not be empty";
        }

        return null;
      },
    );
  }
}
