class GetEventsResponse {
  GetEventsResponse({
    required this.events,
    required this.meta,
  });

  List<Event> events;
  Meta meta;

  factory GetEventsResponse.fromJson(Map<String, dynamic> json) =>
      GetEventsResponse(
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Event {
  Event({
    required this.type,
    required this.id,
    required this.datetimeUtc,
    required this.venue,
    required this.datetimeTbd,
    required this.performers,
    required this.isOpen,
    required this.links,
    required this.datetimeLocal,
    required this.timeTbd,
    required this.shortTitle,
    required this.visibleUntilUtc,
    required this.stats,
    required this.taxonomies,
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
    required this.announcements,
    required this.conditional,
    required this.enddatetimeUtc,
    required this.themes,
    required this.domainInformation,
    required this.generalAdmission,
  });

  String type;
  int id;
  DateTime datetimeUtc;
  Venue venue;
  bool datetimeTbd;
  List<Performer> performers;
  bool isOpen;
  List<dynamic> links;
  DateTime datetimeLocal;
  bool timeTbd;
  String shortTitle;
  DateTime visibleUntilUtc;
  EventStats stats;
  List<Taxonomy> taxonomies;
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
  Announcements announcements;
  bool conditional;
  dynamic enddatetimeUtc;
  List<dynamic> themes;
  List<dynamic> domainInformation;
  bool generalAdmission;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        type: json["type"],
        id: json["id"],
        datetimeUtc: DateTime.parse(json["datetime_utc"]),
        venue: Venue.fromJson(json["venue"]),
        datetimeTbd: json["datetime_tbd"],
        performers: List<Performer>.from(
            json["performers"].map((x) => Performer.fromJson(x))),
        isOpen: json["is_open"],
        links: List<dynamic>.from(json["links"].map((x) => x)),
        datetimeLocal: DateTime.parse(json["datetime_local"]),
        timeTbd: json["time_tbd"],
        shortTitle: json["short_title"],
        visibleUntilUtc: DateTime.parse(json["visible_until_utc"]),
        stats: EventStats.fromJson(json["stats"]),
        taxonomies: List<Taxonomy>.from(
            json["taxonomies"].map((x) => Taxonomy.fromJson(x))),
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
        announcements: Announcements.fromJson(json["announcements"]),
        conditional: json["conditional"],
        enddatetimeUtc: json["enddatetime_utc"],
        themes: List<dynamic>.from(json["themes"].map((x) => x)),
        domainInformation:
            List<dynamic>.from(json["domain_information"].map((x) => x)),
        generalAdmission: json["general_admission"] == null
            ? null
            : json["general_admission"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "datetime_utc": datetimeUtc.toIso8601String(),
        "venue": venue.toJson(),
        "datetime_tbd": datetimeTbd,
        "performers": List<dynamic>.from(performers.map((x) => x.toJson())),
        "is_open": isOpen,
        "links": List<dynamic>.from(links.map((x) => x)),
        "datetime_local": datetimeLocal.toIso8601String(),
        "time_tbd": timeTbd,
        "short_title": shortTitle,
        "visible_until_utc": visibleUntilUtc.toIso8601String(),
        "stats": stats.toJson(),
        "taxonomies": List<dynamic>.from(taxonomies.map((x) => x.toJson())),
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
        "announcements": announcements.toJson(),
        "conditional": conditional,
        "enddatetime_utc": enddatetimeUtc,
        "themes": List<dynamic>.from(themes.map((x) => x)),
        "domain_information":
            List<dynamic>.from(domainInformation.map((x) => x)),
        "general_admission": generalAdmission == null ? null : generalAdmission,
      };
}

class Announcements {
  Announcements();

  factory Announcements.fromJson(Map<String, dynamic> json) => Announcements();

  Map<String, dynamic> toJson() => {};
}

class Performer {
  Performer({
    required this.type,
    required this.name,
    required this.image,
    required this.id,
    required this.images,
    required this.divisions,
    required this.hasUpcomingEvents,
    required this.primary,
    required this.stats,
    required this.taxonomies,
    required this.imageAttribution,
    required this.url,
    required this.score,
    required this.slug,
    required this.homeVenueId,
    required this.shortName,
    required this.numUpcomingEvents,
    required this.colors,
    required this.imageLicense,
    required this.genres,
    required this.popularity,
    required this.location,
    required this.imageRightsMessage,
  });

  String type;
  String name;
  String image;
  int id;
  PerformerImages images;
  dynamic divisions;
  bool hasUpcomingEvents;
  bool primary;
  PerformerStats stats;
  List<Taxonomy> taxonomies;
  String imageAttribution;
  String url;
  double score;
  String slug;
  dynamic homeVenueId;
  String shortName;
  int numUpcomingEvents;
  dynamic colors;
  String imageLicense;
  List<Genre> genres;
  int popularity;
  dynamic location;
  String imageRightsMessage;

  factory Performer.fromJson(Map<String, dynamic> json) => Performer(
        type: json["type"],
        name: json["name"],
        image: json["image"],
        id: json["id"],
        images: PerformerImages.fromJson(json["images"]),
        divisions: json["divisions"],
        hasUpcomingEvents: json["has_upcoming_events"],
        primary: json["primary"],
        stats: PerformerStats.fromJson(json["stats"]),
        taxonomies: List<Taxonomy>.from(
            json["taxonomies"].map((x) => Taxonomy.fromJson(x))),
        imageAttribution: json["image_attribution"],
        url: json["url"],
        score: json["score"].toDouble(),
        slug: json["slug"],
        homeVenueId: json["home_venue_id"],
        shortName: json["short_name"],
        numUpcomingEvents: json["num_upcoming_events"],
        colors: json["colors"],
        imageLicense: json["image_license"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        popularity: json["popularity"],
        location: json["location"],
        imageRightsMessage: json["image_rights_message"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "image": image,
        "id": id,
        "images": images.toJson(),
        "divisions": divisions,
        "has_upcoming_events": hasUpcomingEvents,
        "primary": primary,
        "stats": stats.toJson(),
        "taxonomies": List<dynamic>.from(taxonomies.map((x) => x.toJson())),
        "image_attribution": imageAttribution,
        "url": url,
        "score": score,
        "slug": slug,
        "home_venue_id": homeVenueId,
        "short_name": shortName,
        "num_upcoming_events": numUpcomingEvents,
        "colors": colors,
        "image_license": imageLicense,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "popularity": popularity,
        "location": location,
        "image_rights_message": imageRightsMessage,
      };
}

class Genre {
  Genre({
    required this.id,
    required this.name,
    required this.slug,
    required this.primary,
    required this.images,
    required this.image,
    required this.documentSource,
  });

  int id;
  String name;
  String slug;
  bool primary;
  GenreImages images;
  String image;
  DocumentSource documentSource;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        primary: json["primary"],
        images: GenreImages.fromJson(json["images"]),
        image: json["image"],
        documentSource: DocumentSource.fromJson(json["document_source"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "primary": primary,
        "images": images.toJson(),
        "image": image,
        "document_source": documentSource.toJson(),
      };
}

class DocumentSource {
  DocumentSource({
    required this.sourceType,
    required this.generationType,
  });

  String sourceType;
  String generationType;

  factory DocumentSource.fromJson(Map<String, dynamic> json) => DocumentSource(
        sourceType: json["source_type"],
        generationType: json["generation_type"],
      );

  Map<String, dynamic> toJson() => {
        "source_type": sourceType,
        "generation_type": generationType,
      };
}

class GenreImages {
  GenreImages({
    required this.the1200X525,
    required this.the1200X627,
    required this.the136X136,
    required this.the500700,
    required this.the800X320,
    required this.banner,
    required this.block,
    required this.criteo130160,
    required this.criteo170235,
    required this.criteo205100,
    required this.criteo400300,
    required this.fb100X72,
    required this.fb600315,
    required this.huge,
    required this.ipadEventModal,
    required this.ipadHeader,
    required this.ipadMiniExplore,
    required this.mongo,
    required this.squareMid,
    required this.triggitFbAd,
  });

  String the1200X525;
  String the1200X627;
  String the136X136;
  String the500700;
  String the800X320;
  String banner;
  String block;
  String criteo130160;
  String criteo170235;
  String criteo205100;
  String criteo400300;
  String fb100X72;
  String fb600315;
  String huge;
  String ipadEventModal;
  String ipadHeader;
  String ipadMiniExplore;
  String mongo;
  String squareMid;
  String triggitFbAd;

  factory GenreImages.fromJson(Map<String, dynamic> json) => GenreImages(
        the1200X525: json["1200x525"],
        the1200X627: json["1200x627"],
        the136X136: json["136x136"],
        the500700: json["500_700"],
        the800X320: json["800x320"],
        banner: json["banner"],
        block: json["block"],
        criteo130160: json["criteo_130_160"],
        criteo170235: json["criteo_170_235"],
        criteo205100: json["criteo_205_100"],
        criteo400300: json["criteo_400_300"],
        fb100X72: json["fb_100x72"],
        fb600315: json["fb_600_315"],
        huge: json["huge"],
        ipadEventModal: json["ipad_event_modal"],
        ipadHeader: json["ipad_header"],
        ipadMiniExplore: json["ipad_mini_explore"],
        mongo: json["mongo"],
        squareMid: json["square_mid"],
        triggitFbAd: json["triggit_fb_ad"],
      );

  Map<String, dynamic> toJson() => {
        "1200x525": the1200X525,
        "1200x627": the1200X627,
        "136x136": the136X136,
        "500_700": the500700,
        "800x320": the800X320,
        "banner": banner,
        "block": block,
        "criteo_130_160": criteo130160,
        "criteo_170_235": criteo170235,
        "criteo_205_100": criteo205100,
        "criteo_400_300": criteo400300,
        "fb_100x72": fb100X72,
        "fb_600_315": fb600315,
        "huge": huge,
        "ipad_event_modal": ipadEventModal,
        "ipad_header": ipadHeader,
        "ipad_mini_explore": ipadMiniExplore,
        "mongo": mongo,
        "square_mid": squareMid,
        "triggit_fb_ad": triggitFbAd,
      };
}

class PerformerImages {
  PerformerImages({
    required this.huge,
  });

  String huge;

  factory PerformerImages.fromJson(Map<String, dynamic> json) =>
      PerformerImages(
        huge: json["huge"],
      );

  Map<String, dynamic> toJson() => {
        "huge": huge,
      };
}

class PerformerStats {
  PerformerStats({
    required this.eventCount,
  });

  int eventCount;

  factory PerformerStats.fromJson(Map<String, dynamic> json) => PerformerStats(
        eventCount: json["event_count"],
      );

  Map<String, dynamic> toJson() => {
        "event_count": eventCount,
      };
}

class Taxonomy {
  Taxonomy({
    required this.id,
    required this.name,
    required this.parentId,
    required this.documentSource,
    required this.rank,
  });

  int id;
  String name;
  dynamic parentId;
  DocumentSource? documentSource;
  int rank;

  factory Taxonomy.fromJson(Map<String, dynamic> json) => Taxonomy(
        id: json["id"],
        name: json["name"],
        parentId: json["parent_id"],
        documentSource: json["document_source"] == null
            ? null
            : DocumentSource.fromJson(json["document_source"]),
        rank: json["rank"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent_id": parentId,
        "document_source": documentSource?.toJson(),
        "rank": rank,
      };
}

class EventStats {
  EventStats({
    required this.listingCount,
    required this.averagePrice,
    required this.lowestPriceGoodDeals,
    required this.lowestPrice,
    required this.highestPrice,
    required this.visibleListingCount,
    required this.dqBucketCounts,
    required this.medianPrice,
    required this.lowestSgBasePrice,
    required this.lowestSgBasePriceGoodDeals,
  });

  int listingCount;
  int averagePrice;
  dynamic lowestPriceGoodDeals;
  int lowestPrice;
  int highestPrice;
  int visibleListingCount;
  List<int> dqBucketCounts;
  int medianPrice;
  int lowestSgBasePrice;
  dynamic lowestSgBasePriceGoodDeals;

  factory EventStats.fromJson(Map<String, dynamic> json) => EventStats(
        listingCount:
            json["listing_count"] == null ? null : json["listing_count"],
        averagePrice:
            json["average_price"] == null ? null : json["average_price"],
        lowestPriceGoodDeals: json["lowest_price_good_deals"],
        lowestPrice: json["lowest_price"] == null ? null : json["lowest_price"],
        highestPrice:
            json["highest_price"] == null ? null : json["highest_price"],
        visibleListingCount: json["visible_listing_count"] == null
            ? null
            : json["visible_listing_count"],
        dqBucketCounts: json["dq_bucket_counts"] == null
            ? []
            : List<int>.from(json["dq_bucket_counts"].map((x) => x)),
        medianPrice: json["median_price"] == null ? null : json["median_price"],
        lowestSgBasePrice: json["lowest_sg_base_price"] == null
            ? null
            : json["lowest_sg_base_price"],
        lowestSgBasePriceGoodDeals: json["lowest_sg_base_price_good_deals"],
      );

  Map<String, dynamic> toJson() => {
        "listing_count": listingCount == null ? null : listingCount,
        "average_price": averagePrice == null ? null : averagePrice,
        "lowest_price_good_deals": lowestPriceGoodDeals,
        "lowest_price": lowestPrice == null ? null : lowestPrice,
        "highest_price": highestPrice == null ? null : highestPrice,
        "visible_listing_count":
            visibleListingCount == null ? null : visibleListingCount,
        "dq_bucket_counts": dqBucketCounts == null
            ? null
            : List<dynamic>.from(dqBucketCounts.map((x) => x)),
        "median_price": medianPrice == null ? null : medianPrice,
        "lowest_sg_base_price":
            lowestSgBasePrice == null ? null : lowestSgBasePrice,
        "lowest_sg_base_price_good_deals": lowestSgBasePriceGoodDeals,
      };
}

class Venue {
  Venue({
    required this.state,
    required this.nameV2,
    required this.postalCode,
    required this.name,
    required this.links,
    required this.timezone,
    required this.url,
    required this.score,
    required this.location,
    required this.address,
    required this.country,
    required this.hasUpcomingEvents,
    required this.numUpcomingEvents,
    required this.city,
    required this.slug,
    required this.extendedAddress,
    required this.id,
    required this.popularity,
    required this.accessMethod,
    required this.metroCode,
    required this.capacity,
    required this.displayLocation,
  });

  String state;
  String nameV2;
  String postalCode;
  String name;
  List<dynamic> links;
  String timezone;
  String url;
  double score;
  Location location;
  String address;
  String country;
  bool hasUpcomingEvents;
  int numUpcomingEvents;
  String city;
  String slug;
  String extendedAddress;
  int id;
  int popularity;
  dynamic accessMethod;
  int metroCode;
  int capacity;
  String displayLocation;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        state: json["state"] == null ? null : json["state"],
        nameV2: json["name_v2"],
        postalCode: json["postal_code"],
        name: json["name"],
        links: List<dynamic>.from(json["links"].map((x) => x)),
        timezone: json["timezone"],
        url: json["url"],
        score: json["score"].toDouble(),
        location: Location.fromJson(json["location"]),
        address: json["address"],
        country: json["country"],
        hasUpcomingEvents: json["has_upcoming_events"],
        numUpcomingEvents: json["num_upcoming_events"],
        city: json["city"],
        slug: json["slug"],
        extendedAddress: json["extended_address"],
        id: json["id"],
        popularity: json["popularity"],
        accessMethod: json["access_method"],
        metroCode: json["metro_code"],
        capacity: json["capacity"],
        displayLocation: json["display_location"],
      );

  Map<String, dynamic> toJson() => {
        "state": state == null ? null : state,
        "name_v2": nameV2,
        "postal_code": postalCode,
        "name": name,
        "links": List<dynamic>.from(links.map((x) => x)),
        "timezone": timezone,
        "url": url,
        "score": score,
        "location": location.toJson(),
        "address": address,
        "country": country,
        "has_upcoming_events": hasUpcomingEvents,
        "num_upcoming_events": numUpcomingEvents,
        "city": city,
        "slug": slug,
        "extended_address": extendedAddress,
        "id": id,
        "popularity": popularity,
        "access_method": accessMethod,
        "metro_code": metroCode,
        "capacity": capacity,
        "display_location": displayLocation,
      };
}

class Location {
  Location({
    required this.lat,
    required this.lon,
  });

  double lat;
  double lon;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}

class Meta {
  Meta({
    required this.total,
    required this.took,
    required this.page,
    required this.perPage,
    required this.geolocation,
  });

  int total;
  int took;
  int page;
  int perPage;
  dynamic geolocation;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        total: json["total"],
        took: json["took"],
        page: json["page"],
        perPage: json["per_page"],
        geolocation: json["geolocation"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "took": took,
        "page": page,
        "per_page": perPage,
        "geolocation": geolocation,
      };
}
