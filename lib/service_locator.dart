import 'package:digital_14_task/core/constants.dart';
import 'package:digital_14_task/features/events/data/repositories/events_repository.dart';
import 'package:digital_14_task/features/events/presentation/cubit/event_details_cubit.dart';
import 'package:digital_14_task/features/events/presentation/cubit/events_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/events/data/datasources/remote_events_datasource.dart';

GetIt getIt = GetIt.instance;

Future<void> setup() async {
  //register Cubits
  getIt.registerFactory(() => EventsCubit(getIt()));
  getIt.registerFactory(() => EventDetailsCubit(getIt()));

  // register Repository
  getIt.registerLazySingleton<EventsRepository>(
    () => EventsRepositoryImpl(
      getIt(),
    ),
  );
  //register RemoteDataSources
  getIt.registerLazySingleton<RemoteEventsDataSource>(
    () => RemoteEventsDataSourceImpl(getIt()),
  );

  await _initDio();
}

Future<void> _initDio() async {
  var dio = Dio();
  dio.options.baseUrl = baseUrl;
  getIt.registerSingleton<Dio>(dio);
}
