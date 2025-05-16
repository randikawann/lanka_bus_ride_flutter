import 'package:get_it/get_it.dart';
import 'package:lanka_bus_ride_flutter/data/repositories/user_repository_impl.dart';
import 'package:lanka_bus_ride_flutter/domain/repositories/user_repository.dart';
import 'package:lanka_bus_ride_flutter/domain/usecases/get_user.dart';

import 'data/repositories/bus_repository_impl.dart';
import 'data/data_sources/api_service.dart';
import 'domain/repositories/bus_repository.dart';
import 'domain/usecases/get_buses.dart';
import 'presentation/blocs/bus_bloc.dart';
import 'presentation/blocs/user_bloc.dart';

final sl = GetIt.instance;

void init() {
  // BLoC
  sl.registerFactory(() => BusBloc(sl()));
  sl.registerFactory(() => UserBloc(sl()));

  // Use Case
  sl.registerLazySingleton(() => GetBuses(sl()));
  sl.registerLazySingleton(() => GetUser(sl()));

  // Repository
  sl.registerLazySingleton<BusRepository>(() => BusRepositoryImpl(sl()));
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));

  // Data source
  sl.registerLazySingleton<ApiService>(() => ApiServiceImpl());
}