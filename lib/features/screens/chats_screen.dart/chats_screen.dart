import 'package:flutter/material.dart';
import 'package:may_fair/features/screens/chats_screen.dart/ui/chat_item_widget.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> usersData = [
      {
        'user_name': "ابراهيم",
        'driver_name': "مصطفي",
      },
      {
        'user_name': "أحمد",
        'driver_name': "سيد",
      },
      {
        'user_name': "منى",
        'driver_name': "ياسر",
      },
      {
        'user_name': "عبدالله",
        'driver_name': "محسن",
      },
      {
        'user_name': "خالد",
        'driver_name': "توفيق",
      },
    ];
    return ListView.builder(
      itemCount: usersData.length,
      itemBuilder: (context, index) {
        return ChatItemWidget(
            userName: usersData[index]['user_name'],
            driverName: usersData[index]['driver_name']);
      },
    );
  }
}
