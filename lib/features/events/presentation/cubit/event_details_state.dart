part of 'event_details_cubit.dart';

abstract class EventDetailsState extends Equatable {
  const EventDetailsState();

  @override
  List<Object> get props => [];
}

class EventDetailsInitial extends EventDetailsState {}

class EventDetailsLoading extends EventDetailsState {}

class EventDetailsLoaded extends EventDetailsState {
  final EventModel event;

  const EventDetailsLoaded(this.event);

  @override
  List<Object> get props => [event];
}

class EventDetailsError extends EventDetailsState {}
