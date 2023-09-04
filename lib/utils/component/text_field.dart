import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../color.dart';
import '../constants.dart';
import '../dimensions.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.title,
    this.validator,
    this.enable = true,
    this.keyboardType,
    this.obscureText = false,
    this.onEditingComplete,
    this.suffixIcon,
    this.onChange,
    this.icon,
  });
  final TextEditingController controller;
  final String hintText, title;
  final String? Function(String?)? validator;
  final bool enable, obscureText;
  final TextInputType? keyboardType;
  final Function()? onEditingComplete;
  final Widget? suffixIcon;
  final Function(String)? onChange;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(getScreenHeight(15)),
      borderSide: BorderSide(
        width: getScreenHeight(0.5),
        style: BorderStyle.none,
        color: kSECCOLOUR,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kTextStyleCustom(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        Gap(getScreenHeight(5)),
        TextFormField(
          controller: controller,
          validator: validator,
          enabled: enable,
          keyboardType: keyboardType,
          obscureText: obscureText,
          onEditingComplete: onEditingComplete,
          onChanged: onChange,
          decoration: InputDecoration(
            hintText: ' $hintText',
            filled: true,
            fillColor: kTEXTFIELDBACKGROUND,
            prefixIcon: icon,
            hintStyle: kTextStyleCustom(fontSize: 14, color: kLightGray),
            enabledBorder: outlineInputBorder,
            border: outlineInputBorder,
            disabledBorder: outlineInputBorder,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(getScreenHeight(15)),
              borderSide: BorderSide(
                width: getScreenHeight(1),
                style: BorderStyle.solid,
                color: kSECCOLOUR,
              ),
            ),
            errorStyle: kTextStyleCustom(color: kSECCOLOUR, fontSize: 10),
            focusedBorder: outlineInputBorder,
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(getScreenHeight(15)),
              borderSide: BorderSide(
                width: getScreenHeight(1),
                style: BorderStyle.solid,
                color: kSECCOLOUR,
              ),
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
