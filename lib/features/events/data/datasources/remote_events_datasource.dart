import 'package:dartz/dartz.dart';

import '../models/events_model.dart';

abstract class RemoteEventsDataSource {
  Future<Either<Exception, GetEventsResponse>> getEvents();
}

class RemoteEventsDataSourceImpl extends RemoteEventsDataSource {
  @override
  Future<Either<Exception, GetEventsResponse>> getEvents() {
    throw UnimplementedError();
  }
}
