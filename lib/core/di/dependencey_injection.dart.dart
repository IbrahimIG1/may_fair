import 'package:get_it/get_it.dart';
import 'package:may_fair/core/network_services/auth_services.dart';
import 'package:may_fair/core/network_services/firebase_services.dart';
import 'package:may_fair/core/repos/login_repo.dart';
import 'package:may_fair/features/screens/login/cubit/cubit/login_cubit.dart';


final getIt = GetIt.instance;
Future<void> setUp() async {
  //* initial Firebase
  final FirebaseFactory firebaseFactory = FirebaseFactoryImpl();
  firebaseFactory.initFirebase();
  //* get Firebase Factory
  getIt.registerLazySingleton<FirebaseFactory>(() => FirebaseFactoryImpl());

  //* Network Services
  getIt.registerLazySingleton<AuthNetworkeServices>(
      () => AuthNetworkServicesImpl(getIt()));
  //* Repo
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));

  //* Cubits
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
