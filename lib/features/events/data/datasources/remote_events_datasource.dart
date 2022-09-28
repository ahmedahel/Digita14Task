import 'package:dio/dio.dart';

import '../models/events_model.dart';

class RemoteEventsDataSource {
  final Dio client = Dio();

  RemoteEventsDataSource();

  Future<GetEventsResponse> getEvents() async {
    const url =
        'https://api.seatgeek.com/2/events?client_id=MjkzODE1MzV8MTY2NDI5NzYzMy4zMDYwNTI0';

    final response = await client.get(url);
    return GetEventsResponse.fromJson(response.data);
  }
}
