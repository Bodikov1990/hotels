import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotels/src/hotels_page/data/models/hotel_model.dart';
import 'package:hotels/src/room_page/data/models/room_model.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    on<BookingLoadingEvent>(_getBooking);
  }

  Future<void> _getBooking(
      BookingLoadingEvent event, Emitter<BookingState> emit) async {
    emit(BookingLoadingState());
    emit(BookingLoadedState(hotel: event.hotel, room: event.room));
  }
}
