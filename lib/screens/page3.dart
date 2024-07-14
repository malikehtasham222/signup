import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signup/widgets/custom_text_form_field.dart';

import '../helper/colors.dart';

class Page3 extends StatelessWidget {
  final TextEditingController? streetAddressController;
  final TextEditingController? unitNumberController;
  final TextEditingController? cityNameController;
  final TextEditingController? zipCodeController;
  final String? dropDownValue;
  final void Function(String?)? onSelectedMenu;
  const Page3({super.key, required this.dropDownValue, required this.onSelectedMenu, required this.streetAddressController, required this.unitNumberController, required this.cityNameController, required this.zipCodeController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Home facts',
              style: GoogleFonts.poppins(
                color: ColorDark.background,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            Text(
              'This helps your agent prepare the most accurate home estimate',
              style: GoogleFonts.openSans(
                  color: ColorDark.fontDisable,
                  fontWeight: FontWeight.w600,
                  fontSize:14
              ),
            ),
            const SizedBox(height: 10.0),

            Text(
              'Type property',
              style: GoogleFonts.openSans(
                  color: ColorDark.background,
                  fontWeight: FontWeight.w600,
                  fontSize:15
              ),
            ),

            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: ColorLight.divider,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 6.0),
                child: DropdownButton(
                    underline: const SizedBox(),
                    hint: dropDownValue == null
                        ? Text(
                      'Select type',
                      style: GoogleFonts.openSans(
                          color: ColorDark.background,
                          fontWeight: FontWeight.w600,
                          fontSize:14
                      ),
                    )
                        : Text(
                      dropDownValue!,
                      style: GoogleFonts.openSans(
                          color: ColorDark.background,
                          fontWeight: FontWeight.w600,
                          fontSize:14
                      ),
                    ),
                    isExpanded: true,
                    iconSize: 30.0,
                    style: GoogleFonts.openSans(
                        color: ColorDark.background,
                        fontWeight: FontWeight.w600,
                        fontSize:14
                    ),
                    items: ['One', 'Two', 'Three'].map(
                          (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      },
                    ).toList(),
                    onChanged: onSelectedMenu
                ),
              ),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Finished Size (Sq.Ft.)',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.openSans(
                                  color: ColorDark.background,
                                  fontWeight: FontWeight.w600,
                                  fontSize:15
                              ),
                            ),
                          ),

                          const Icon(
                            Icons.info,
                            color: ColorLight.info,
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        controller: streetAddressController,
                        textFieldType: TextFieldType.Number,
                        hintText: "0 Sq.Ft.",
                      ),
                      const SizedBox(height: 10),

                      Text(
                        'Year Built',
                        style: GoogleFonts.openSans(
                            color: ColorDark.background,
                            fontWeight: FontWeight.w600,
                            fontSize:15
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        controller: streetAddressController,
                        textFieldType: TextFieldType.Number,
                        hintText: "0",
                      ),
                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Full Baths',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.openSans(
                                  color: ColorDark.background,
                                  fontWeight: FontWeight.w600,
                                  fontSize:15
                              ),
                            ),
                          ),

                          const Icon(
                            Icons.info,
                            color: ColorLight.info,
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        controller: streetAddressController,
                        textFieldType: TextFieldType.Number,
                        hintText: "0",
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Plot Size (Sq.Ft.)',
                        style: GoogleFonts.openSans(
                            color: ColorDark.background,
                            fontWeight: FontWeight.w600,
                            fontSize:15
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        controller: streetAddressController,
                        textFieldType: TextFieldType.Number,
                        hintText: "0 Sq.Ft.",
                      ),
                      const SizedBox(height: 10),

                      Text(
                        'Bed Rooms',
                        style: GoogleFonts.openSans(
                            color: ColorDark.background,
                            fontWeight: FontWeight.w600,
                            fontSize:15
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        controller: streetAddressController,
                        textFieldType: TextFieldType.Number,
                        hintText: "0",
                      ),
                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Security Deposit',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.openSans(
                                  color: ColorDark.background,
                                  fontWeight: FontWeight.w600,
                                  fontSize:15
                              ),
                            ),
                          ),

                          const Icon(
                            Icons.info,
                            color: ColorLight.info,
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        controller: streetAddressController,
                        textFieldType: TextFieldType.Number,
                        hintText: "KES",
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                )

              ],
            ),

            Text(
              'Monthly Rent*',
              style: GoogleFonts.openSans(
                  color: ColorDark.background,
                  fontWeight: FontWeight.w600,
                  fontSize:15
              ),
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              controller: unitNumberController,
              textFieldType: TextFieldType.Number,
              hintText: "KES",
            ),
          ],
        ),
      ),
    );
  }
}
