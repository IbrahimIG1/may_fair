import 'package:flutter/material.dart';
import 'package:may_fair/core/helper/spacer_helper.dart';
import 'package:may_fair/core/theme/color.dart';
import 'package:may_fair/core/theme/text_styles.dart';
import 'package:may_fair/core/widgets/app_text_feild.dart';
import 'package:may_fair/generated/l10n.dart';

Future showDialogWidget(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: ColorsManager.greyDark,
      title: Text(
        S.current.login,
        style: TextStyles.font14MediumWhite,
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            AppTextFormFeild(
                hintText: S.current.user_name, validator: (value) {}),
            verticalSpace(20),
            AppTextFormFeild(
                hintText: S.current.password, validator: (value) {})
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            side: WidgetStateProperty.all(
              BorderSide(color: ColorsManager.mainYellow),
            ),
          ),
          child: Text(
            S.current.cancle,
            style: TextStyles.font14YellowMedium,
          ),
          onPressed: () {
            // Implement your login logic here
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          style: ButtonStyle(
            side: WidgetStateProperty.all(
              BorderSide(color: ColorsManager.mainYellow),
            ),
          ),
          child: Text(
            S.current.new_driver,
            style: TextStyles.font14YellowMedium,
          ),
          onPressed: () {
            // Implement your login logic here
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}
