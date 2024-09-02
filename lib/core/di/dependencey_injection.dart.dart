import 'package:get_it/get_it.dart';
import 'package:may_fair/core/helper/shared_prefrence.dart';
import 'package:may_fair/core/network_services/auth_services.dart';
import 'package:may_fair/core/network_services/firebase_services.dart';
import 'package:may_fair/core/repos/login_repo.dart';
import 'package:may_fair/features/screens/login/cubit/cubit/login_cubit.dart';


final getIt = GetIt.instance;
Future<void> setUp() async {
  //* initial SharedPrefHelper
  SharedPrefImpl.initSharedPreference().then((value) {
    print('init shared preference done');
  });
  //* initial Firebase
  final FirebaseFactory firebaseFactory = FirebaseFactoryImpl();
  firebaseFactory.initFirebase();

  //* get Shared Prefrence
  getIt.registerLazySingleton<SharedPrefImpl>(() => SharedPrefImpl());
  //* get Firebase Factory
  getIt.registerLazySingleton<FirebaseFactory>(() => FirebaseFactoryImpl());

  //* Network Services
  getIt.registerLazySingleton<AuthNetworkeServices>(
      () => AuthNetworkServicesImpl(getIt(),getIt()));
  //* Repo
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));

  //* Cubits
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
