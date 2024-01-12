part of 'booking_bloc.dart';

abstract class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

final class BookingInitial extends BookingState {}

final class BookingLoadingState extends BookingState {}

class BookingLoadedState extends BookingState {
  final HotelModel hotel;
  final RoomModel room;
  const BookingLoadedState({
    required this.hotel,
    required this.room,
  });

  @override
  List<Object> get props => [hotel, room];
}
