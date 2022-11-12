import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo/data/model/trip_model.dart';

@immutable
abstract class TripState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TripLoadingState extends TripState {
  @override
  List<Object?> get props => [];
}

class TripLoadedState extends TripState {
  final List<TripModel> trips;
  TripLoadedState(this.trips);
  @override
  List<Object?> get props => [trips];
}

class TripErrorState extends TripState {
  TripErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [];
}
