import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/event_model.dart';
import '../models/get_events_response_model.dart';

class RemoteEventsDataSource {
  final Dio client = Dio();

  RemoteEventsDataSource();

  Future<EventModel> getEventDetails(int eventId) async {
    final url =
        'https://api.seatgeek.com/2/events/$eventId?client_id=MjkzODE1MzV8MTY2NDI5NzYzMy4zMDYwNTI0';

    final response = await client.get(url);
    return EventModel.fromJson(response.data);
  }

  Future<GetEventsResponse> getEvents(String query) async {
    String url =
        'https://api.seatgeek.com/2/events?client_id=MjkzODE1MzV8MTY2NDI5NzYzMy4zMDYwNTI0';

    if (query.isNotEmpty) {
      url += "&q=$query";
    }
    debugPrint("Url :$url");

    final response = await client.get(url);
    return GetEventsResponse.fromJson(response.data);
  }
}
