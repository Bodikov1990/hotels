// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'booking_bloc.dart';

abstract class BookingEvent extends Equatable {
  const BookingEvent();

  @override
  List<Object> get props => [];
}

class BookingLoadingEvent extends BookingEvent {
  final HotelModel hotel;
  final RoomModel room;
  const BookingLoadingEvent({
    required this.hotel,
    required this.room,
  });

  @override
  List<Object> get props => [hotel, room];
}
