import 'package:flutter/material.dart';

import '../widgets/event_list_item_widget.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
            itemBuilder: (BuildContext context, index) {
              return EventListItemWidget();
            },
            separatorBuilder: (BuildContext context, index) {
              return const SizedBox(
                height: 16,
              );
            },
            itemCount: 3)
      ],
    );
  }
}
