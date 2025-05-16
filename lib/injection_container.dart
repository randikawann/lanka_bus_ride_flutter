import 'package:get_it/get_it.dart';

import 'data/repositories/bus_repository_impl.dart';
import 'data/data_sources/api_service.dart';
import 'domain/repositories/bus_repository.dart';
import 'domain/usecases/get_buses.dart';
import 'presentation/blocs/bus_bloc.dart';

final sl = GetIt.instance;

void init() {
  // BLoC
  sl.registerFactory(() => BusBloc(sl()));

  // Use Case
  sl.registerLazySingleton(() => GetBuses(sl()));

  // Repository
  sl.registerLazySingleton<BusRepository>(() => BusRepositoryImpl(sl()));

  // Data source
  sl.registerLazySingleton<ApiService>(() => ApiServiceImpl());
}