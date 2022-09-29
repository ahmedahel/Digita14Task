import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/event_model.dart';
import '../../data/repositories/events_repository.dart';

part 'event_details_state.dart';

class EventDetailsCubit extends Cubit<EventDetailsState> {
  final EventsRepository eventsRepository;

  EventDetailsCubit({required this.eventsRepository})
      : super(EventDetailsInitial());

  void getEventDetails(int eventId) async {
    emit(EventDetailsLoading());
    final eitherFailureOrEventDetailsResponse =
        await eventsRepository.getEventDetails(eventId);
    eitherFailureOrEventDetailsResponse
        .fold((failure) => emit(EventDetailsError()), (event) {
      emit(EventDetailsLoaded(event));
    });
  }
}
