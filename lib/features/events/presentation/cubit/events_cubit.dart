import 'package:bloc/bloc.dart';
import 'package:digital_14_task/features/events/data/models/events_model.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/events_repository.dart';

part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  final EventsRepository eventsRepository;

  EventsCubit({required this.eventsRepository}) : super(EventsInitial()) {
    getEvents();
  }

  void getEvents() async {
    emit(EventsLoading());
    final eitherFailureOrEventsResponse = await eventsRepository.getEvents();
    eitherFailureOrEventsResponse.fold((failure) => emit(EventsError()),
        (success) {
      emit(EventsLoaded(success.events));
    });
  }
}
