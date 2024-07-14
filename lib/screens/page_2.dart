import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/colors.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int index = 0;
  TextEditingController? _otherController;
  var list = [
    "Upgrading my home",
    "Selling secondary home",
    "Relocation",
    "Downsizing my home",
    "Retiring",
    "Other"
  ];

  @override
  void initState() {
    super.initState();
    _otherController = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.shade200,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Why are you selling your home?',
                  style: GoogleFonts.poppins(
                    color: ColorDark.background,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            index = i;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorLight.divider,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: index == i
                                      ? const Icon(
                                    Icons.check_box_rounded,
                                    size: 30,
                                    color: ColorLight.info,
                                  )
                                      : const Icon(
                                    Icons.check_box_outline_blank_rounded,
                                    size: 30,
                                    color: ColorLight.fontDisable,
                                  ),
                                  title: Text(list[i]),
                                ),

                                i==5 && index==5?Padding(
                                  padding: const EdgeInsets.only(left: 60.0,right: 20,bottom: 15),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: ColorDark.fontTitle,
                                      borderRadius: BorderRadius.circular(8),
                                    ),

                                    child: TextFormField(
                                      controller: _otherController,
                                      cursorColor: ColorDark.background,
                                      maxLines: 2,
                                      autofocus: false,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.openSans(
                                        color: ColorDark.background,
                                        fontSize: 14.0,
                                      ),
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          //filled: true,
                                          //fillColor: ColorDark.fontTitle,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          hintText: "Please enter your reason for selling",
                                          //hintText: hintText,
                                          hintStyle: GoogleFonts.openSans(
                                              color: ColorDark.fontSubtitle,
                                              fontWeight: FontWeight.w600,
                                              fontSize:14
                                          ),
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6)
                                      ),
                                    ),
                                  ),
                                ):const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
