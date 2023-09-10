
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:youapp/common/palette.dart';
import 'package:youapp/pages/dashboard_page.dart';

class InputBioPage extends StatefulWidget {
  const InputBioPage({super.key});

  @override
  State<InputBioPage> createState() => _InputBioPageState();
}

class _InputBioPageState extends State<InputBioPage> {

  String? birthdayDate;
  String? selectedGenre;
  List<String> genreList = ["Male", "Female"];

  final nameController = TextEditingController();
  final birthdayController = TextEditingController();
  final horoscopeController = TextEditingController();
  final zodiacController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: transWhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
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
                  ],
                ),
              ),
              InkWell(
                child: Text(
                  "Save & Update",
                  style: GoogleFonts.inter(
                    color: yellowText,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(DashboardPage.routeName, arguments: {
                    "isBioEdit": false
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    color: transWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.transparent),
                  ),
                  height: 60,
                  width: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent, width: .2),
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: yellowText,
                          size: 30,
                      )),
                    ),
                  ),
                ),
                onTap: () {
                  
                },
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Add Image",
                style: GoogleFonts.inter(
                  color: primaryText,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          formInput(),
        ],
      ),
    );
  }

  formInput() {
    return Form(
      child: Column(
        children: [
          rowInput("Display name:", fieldName()),
          rowInput("Genre:", ddGenre()),
          rowInput("Birthday:", fieldBirthday()),
          rowInput("Horoscope:", fieldHoroscope()),
          rowInput("Zodiac:", fieldZodiac()),
          rowInput("Height:", fieldHeight()),
          rowInput("Weight:", fieldWeight()),
        ],
      ),
    );
  }

  rowInput(String label, Widget fieldInput) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,5,0,5),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: GoogleFonts.inter(
                color: primaryText,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: fieldInput,
          ),
        ],
      ),
    );
  }

  TextFormField fieldName() {
    return TextFormField(
      controller: nameController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white30),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10.0), right: Radius.circular(10.0))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white30),
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
        hintText: 'Enter name',
        hintStyle: TextStyle(
            color: hintColor, fontStyle: FontStyle.normal, fontSize: 13, fontWeight: FontWeight.w400
        ),
        fillColor: transWhiteColor,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      ),
      style: GoogleFonts.inter(
        color: primaryText,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.right,
      validator: (value) {
        if (value!.isEmpty) {
          return "* Empty name";
        }
        return null;
      },
    );
  }

  DropdownButtonFormField ddGenre() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white30),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10.0), right: Radius.circular(10.0))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white30),
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
        // hintText: 'Select Gender',
        hintStyle: TextStyle(
            color: hintColor, 
            fontStyle: FontStyle.normal, 
            fontSize: 13, 
            fontWeight: FontWeight.w400,
        ),
        fillColor: transWhiteColor,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      ),
      hint: const Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Select Gender',
          style: TextStyle(
            color: hintColor, 
            fontStyle: FontStyle.normal, 
            fontSize: 13, 
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      isExpanded: true,
      style: GoogleFonts.inter(
        color: primaryText,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      dropdownColor: primaryGreenColor,
      // decoration: const InputDecoration(
        // border: OutlineInputBorder(
        //     borderSide: BorderSide(color: Colors.white30),
        //     borderRadius: BorderRadius.horizontal(
        //         left: Radius.circular(10.0), right: Radius.circular(10.0))),
        // hintText: 'Select Gender',
        // hintStyle: TextStyle(
        //     color: hintColor, fontStyle: FontStyle.normal, fontSize: 13, fontWeight: FontWeight.w400
        // ),
        // fillColor: Colors.white,
        // contentPadding: EdgeInsets.symmetric(
        //   vertical: 10.0, 
        //   horizontal: 10.0
        // ),
      // ),
      value: selectedGenre,
      items: genreList
          .map((e) => DropdownMenuItem<String>(
              value: e, child: Text(e, textAlign: TextAlign.right)))
          .toList(),
      onChanged: (value) {
        // setState(() {
        //   selectedId = value;
        //   finalPertanyaan = value?.idparam.toString();
        // });
      },
      validator: (value) {
        if (value == null) {
          return "* Unselected genre";
        }
        return null;
      },
    );
  }

  TextFormField fieldBirthday() {
    return TextFormField(
      controller: birthdayController,
      readOnly: true,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white30),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10.0), right: Radius.circular(10.0))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white30),
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
        hintText: 'DD MM YYY',
        hintStyle: TextStyle(
            color: hintColor, fontStyle: FontStyle.normal, fontSize: 13, fontWeight: FontWeight.w400
        ),
        fillColor: transWhiteColor,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      ),
      style: GoogleFonts.inter(
        color: primaryText,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.right,
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1800),
          lastDate: DateTime(2099),
        ).then((date) {
          if(date != null){
            birthdayDate = "${DateFormat('dd').format(date)}/${DateFormat('MM').format(date)}/${DateFormat('yyyy').format(date)}";
            setState(() {
              birthdayController.text = birthdayDate!;
            });
          }
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "* Empty date";
        }
        return null;
      },
    );
  }

  TextFormField fieldHoroscope() {
    return TextFormField(
      controller: horoscopeController,
      readOnly: true,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white30),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10.0), right: Radius.circular(10.0))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white30),
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
        hintText: '--',
        hintStyle: TextStyle(
            color: hintColor, fontStyle: FontStyle.normal, fontSize: 13, fontWeight: FontWeight.w400
        ),
        fillColor: transWhiteColor,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      ),
      style: GoogleFonts.inter(
        color: primaryText,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.right,
      validator: (value) {
        if (value!.isEmpty) {
          return "* Empty horoscope";
        }
        return null;
      },
    );
  }

  TextFormField fieldZodiac() {
    return TextFormField(
      controller: zodiacController,
      readOnly: true,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white30),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10.0), right: Radius.circular(10.0))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white30),
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
        hintText: '--',
        hintStyle: TextStyle(
            color: hintColor, fontStyle: FontStyle.normal, fontSize: 13, fontWeight: FontWeight.w400
        ),
        fillColor: transWhiteColor,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      ),
      style: GoogleFonts.inter(
        color: primaryText,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.right,
      validator: (value) {
        if (value!.isEmpty) {
          return "* Empty zodiac";
        }
        return null;
      },
    );
  }

  TextFormField fieldHeight() {
    return TextFormField(
      controller: heightController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white30),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10.0), right: Radius.circular(10.0))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white30),
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
        hintText: 'Add height',
        hintStyle: TextStyle(
            color: hintColor, fontStyle: FontStyle.normal, fontSize: 13, fontWeight: FontWeight.w400
        ),
        fillColor: transWhiteColor,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      ),
      style: GoogleFonts.inter(
        color: primaryText,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.right,
      validator: (value) {
        if (value!.isEmpty) {
          return "* Empty height";
        }
        return null;
      },
    );
  }

  TextFormField fieldWeight() {
    return TextFormField(
      controller: weightController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white30),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10.0), right: Radius.circular(10.0))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white30),
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
        hintText: 'Add weight',
        hintStyle: TextStyle(
            color: hintColor, fontStyle: FontStyle.normal, fontSize: 13, fontWeight: FontWeight.w400
        ),
        fillColor: transWhiteColor,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      ),
      style: GoogleFonts.inter(
        color: primaryText,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.right,
      validator: (value) {
        if (value!.isEmpty) {
          return "* Empty weight";
        }
        return null;
      },
    );
  }

}