import 'package:flutter/material.dart';
import 'package:may_fair/features/screens/driver_screen.dart/ui/widgets/driver_item_widget.dart';

class DriversScreen extends StatelessWidget {
  DriversScreen({super.key});
  final List<Map> usersData = [
    {
      'name': "Mustafa",
      'image': "assets/images/car.png",
      'status': true,
    },
    {
      'name': "Yasser",
      'image': "assets/images/car.png",
      'status': false,
    },
    {
      'name': "Nagy",
      'image': "assets/images/car.png",
      'status': true,
    },
    {
      'name': "Tawfeek",
      'status': true,
      'image': "assets/images/car.png",
    },
    {
      'name': "Abdallah",
      'image': "assets/images/car.png",
      'status': false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: usersData.length,
      itemBuilder: (context, index) {
        return DriverItemWidget(
            image: usersData[index]['image'],
            name: usersData[index]['name'],
            connect: usersData[index]['status']);
      },
    );
  }
}
