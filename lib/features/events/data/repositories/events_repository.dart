import 'package:dartz/dartz.dart';
import 'package:digital_14_task/features/events/data/datasources/remote_events_datasource.dart';

import '../models/event_model.dart';
import '../models/get_events_response_model.dart';

class EventsRepository {
  final RemoteEventsDataSource remoteEventsDataSource;

  EventsRepository({required this.remoteEventsDataSource});

  

  Future<Either<Exception, GetEventsResponse>> getEvents(String query) async {
    try {
      final response = await remoteEventsDataSource.getEvents(query);
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, EventModel>> getEventDetails(int eventId) async {
    try {
      final response = await remoteEventsDataSource.getEventDetails(eventId);
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
