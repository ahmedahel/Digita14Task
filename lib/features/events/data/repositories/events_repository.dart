import 'package:dartz/dartz.dart';
import 'package:digital_14_task/features/events/data/datasources/remote_events_datasource.dart';

import '../models/events_model.dart';

abstract class EventsRepository {
  Future<Either<Exception, GetEventsResponse>> getEvents();
}

class EventsRepositoryImpl extends EventsRepository {
  final RemoteEventsDataSource _remoteEventsDataSource;

  EventsRepositoryImpl(this._remoteEventsDataSource);
  @override
  Future<Either<Exception, GetEventsResponse>> getEvents() async {
    try {
      final response = await _remoteEventsDataSource.getEvents();
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
