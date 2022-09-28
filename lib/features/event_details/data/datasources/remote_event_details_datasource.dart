import 'package:dio/dio.dart';

class RemoteEventDetailsDataSource {
  final Dio client = Dio();

  RemoteEventDetailsDataSource();

  Future<GetEventsResponse> getEventDetails(int eventId) async {
    const url =
        'https://api.seatgeek.com/2/events/$eventId?client_id=MjkzODE1MzV8MTY2NDI5NzYzMy4zMDYwNTI0';

    final response = await client.get(url);
    return GetEventsResponse.fromJson(response.data);
  }
}
