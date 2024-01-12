// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'room_bloc.dart';

abstract class RoomEvent extends Equatable {
  const RoomEvent();

  @override
  List<Object> get props => [];
}

class RoomLoadingEvent extends RoomEvent {
  final HotelModel hotel;
  const RoomLoadingEvent({
    required this.hotel,
  });

  @override
  List<Object> get props => [hotel];
}
