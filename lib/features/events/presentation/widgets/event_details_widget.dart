import 'package:digital_14_task/features/events/data/models/event_model.dart';
import 'package:flutter/material.dart';

class EventDetailsWidget extends StatefulWidget {
  final EventModel event ;
  const EventDetailsWidget({
    Key? key, required this.event,
  }) : super(key: key);

  @override
  State<EventDetailsWidget> createState() => _EventDetailsWidgetState();
}

class _EventDetailsWidgetState extends State<EventDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    color: Colors.grey.shade200,
                    height: 2,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                          "https://seatgeek.com/images/performers-landscape/black-stone-cherry-d59298/9032/huge.jpg",
                          fit: BoxFit.contain),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.event.title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.event.type,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            );
  }
}
