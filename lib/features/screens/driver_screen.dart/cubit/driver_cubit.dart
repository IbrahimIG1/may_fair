import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:may_fair/core/models/driver_model.dart';
import 'package:may_fair/core/repos/driver_repo.dart';
import 'package:may_fair/features/screens/driver_screen.dart/cubit/driver_state.dart';

class DriverCubit extends Cubit<DriverState> {
  final DriverRepo driverRepo;
  DriverCubit(this.driverRepo) : super(DriverInitial());
  static DriverCubit get(context) => BlocProvider.of(context);

  void addDriver() {
    DriverModel driverModel = DriverModel(
        name: 'driver 1',
        experience: 5,
        license: 'license number',
        phone: '01021861291',
        email: 'driver@gmail.com');
    driverRepo.addDriver(driverModel.toMap()).then((value) {
      emit(AddDriverState());
    });
  }

  void getDrivers() {
    driverRepo.getAllDrivers().then((value) {
      print('getAllDrivers result is >>>> $value');
      emit(GetAllDriversState());
    });
  }
  // void getDriverById() {
  //   driverRepo.getDriver();
  // }
}
