import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TripEvent extends Equatable {
  const TripEvent();
}

class LoadTripEvent extends TripEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
