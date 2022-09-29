part of 'events_cubit.dart';

abstract class EventsState extends Equatable {
  const EventsState();

  @override
  List<Object> get props => [];
}

class EventsInitial extends EventsState {}

class EventsLoading extends EventsState {}

class EventsLoaded extends EventsState {
  final List<EventModel> events;

  const EventsLoaded({required this.events});

  EventsLoaded copyWith({required final List<EventModel> events}) {
    return EventsLoaded(
      events: events,
    );
  }

  @override
  List<Object> get props => [events, DateTime.now()];
}

class EventsError extends EventsState {}
