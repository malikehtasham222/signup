import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signup/widgets/custom_text_form_field.dart';

import '../helper/colors.dart';

class Page1 extends StatelessWidget {
  final TextEditingController? streetAddressController;
  final TextEditingController? unitNumberController;
  final TextEditingController? cityNameController;
  final TextEditingController? zipCodeController;
  final String? dropDownValue;
  final void Function(String?)? onSelectedMenu;
  const Page1({super.key, required this.dropDownValue, required this.onSelectedMenu, required this.streetAddressController, required this.unitNumberController, required this.cityNameController, required this.zipCodeController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Property Address',
              style: GoogleFonts.poppins(
                color: ColorDark.background,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20.0),

            CustomTextFormField(
              controller: streetAddressController,
              textFieldType: TextFieldType.Text,
              hintText: "Street address",
            ),
            const SizedBox(height: 10,),
            CustomTextFormField(
              controller: unitNumberController,
              textFieldType: TextFieldType.Number,
              hintText: "Unit number",
            ),
            const SizedBox(height: 10,),
            CustomTextFormField(
              controller: cityNameController,
              textFieldType: TextFieldType.Text,
              hintText: "City name",
            ),
            const SizedBox(height: 10,),
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
                      'Select state',
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
            const SizedBox(height: 10,),
            CustomTextFormField(
              controller: zipCodeController,
              textFieldType: TextFieldType.Text,
              hintText: "Zip code",
            ),

          ],
        ),
      ),
    );
  }
}
