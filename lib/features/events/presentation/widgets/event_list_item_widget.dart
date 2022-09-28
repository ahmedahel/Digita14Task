import 'package:badges/badges.dart';
import 'package:digital_14_task/features/events/data/models/events_model.dart';
import 'package:flutter/material.dart';

class EventListItemWidget extends StatelessWidget {
  final EventModel event;
  final VoidCallback onItemClicked;
  const EventListItemWidget(
      {Key? key, required this.event, required this.onItemClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onItemClicked(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.title,
                textAlign: TextAlign.start,
                maxLines: 1,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  event.type,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              Text(
                event.datetimeUtc.toString(),
                textAlign: TextAlign.start,
                maxLines: 1,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          leading: Badge(
            badgeColor: Colors.white,
            position: BadgePosition.topStart(),
            badgeContent: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 12,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                  "https://seatgeek.com/images/performers-landscape/black-stone-cherry-d59298/9032/huge.jpg",
                  fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
