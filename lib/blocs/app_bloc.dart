import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/app_event.dart';
import 'package:todo/blocs/app_state.dart';
import 'package:todo/data/repogitori/repository.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final TripRepository _tripRepository;
  TripBloc(this._tripRepository) : super(TripLoadingState()) {
    on<LoadTripEvent>((event, emit) async {
      emit(TripLoadingState());
    });
  }
}
