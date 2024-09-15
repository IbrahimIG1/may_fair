import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:may_fair/core/helper/spacer_helper.dart';
import 'package:may_fair/core/theme/text_styles.dart';
import 'package:may_fair/generated/l10n.dart';

class DriverItemWidget extends StatelessWidget {
  final String name;
  final bool connect;
  final Function onTap;
  const DriverItemWidget(
      {super.key,
      required this.name,
      required this.connect,
 required this.onTap});

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
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:AssetImage('assets/images/car.png'), fit: BoxFit.fill),
                  ),
                )),
            Text(
              name,
              style: TextStyles.font14BoldBlack,
            ),
            const Spacer(),
            Text(connect == true
                ? S.current.connected
                : S.current.dis_connected),
            horizontalSpace(10),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  onTap();
                },
                child: CircleAvatar(
                  backgroundColor: connect == true ? Colors.green : Colors.red,
                  radius: 10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
