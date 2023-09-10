import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:youapp/common/palette.dart';
import 'package:youapp/component/background.dart';
import 'package:youapp/pages/input_biodata.dart';
import 'package:youapp/utils/bloc/profile/profile_bloc.dart';

class DashboardPage extends StatefulWidget {
  static String routeName = "/dashboard";
  final bool isBioEdit;
  const DashboardPage({super.key, required this.isBioEdit});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    bool editBio = widget.isBioEdit;
    final box = GetStorage();
    String token = box.read('token') ?? '';

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: BlocProvider(
        create: (context) => ProfileBloc()..add(GetProfile(token)),
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            print(state);
            if(state is GetProfileFailed){
              print(state.message);
            }
            if(state is GetProfileSuccess){
              print(state.data.data);
            }

            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded,
                      color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                centerTitle: true,
                title: Text(
                  "@johndoe123",
                  style: GoogleFonts.inter(
                    color: primaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                backgroundColor: primaryGreenColor,
                elevation: 0,
              ),
              body: Stack(
                children: [
                  const Background(),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          displayCard(),
                          const SizedBox(
                            height: 20,
                          ),
                          editBio ? const InputBioPage() : displayBio(true),
                          // InputBioPage(),
                          const SizedBox(
                            height: 20,
                          ),
                          displayInterest(),
                        ],
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

  displayCard() {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            color: transWhiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "@johndoe, 28",
                style: GoogleFonts.inter(
                  color: primaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Male",
                style: GoogleFonts.inter(
                  color: primaryText,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  displayBio(bool isAnyBio) {
    return Container(
      width: double.infinity,
      // height: MediaQuery.of(context).size.height * 0.2,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: transWhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "About",
                  style: GoogleFonts.inter(
                    color: primaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                isAnyBio
                    ? Column(
                        children: [
                          bioData("Birthday:", "28 / 08 / 1995 (Age 28)"),
                          const SizedBox(
                            height: 5,
                          ),
                          bioData("Horoscope:", "Virgo"),
                          const SizedBox(
                            height: 5,
                          ),
                          bioData("Zodiac:", "Pig"),
                          const SizedBox(
                            height: 5,
                          ),
                          bioData("Height:", "175 cm"),
                          const SizedBox(
                            height: 5,
                          ),
                          bioData("Weight:", "69 kg"),
                        ],
                      )
                    : Text(
                        "Add in your your to help others know you better",
                        style: GoogleFonts.inter(
                          color: primaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
              ],
            ),
          ),
          InkWell(
            child: Lottie.asset(
              'assets/icon/lottie/edit.json',
              // height: 120,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(DashboardPage.routeName,
                  arguments: {"isBioEdit": true});
            },
          ),
        ],
      ),
    );
  }

  bioData(String label, String content) {
    return Row(
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            color: hintColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          content,
          style: GoogleFonts.inter(
            color: primaryText,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  displayInterest() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: transWhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Interest",
                  style: GoogleFonts.inter(
                    color: primaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Add in your interest to find a better match",
                  style: GoogleFonts.inter(
                    color: primaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Lottie.asset(
            'assets/icon/lottie/edit.json',
            // height: 120,
          ),
        ],
      ),
    );
  }
}
