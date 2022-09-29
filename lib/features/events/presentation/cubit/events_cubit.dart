import 'package:bloc/bloc.dart';
import 'package:digital_14_task/features/events/data/models/get_events_response_model.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/event_model.dart';
import '../../data/repositories/events_repository.dart';

part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  final EventsRepository eventsRepository;
  String _query = "";
  List<EventModel> events = [];

  EventsCubit({required this.eventsRepository}) : super(EventsInitial()) {
    getEvents();
  }

  void getEvents() async {
    emit(EventsLoading());
    final eitherFailureOrEventsResponse =
        await eventsRepository.getEvents(_query);
    eitherFailureOrEventsResponse.fold((failure) => emit(EventsError()),
        (success) {
      events = success.events;
      emit(EventsLoaded(events:events));
    });
  }

  void addRemoveToFav(int eventId, bool isFav) {
    int index = events.indexWhere((element) => element.id == eventId);
    events[index].isAddToFav = isFav;
   final eventLoadedState =  state as EventsLoaded;
    emit(eventLoadedState.copyWith(events: events));
  }

  void search(String query) {
    _query = query;
    getEvents();
  }
}
