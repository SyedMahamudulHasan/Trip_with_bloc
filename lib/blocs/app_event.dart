import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/data/repository/trip_provider.dart';

@immutable
abstract class TripEvent extends Equatable {
  const TripEvent();
}

class LoadTripEvent extends TripEvent {
  @override
  List<Object?> get props => [];

  //final trips = TripProvider()..getTrips();
}
