import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotels/src/hotels_page/data/models/hotel_model.dart';
import 'package:hotels/src/hotels_page/domain/usecases/get_hotels_usecase.dart';

part 'hotels_event.dart';
part 'hotels_state.dart';

class HotelsBloc extends Bloc<HotelsEvent, HotelsState> {
  final GetHotelsUseCase _getHotelsUseCase = GetHotelsUseCase();

  HotelsBloc() : super(HotelsInitial()) {
    on<HotelsLoadingEvent>(_getHotels);
  }

  Future<void> _getHotels(
      HotelsLoadingEvent event, Emitter<HotelsState> emit) async {
    emit(HotelsLoadingState());

    final result = await _getHotelsUseCase();

    result.fold((failurel) => emit(HotelsLoadingErrorState()),
        (hotels) => emit(HotelsLoadedState(hotels: hotels)));
  }
}
