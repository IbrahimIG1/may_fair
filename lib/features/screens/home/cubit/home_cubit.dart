import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:may_fair/features/screens/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;
  List widgetOptions = [
    ChatsScreen(),
    UsersScreen(),
    MenuScreen(),
    MenuScreen(),
  ];
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void changeNavBarIcon(index) {
    print('clicked');
    selectedIndex = index;
    emit(NavBarChangeState());
  }
}

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Chats Page',
      style: TextStyle(color: Colors.white),
    ));
  }
}

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Users Page',
      style: TextStyle(color: Colors.white),
    ));
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
