import 'package:dartz/dartz.dart';
import 'package:digital_14_task/features/events/data/datasources/remote_events_datasource.dart';

class EventsRepository {
  final RemoteEventsDataSource remoteEventsDataSource;

  EventsRepository({required this.remoteEventsDataSource});

  Future<Either<Exception, GetEventsResponse>> getEvents() async {
    try {
      final response = await remoteEventsDataSource.getEvents();
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
