import 'package:diit_portal/Utility/App_Colors/app_color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Section extends StatefulWidget {
  const Section({Key? key}) : super(key: key);

  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {


  String? dropdownValue;
  late SharedPreferences prefs;
  final _key = 'section';
  String select_text = 'Select from here';


  @override
  void initState() {
    super.initState();
    _read(); // read in initState
  }

  _read() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      dropdownValue = prefs.getString(_key) ?? "A";
      print(dropdownValue);// get the value
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorChanger.scaffoldcolor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Center(
              child: Lottie.asset('assets/intro_asset/second.json',
                height: Get.height / 3.5,
                width: Get.width / 1,
              ),
            ),

            SizedBox(height: Get.height/18,),

            Text(
                "Select Your Section",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: Get.width / 2,
                height: Get.height / 5,
                child: Center(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Expanded(
                            child: Text(
                              select_text,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      value: dropdownValue,
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                        prefs.setString(_key,
                            dropdownValue!); // save value to SharedPreference
                      },
                      items: ['A', 'B', 'C', 'D']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                        );
                      }).toList(),
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 160,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.white54,
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.orange,
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 4,
              ),
              ],
            ),
      ),
    );
  }
}
