import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotels/src/hotels_page/data/models/hotel_model.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  RoomBloc() : super(RoomInitial()) {
    on<RoomLoadingEvent>(_getHotel);
  }

  Future<void> _getHotel(
      RoomLoadingEvent event, Emitter<RoomState> emit) async {
    emit(RoomLoadingState());

    emit(RoomLoadedState(hotel: event.hotel));
  }
}
