import 'package:flutter/material.dart';
import 'package:may_fair/core/theme/color.dart';
import 'package:may_fair/core/theme/text_styles.dart';

class AppTextFormFeild extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enableBorder;
  final InputBorder? foucedBorder;
  final String hintText;
  final TextStyle? hintTextStyle;
  final Widget? suffixIcon;
  final bool? isObscure;
  final Color? backGroundColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String?) validator;

  const AppTextFormFeild(
      {super.key,
      this.contentPadding,
      this.enableBorder,
      this.foucedBorder,
      required this.hintText,
      this.hintTextStyle,
      this.suffixIcon,
      this.isObscure,
      this.backGroundColor,
      this.controller,
      required this.validator,
      this.keyboardType = TextInputType.name});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorsManager.mainYellow,
      controller: controller,
      style: TextStyle(color: Colors.white),
      keyboardType: keyboardType,
      decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: hintTextStyle ?? TextStyles.font14YellowMedium,
          focusedBorder: foucedBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1.3,
                  color: ColorsManager.mainYellow,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
          enabledBorder: enableBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1.3,
                  color: ColorsManager.greyLight,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.3),
            borderRadius: BorderRadius.circular(16.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.3),
            borderRadius: BorderRadius.circular(16.0),
          ),
          suffixIcon: suffixIcon,
          suffixIconColor: ColorsManager.mainYellow,
          fillColor: backGroundColor ?? ColorsManager.greyDark,
          filled: true),
      obscureText: isObscure ?? false,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
