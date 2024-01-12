part of 'room_bloc.dart';

abstract class RoomState extends Equatable {
  const RoomState();

  @override
  List<Object> get props => [];
}

final class RoomInitial extends RoomState {}

final class RoomLoadingState extends RoomState {}

class RoomLoadedState extends RoomState {
  final HotelModel hotel;
  const RoomLoadedState({
    required this.hotel,
  });

  @override
  List<Object> get props => [hotel];
}
