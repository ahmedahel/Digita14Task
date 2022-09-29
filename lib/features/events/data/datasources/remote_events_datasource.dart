import 'package:digital_14_task/core/constants.dart';
import 'package:dio/dio.dart';

import '../models/event_model.dart';

import '../models/get_events_response_model.dart';

abstract class RemoteEventsDataSource {
  Future<GetEventsResponse> getEvents(String query);
  Future<EventModel> getEventDetails(int eventId);
}

class RemoteEventsDataSourceImpl implements RemoteEventsDataSource {
  final Dio client;

  RemoteEventsDataSourceImpl(this.client);
  @override
  Future<EventModel> getEventDetails(int eventId) async {
    final url = '/2/events/$eventId?client_id=$clientId';

    final response = await client.get(url);
    return EventModel.fromJson(response.data);
  }

  @override
  Future<GetEventsResponse> getEvents(String query) async {
    String url = '/2/events?client_id=$clientId&per_page=10&page=1';

    if (query.isNotEmpty) {
      url += "&q=$query";
    }
    final response = await client.get(url);
    return GetEventsResponse.fromJson(response.data);
  }
}
