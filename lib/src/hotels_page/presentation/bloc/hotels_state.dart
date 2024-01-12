part of 'hotels_bloc.dart';

abstract class HotelsState extends Equatable {
  const HotelsState();

  @override
  List<Object> get props => [];
}

final class HotelsInitial extends HotelsState {}

final class HotelsLoadingState extends HotelsState {}

final class HotelsLoadedState extends HotelsState {
  final List<HotelModel> hotels;

  const HotelsLoadedState({required this.hotels});

  @override
  List<Object> get props => [hotels.map((e) => e.id)];
}

final class HotelsLoadingErrorState extends HotelsState {
  final String message;

  const HotelsLoadingErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
