import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:may_fair/core/helper/spacer_helper.dart';
import 'package:may_fair/core/theme/color.dart';

class AppTextButton extends StatelessWidget {
  final Color? backgroundColor;
  final TextStyle textStyle;
  final IconData? iconData;
  final double? borderRaduis;
  final Color? borderColor;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? horizontalPadding;
  final double? verticalPadding;
  final String text;
  final bool? clicked;
  final VoidCallback onpressed;

  const AppTextButton(
      {super.key,
      this.backgroundColor,
      required this.textStyle,
      this.buttonHeight,
      this.buttonWidth,
      required this.text,
      required this.onpressed,
      this.horizontalPadding,
      this.verticalPadding,
      this.borderRaduis,
      this.iconData,
      this.borderColor,
      this.clicked});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          animationDuration: Duration(seconds: 2),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? Colors.white, width: .5),
            borderRadius: BorderRadius.circular(borderRaduis ?? 16.0),
          )),
          backgroundColor: WidgetStateProperty.all(
              backgroundColor ?? ColorsManager.mainBlue),
          // textStyle: MaterialStateProperty.all(textStyle),
          fixedSize: WidgetStateProperty.all(
            Size(buttonWidth?.w ?? double.maxFinite, buttonHeight?.h ?? 50.h),
          ),
          padding: WidgetStateProperty.all(EdgeInsets.symmetric(
              horizontal: horizontalPadding?.w ?? 12.w,
              vertical: verticalPadding?.h ?? 14.h))),
      onPressed: onpressed,
      child: iconData == null
          ? Text(text, style: textStyle)
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  color: Colors.white,
                  size: 20.w,
                ),
                horizontalSpace(10),
                Text(text, style: textStyle)
              ],
            ),
    );
  }
}
