import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:may_fair/core/theme/color.dart';
import 'package:may_fair/features/screens/admin_panal/cubit/admin_cubit.dart';
import 'package:may_fair/features/screens/admin_panal/cubit/admin_state.dart';
import 'package:may_fair/features/screens/admin_panal/ui/widgets/add_dialog.dart';
import 'package:may_fair/features/screens/admin_panal/ui/widgets/bottom_nav_bar.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        AdminCubit homeCubit = AdminCubit.get(context);
        // DriverCubit driverCubit = DriverCubit.get(context);
        return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
                title: Text(
              homeCubit.titlesList.elementAt(homeCubit.selectedIndex),
            )),
            body: Center(
              child: homeCubit.screensList.elementAt(homeCubit.selectedIndex),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialogWidget(context);
              },
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add,
                color: ColorsManager.mainYellow,
                size: 35,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomNavBarWidget(
                selectedIndex: homeCubit.selectedIndex,
                onTap: (index) {
                  homeCubit.changeNavBarIcon(index);
                }));
      },
    );
  }
}
