import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/events_model.dart';

abstract class RemoteEventsDataSource {
  Future<GetEventsResponse> getEvents();
}

class RemoteEventsDataSourceImpl extends RemoteEventsDataSource {
  final Dio client;

  RemoteEventsDataSourceImpl(this.client);
  @override
  Future<GetEventsResponse> getEvents() async {
    const url =
        'https://api.seatgeek.com/2/events?client_id=MjkzODE1MzV8MTY2NDI5NzYzMy4zMDYwNTI0';

    final response = await client.get(url);
    return GetEventsResponse.fromJson(response.data);
  }
}
