import 'package:flutter/material.dart';
import 'package:may_fair/core/theme/color.dart';
import 'package:may_fair/core/theme/text_styles.dart';
import 'package:may_fair/generated/l10n.dart';

class NotHaveAccount extends StatelessWidget {
  final Function? onTap;
  const NotHaveAccount({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          onTap!();
        },
        child: RichText(
          text: TextSpan(
            text: S.current.not_have_account,
            style: TextStyles.font14MediumWhite,
            children: <TextSpan>[
              TextSpan(
                text: S.current.register,
                style: const TextStyle(
                  color: ColorsManager.mainBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
