import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:may_fair/features/screens/admin_panal/cubit/admin_state.dart';
import 'package:may_fair/features/screens/chats_screen.dart/chats_screen.dart';
import 'package:may_fair/features/screens/driver_screen.dart/driver_screen.dart';
import 'package:may_fair/features/screens/users_screen.dart/users_screen.dart';
import 'package:may_fair/generated/l10n.dart';

class AdminCubit extends Cubit<HomeState> {
  AdminCubit() : super(HomeInitial());
  static AdminCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;
  List screensList = [
    ChatsScreen(),
    UsersScreen(),
    DriversScreen(),
    MenuScreen(),
  ];
  List titlesList = [
    S.current.chats,
    S.current.users,
    S.current.drivers,
    S.current.menu,
  ];
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void changeNavBarIcon(index) {
    print('clicked');
    selectedIndex = index;
    emit(NavBarChangeState());
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Menu Page',
      style: TextStyle(color: Colors.white),
    ));
  }
}
