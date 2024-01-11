// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'hotels_bloc.dart';

abstract class HotelsEvent extends Equatable {
  const HotelsEvent();

  @override
  List<Object> get props => [];
}

class HotelsLoadingEvent extends HotelsEvent {}
