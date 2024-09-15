import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:may_fair/core/di/dependencey_injection.dart.dart';
import 'package:may_fair/core/helper/extensions.dart';
import 'package:may_fair/core/theme/text_styles.dart';
import 'package:may_fair/features/screens/driver_screen.dart/cubit/driver_cubit.dart';
import 'package:may_fair/features/screens/driver_screen.dart/cubit/driver_state.dart';
import 'package:may_fair/features/screens/driver_screen.dart/ui/widgets/driver_item_widget.dart';
import 'package:may_fair/generated/l10n.dart';

class DriversScreen extends StatelessWidget {
  const DriversScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DriverCubit>()..getDrivers(),
      child: BlocConsumer<DriverCubit, DriverState>(
        listener: (context, state) {},
        builder: (context, state) {
          DriverCubit driverCubit = DriverCubit.get(context);
          if (state is LoadingDriversState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetAllDriversSuccessState) {
            final drivers = state.data;
            return RefreshIndicator(
              onRefresh: () {
                return driverCubit.getDrivers();
              },
              child: ListView.builder(
                itemCount: drivers.length,
                itemBuilder: (context, index) {
                  if (drivers.isNullOrEmpty()) {
                    return Center(
                      child: Text(
                        S.current.no_drivers_yet,
                        style: TextStyles.font14BoldBlack,
                      ),
                    );
                  } else {
                    return DriverItemWidget(
                      onTap: () {
                        print('clicked');
                        // driverCubit.getDrivers();
                      },
                      name: drivers[index].name,
                      connect: drivers[index].status,
                    );
                  }
                },
              ),
            );
          } else {
            return Center(
              child: Text(S.current.error_unknown),
            );
          }
        },
      ),
    );
  }
}
