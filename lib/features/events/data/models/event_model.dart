class EventModel {
  EventModel({
    required this.type,
    required this.id,
    required this.datetimeUtc,
    required this.datetimeTbd,
    required this.isOpen,
    required this.links,
    required this.datetimeLocal,
    required this.timeTbd,
    required this.shortTitle,
    required this.visibleUntilUtc,
    required this.url,
    required this.score,
    required this.announceDate,
    required this.createdAt,
    required this.dateTbd,
    required this.title,
    required this.popularity,
    required this.description,
    required this.status,
    required this.accessMethod,
    required this.eventPromotion,
    required this.conditional,
    required this.enddatetimeUtc,
    required this.themes,
    required this.domainInformation,
    required this.generalAdmission,
  });

  String type;
  int id;
  DateTime datetimeUtc;
  bool datetimeTbd;
  bool isOpen;
  List<dynamic> links;
  DateTime datetimeLocal;
  bool timeTbd;
  String shortTitle;
  DateTime visibleUntilUtc;
  String url;
  double score;
  DateTime announceDate;
  DateTime createdAt;
  bool dateTbd;
  String title;
  double popularity;
  String description;
  String status;
  dynamic accessMethod;
  dynamic eventPromotion;
  bool conditional;
  dynamic enddatetimeUtc;
  List<dynamic> themes;
  List<dynamic> domainInformation;
  bool? generalAdmission;
  bool isAddToFav = false;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        type: json["type"],
        id: json["id"],
        datetimeUtc: DateTime.parse(json["datetime_utc"]),
        datetimeTbd: json["datetime_tbd"],
        isOpen: json["is_open"],
        links: List<dynamic>.from(json["links"].map((x) => x)),
        datetimeLocal: DateTime.parse(json["datetime_local"]),
        timeTbd: json["time_tbd"],
        shortTitle: json["short_title"],
        visibleUntilUtc: DateTime.parse(json["visible_until_utc"]),
        url: json["url"],
        score: json["score"].toDouble(),
        announceDate: DateTime.parse(json["announce_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        dateTbd: json["date_tbd"],
        title: json["title"],
        popularity: json["popularity"].toDouble(),
        description: json["description"],
        status: json["status"],
        accessMethod: json["access_method"],
        eventPromotion: json["event_promotion"],
        conditional: json["conditional"],
        enddatetimeUtc: json["enddatetime_utc"],
        themes: List<dynamic>.from(json["themes"].map((x) => x)),
        domainInformation:
            List<dynamic>.from(json["domain_information"].map((x) => x)),
        generalAdmission: json["general_admission"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "datetime_utc": datetimeUtc.toIso8601String(),
        "datetime_tbd": datetimeTbd,
        "is_open": isOpen,
        "links": List<dynamic>.from(links.map((x) => x)),
        "datetime_local": datetimeLocal.toIso8601String(),
        "time_tbd": timeTbd,
        "short_title": shortTitle,
        "visible_until_utc": visibleUntilUtc.toIso8601String(),
        "url": url,
        "score": score,
        "announce_date": announceDate.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "date_tbd": dateTbd,
        "title": title,
        "popularity": popularity,
        "description": description,
        "status": status,
        "access_method": accessMethod,
        "event_promotion": eventPromotion,
        "conditional": conditional,
        "enddatetime_utc": enddatetimeUtc,
        "themes": List<dynamic>.from(themes.map((x) => x)),
        "domain_information":
            List<dynamic>.from(domainInformation.map((x) => x)),
        "general_admission": generalAdmission == null ? null : generalAdmission,
      };
}
