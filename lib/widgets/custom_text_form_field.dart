import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signup/helper/colors.dart';

enum TextFieldType { Alphabet, Email, Text, Password, PhoneNumber, Number }

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextFieldType textFieldType;
  final String? hintText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final int? maxLines;
  final TextAlign? textAlign;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.textFieldType = TextFieldType.Text,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    keyboardType(TextFieldType textFieldType) {
      switch (textFieldType) {
        case TextFieldType.Alphabet:
          return TextInputType.text;
        case TextFieldType.Email:
          return TextInputType.emailAddress;
        case TextFieldType.Number:
          return TextInputType.number;
        case TextFieldType.Password:
          return TextInputType.text;
        case TextFieldType.PhoneNumber:
          return TextInputType.phone;
        case TextFieldType.Text:
          return TextInputType.text;
        default:
          return TextInputType.text;
      }
    }

    return Container(
      //width: 315,
      decoration: BoxDecoration(
        color: ColorLight.divider,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 6.0),
        child: TextFormField(
          controller: controller,
          cursorColor: ColorDark.background,
          maxLines: maxLines,
          autofocus: false,
          textAlign: textAlign ?? TextAlign.left,
          obscureText: obscureText ?? false,
          style: GoogleFonts.openSans(
            color: ColorDark.background,
            fontSize: 14.0,
          ),
          keyboardType: keyboardType(textFieldType),
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            labelText: hintText,
            //hintText: hintText,
            labelStyle: GoogleFonts.openSans(
              color: ColorDark.background,
              fontWeight: FontWeight.w600,
              fontSize:14
            ),
            suffixIcon: suffixIcon,
              contentPadding: EdgeInsets.zero
          ),
        ),
      ),
    );
  }
}
