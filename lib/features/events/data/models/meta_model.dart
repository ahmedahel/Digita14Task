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
