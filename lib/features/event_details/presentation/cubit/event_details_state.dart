part of 'event_details_cubit.dart';

abstract class EventDetailsState extends Equatable {
  const EventDetailsState();

  @override
  List<Object> get props => [];
}

class EventDetailsInitial extends EventDetailsState {}

class EventDetailsLoading extends EventDetailsState {}

class EventDetailsLoaded extends EventDetailsState {
  final List<EventModel> events;

  const EventDetailsLoaded(this.events);

  @override
  List<Object> get props => [events];
}

class EventDetailsError extends EventDetailsState {}
