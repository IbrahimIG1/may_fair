import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:may_fair/core/theme/color.dart';
import 'package:may_fair/features/screens/home/cubit/home_cubit.dart';
import 'package:may_fair/features/screens/home/cubit/home_state.dart';
import 'package:may_fair/features/screens/home/ui/widgets/add_dialog.dart';
import 'package:may_fair/features/screens/home/ui/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit homeCubit = HomeCubit.get(context);
        return Scaffold(
            body: Center(
              child: homeCubit.widgetOptions.elementAt(homeCubit.selectedIndex),
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
