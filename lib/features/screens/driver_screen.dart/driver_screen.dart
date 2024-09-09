import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:may_fair/core/di/dependencey_injection.dart.dart';
import 'package:may_fair/features/screens/driver_screen.dart/cubit/driver_cubit.dart';
import 'package:may_fair/features/screens/driver_screen.dart/cubit/driver_state.dart';
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
    return BlocProvider(
      create: (context) => getIt<DriverCubit>(),
      child: BlocConsumer<DriverCubit, DriverState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          DriverCubit driverCubit = DriverCubit.get(context);
          return ListView.builder(
            itemCount: usersData.length,
            itemBuilder: (context, index) {
              return DriverItemWidget(
                  onTap: () {
                    print('clicked');
                    driverCubit.getDrivers();
                  },
                  image: usersData[index]['image'],
                  name: usersData[index]['name'],
                  connect: usersData[index]['status']);
            },
          );
        },
      ),
    );
  }
}
