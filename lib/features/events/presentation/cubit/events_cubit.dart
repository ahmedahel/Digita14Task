import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../data/models/event_model.dart';
import '../../data/repositories/events_repository.dart';

part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  final EventsRepository eventsRepository;
  String _query = "";
  List<EventModel> events = [];

  EventsCubit(this.eventsRepository) : super(EventsInitial());

  void getEvents() async {
    emit(EventsLoading());
    final eitherFailureOrEventsResponse =
        await eventsRepository.getEvents(_query);
    eitherFailureOrEventsResponse.fold((failure) {
      debugPrint("failure $failure");
      return emit(EventsError());
    }, (success) {
      events = success.events;
      emit(EventsLoaded(events: events));
    });
  }

  void addRemoveToFav(int eventId, bool isFav) {
    events.firstWhere((element) => element.id == eventId).isAddToFav = isFav;
    emit(EventsLoaded(events: events));
  }

  void search(String query) {
    _query = query;
    getEvents();
  }
}
