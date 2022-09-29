import 'package:dartz/dartz.dart';
import 'package:digital_14_task/features/events/data/datasources/remote_events_datasource.dart';

import '../models/event_model.dart';
import '../models/get_events_response_model.dart';

abstract class EventsRepository {
  Future<Either<Exception, GetEventsResponse>> getEvents(String query);
  Future<Either<Exception, EventModel>> getEventDetails(int eventId);
}

class EventsRepositoryImpl extends EventsRepository {
  final RemoteEventsDataSource remoteEventsDataSource;
  EventsRepositoryImpl(this.remoteEventsDataSource);

  @override
  Future<Either<Exception, GetEventsResponse>> getEvents(String query) async {
    try {
      final response = await remoteEventsDataSource.getEvents(query);
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, EventModel>> getEventDetails(int eventId) async {
    try {
      final response = await remoteEventsDataSource.getEventDetails(eventId);
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
