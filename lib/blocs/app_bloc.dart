import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/app_event.dart';
import 'package:todo/blocs/app_state.dart';
import 'package:todo/data/repository/trip_provider.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final TripProvider _tripProvider;

  TripBloc(this._tripProvider) : super(TripLoadingState()) {
    on<LoadTripEvent>((event, emit) async {
      emit(TripLoadingState());
      try {
        final trips = await _tripProvider.getTrips();
        emit(TripLoadedState(trips));
      } catch (e) {
        emit(
          TripErrorState(
            e.toString(),
          ),
        );
      }
    });
  }
}
