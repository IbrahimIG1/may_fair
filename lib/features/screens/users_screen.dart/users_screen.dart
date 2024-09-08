import 'package:flutter/material.dart';
import 'package:may_fair/features/screens/users_screen.dart/ui/users_item_widget.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({super.key});
  final List<Map> usersData = [
    {
      'name': "ابراهيم",
      'status': true,
    },
    {
      'name': "أحمد",
      'status': false,
    },
    {
      'name': "عمرو",
      'status': true,
    },
    {
      'name': "ياسر",
      'status': true,
    },
    {
      'name': "محمد",
      'status': false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: usersData.length,
      itemBuilder: (context, index) {
        return UsersItemWidget(
            name: usersData[index]['name'],
            connect: usersData[index]['status']);
      },
    );
  }
}
