// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:digital_14_task/core/constants.dart';
import 'package:digital_14_task/features/events/data/models/event_model.dart';
import 'package:digital_14_task/features/events/presentation/cubit/events_cubit.dart';
import 'package:digital_14_task/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    dioAdapter = DioAdapter(
      dio: dio,
      matcher: const FullHttpRequestMatcher(),
    );
    setup();
  });

  group('Events Cubit test', () {
    setUp(() {
      EquatableConfig.stringify = true;
    });

    test('cubit initial state should be Empty', () {
      expect(getIt<EventsCubit>().state, equals(EventsInitial()));
    });

    const response = <String, dynamic>{
      "events": [
        {
          "type": "concert",
          "id": 5791168,
          "datetime_utc": "2022-09-29T07:30:00",
          "venue": {
            "state": "NY",
            "name_v2": "SOB's",
            "postal_code": "10014",
            "name": "SOB's",
            "links": [],
            "timezone": "America/New_York",
            "url": "https://seatgeek.com/venues/sob-s/tickets",
            "score": 0.41,
            "location": {"lat": 40.7285, "lon": -74.0051},
            "address": "204 Varick Street",
            "country": "US",
            "has_upcoming_events": true,
            "num_upcoming_events": 5,
            "city": "New York",
            "slug": "sob-s",
            "extended_address": "New York, NY 10014",
            "id": 2370,
            "popularity": 0,
            "access_method": null,
            "metro_code": 501,
            "capacity": 160,
            "display_location": "New York, NY"
          },
          "datetime_tbd": false,
          "performers": [
            {
              "type": "band",
              "name": "India Shawn",
              "image":
                  "https://seatgeek.com/images/performers-landscape/india-shawn-39f491/309387/huge.jpg",
              "id": 309387,
              "images": {
                "huge":
                    "https://seatgeek.com/images/performers-landscape/india-shawn-39f491/309387/huge.jpg"
              },
              "divisions": null,
              "has_upcoming_events": true,
              "primary": true,
              "stats": {"event_count": 3},
              "taxonomies": [
                {
                  "id": 2000000,
                  "name": "concerts",
                  "parent_id": null,
                  "document_source": {
                    "source_type": "ELASTIC",
                    "generation_type": "FULL"
                  },
                  "rank": 0
                }
              ],
              "image_attribution": "Ben Rose / WireImage / Getty Images",
              "url": "https://seatgeek.com/india-shawn-tickets",
              "score": 0.37,
              "slug": "india-shawn",
              "home_venue_id": null,
              "short_name": "India Shawn",
              "num_upcoming_events": 3,
              "colors": null,
              "image_license": "rightsmanaged",
              "popularity": 0,
              "location": null,
              "image_rights_message": "(c) Ben Rose / WireImage / Getty Images"
            }
          ],
          "is_open": false,
          "links": [],
          "datetime_local": "2022-09-29T03:30:00",
          "time_tbd": true,
          "short_title": "India Shawn",
          "visible_until_utc": "2022-09-30T04:00:00",
          "stats": {
            "listing_count": null,
            "average_price": null,
            "lowest_price_good_deals": null,
            "lowest_price": null,
            "highest_price": null,
            "visible_listing_count": null,
            "dq_bucket_counts": null,
            "median_price": null,
            "lowest_sg_base_price": null,
            "lowest_sg_base_price_good_deals": null
          },
          "taxonomies": [
            {"id": 2000000, "name": "concert", "parent_id": null, "rank": 0}
          ],
          "url":
              "https://seatgeek.com/india-shawn-tickets/new-york-new-york-sob-s-2022-09-29-3-30-am/concert/5791168",
          "score": 0.397,
          "announce_date": "2022-08-28T00:00:00",
          "created_at": "2022-08-28T16:01:20",
          "date_tbd": false,
          "title": "India Shawn",
          "popularity": 0.713,
          "description": "",
          "status": "normal",
          "access_method": null,
          "event_promotion": null,
          "announcements": {},
          "conditional": false,
          "enddatetime_utc": null,
          "themes": [],
          "domain_information": []
        }
      ],
      "meta": {
        "total": 88411,
        "took": 9,
        "page": 1,
        "per_page": 10,
        "geolocation": null
      }
    };

    blocTest<EventsCubit, EventsState>(
        'emits [EventsLoading,EventsLoaded] states for'
        'successful events Loads',
        setUp: () {
          const route = '/2/events?client_id=$clientId&per_page=10&page=1';
          dioAdapter.onGet(
            route,
            (server) => server.reply(
              200,
              response,
              delay: const Duration(seconds: 1),
            ),
          );
        },
        build: () => getIt<EventsCubit>(),
        act: (cubit) => cubit.getEvents(),
        expect: () => [
              EventsLoading(),
              EventsLoaded(events: [
                EventModel(
                    type: "concert",
                    id: 5791168,
                    datetimeUtc: DateTime.now(),
                    shortTitle: "India Shawn",
                    title: "India Shawn"),
              ]),
            ]);

    tearDown(() {
      getIt<EventsCubit>().close();
    });
  });
}
