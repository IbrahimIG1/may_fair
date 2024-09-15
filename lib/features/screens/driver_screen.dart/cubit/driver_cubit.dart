import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:may_fair/core/models/user_model.dart';
import 'package:may_fair/core/repos/driver_repo.dart';
import 'package:may_fair/features/screens/driver_screen.dart/cubit/driver_state.dart';

class DriverCubit extends Cubit<DriverState> {
  final DriverRepo driverRepo;
  DriverCubit(this.driverRepo) : super(DriverInitial());
  static DriverCubit get(context) => BlocProvider.of(context);

  void addDriver({required UserModel driverModel}) {
    emit(LoadingDriversState());
    // DriverModel driverModel = DriverModel(
    //     name: 'driver 1',
    //     experience: 5,
    //     license: 'license number',
    //     phone: '01021861291',
    //     status: true,
    //     email: 'driver@gmail.com');
    driverRepo.addDriver(driverModel.toMap()).then((value) {
      emit(AddDriverState());
    });
  }

  List<UserModel>? drivers;
  List<UserModel>? driversStream;
  Future<void> getDrivers() async {
    drivers = [];
    emit(LoadingDriversState());
    final response = await driverRepo.getAllDrivers();
    response.when(success: (data) {
      for (var doc in data.docs) {
        drivers!.add(UserModel.fromMap(doc.data()));
      }
      emit(GetAllDriversSuccessState(drivers ?? []));
    }, failure: (error) {
      emit(GetAllDriversErrorState(error));
    });
  }

  // Stream<List<DriverModel>> getDriversStream() async* {
  //   driversStream = [];
  //   emit(LoadingDriversState());

  //  driverRepo.streamGetAllDrivers().listen((response) {
  //     response.when(success: (data) {
  //       data.docs.map((element) {
  //         driversStream!.add(DriverModel.fromMap(element.data()));
  //         // DriverModel.fromMap(element.data());
  //       });
  //       emit(GetAllDriversSuccessState(driversStream ?? []));
  //     }, failure: (error) {
  //       emit(GetAllDriversErrorState(error));
  //     });
  //   });
  // }
}
