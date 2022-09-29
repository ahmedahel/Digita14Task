import 'package:equatable/equatable.dart';

import '../../../../main.dart';

class EventModel extends Equatable {
  EventModel({
    required this.type,
    required this.id,
    required this.datetimeUtc,
    required this.shortTitle,
    required this.title,
  });

  String type;
  int id;
  DateTime datetimeUtc;
  String shortTitle;
  String title;

  bool get isAddToFav =>
      box.read(id.toString()) != null && box.read(id.toString());
  set isAddToFav(bool val) => box.write(id.toString(), val);

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        type: json["type"],
        id: json["id"],
        datetimeUtc: DateTime.parse(json["datetime_utc"]),
        shortTitle: json["short_title"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "datetime_utc": datetimeUtc.toIso8601String(),
        "short_title": shortTitle,
        "title": title,
      };

  @override
  List<Object?> get props => [id];
}
