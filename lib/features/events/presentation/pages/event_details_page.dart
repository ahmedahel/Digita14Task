import 'dart:ffi';

import 'package:digital_14_task/features/events/presentation/cubit/event_details_cubit.dart';
import 'package:digital_14_task/features/events/presentation/cubit/events_cubit.dart';
import 'package:digital_14_task/features/events/presentation/widgets/event_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventDetailsPage extends StatefulWidget {
  final int eventId;

  const EventDetailsPage({Key? key, required this.eventId}) : super(key: key);

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  bool isAddToFav = false;
  @override
  void initState() {
    super.initState();
    context.read<EventDetailsCubit>().getEventDetails(widget.eventId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDetailsCubit, EventDetailsState>(
        builder: (context, state) {
      if (state is EventDetailsError) {
        return const Center(
          child: Icon(Icons.close),
        );
      } else if (state is EventDetailsLoaded) {
        final event = state.event;

        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      event.title,
                      maxLines: 2,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isAddToFav = !isAddToFav;
                      });
                      context
                          .read<EventsCubit>()
                          .addRemoveToFav(widget.eventId, isAddToFav);
                    },
                    child: Icon(
                      Icons.favorite,
                      color: isAddToFav ? Colors.red : Colors.grey,
                      size: 24,
                    ),
                  )
                ],
              ),
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context),
                color: Colors.blue,
              ),
            ),
            body: EventDetailsWidget(event: event));
      }

      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
