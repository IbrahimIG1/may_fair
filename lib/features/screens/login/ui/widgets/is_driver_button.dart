// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:may_fair/core/theme/color.dart';
import 'package:may_fair/core/theme/text_styles.dart';

class IsDriverButton extends StatelessWidget {
  final bool? clicked;
  final String txt;
  final Function onTap;
  const IsDriverButton({
    super.key,
    this.clicked,
    required this.txt,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
       clicked == false ? onTap() : ();
      },
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(Size.fromHeight(50.h)),
        // animationDuration: Duration(milliseconds: 1),
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        textStyle: WidgetStateProperty.all(TextStyles.font14YellowMedium),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          side: BorderSide(
              color: clicked == false ? Colors.white : ColorsManager.mainYellow,
              width: .5),
          borderRadius: BorderRadius.circular(16.0),
        )),
      ),
      child: Text(txt,
          style: clicked == false
              ? TextStyles.font14MediumWhite
              : TextStyles.font14YellowMedium),
    );
  }
}
