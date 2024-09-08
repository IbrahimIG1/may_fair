import 'package:flutter/material.dart';
import 'package:may_fair/core/helper/spacer_helper.dart';
import 'package:may_fair/core/theme/text_styles.dart';
import 'package:may_fair/features/screens/chats_screen.dart/ui/chat_person_image.dart';
import 'package:may_fair/generated/l10n.dart';

class ChatItemWidget extends StatelessWidget {
  final String userName;
  final String driverName;
  const ChatItemWidget(
      {super.key, required this.userName, required this.driverName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            color: Colors.white),
        width: double.infinity,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  ChatPersonImage(raduis: 70, image: 'assets/images/logo.png'),
                  // ChatPersonImage(raduis: 50, image: 'assets/images/car2.png')
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${S.current.customer}: $userName",
                  style: TextStyles.font14LightBlack,
                ),
                verticalSpace(5),
                Text(
                  "${S.current.driver}: $driverName",
                  style: TextStyles.font14LightBlack,
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
