import 'package:flutter/material.dart';
import 'package:may_fair/core/theme/text_styles.dart';
import 'package:may_fair/generated/l10n.dart';

class OrSignWithText extends StatelessWidget {
  const OrSignWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            S.current.or_login_with,
            style: TextStyles.font14MediumWhite,
          ),
        ),
        const Expanded(child: Divider(thickness: 1)),
      ],
    );
  }
}
