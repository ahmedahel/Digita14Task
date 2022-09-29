import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digital_14_task/features/events/presentation/cubit/events_cubit.dart';
import '../../data/datasources/remote_events_datasource.dart';
import '../../data/repositories/events_repository.dart';
import '../cubit/event_details_cubit.dart';
import 'event_details_page.dart';
import '../widgets/event_list_item_widget.dart';
import '../widgets/search_bar.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_onTextChanged);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _query = _controller.text;
    });
    context.read<EventsCubit>().search(_query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8),
          child: SearchBar(
            controller: _controller,
            focusNode: _focusNode,
          ),
        ),
      ),
      body: BlocBuilder<EventsCubit, EventsState>(
        builder: (context, state) {
          if (state is EventsError) {
            return const Center(
              child: Icon(Icons.close),
            );
          } else if (state is EventsLoaded) {
            final events = state.events;
            return ListView.separated(
                itemCount: events.length,
                itemBuilder: (context, index) => EventListItemWidget(
                      event: events[index],
                      onItemClicked: () => _onItemClicked(events[index].id),
                    ),
                separatorBuilder: (BuildContext context, index) {
                  return Container(
                    color: Colors.grey.shade200,
                    height: 2,
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  void _onItemClicked(int eventId) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider<EventDetailsCubit>(
                create: (context) => EventDetailsCubit(
                      eventsRepository: EventsRepository(
                          remoteEventsDataSource: RemoteEventsDataSource()),
                    ),
                child: EventDetailsPage(
                  eventId: eventId,
                ))));
  }
}
