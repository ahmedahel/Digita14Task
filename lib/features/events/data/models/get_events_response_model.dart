import 'package:digital_14_task/features/events/data/models/event_model.dart';
import 'package:digital_14_task/features/events/data/models/meta_model.dart';

class GetEventsResponse {
  GetEventsResponse({
    required this.events,
    required this.meta,
  });

  List<EventModel> events;
  Meta meta;

  factory GetEventsResponse.fromJson(Map<String, dynamic> json) =>
      GetEventsResponse(
        events: List<EventModel>.from(
            json["events"].map((x) => EventModel.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}


