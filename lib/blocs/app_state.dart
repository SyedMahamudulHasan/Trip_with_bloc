import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TripState extends Equatable {}

class TripLoadingState extends TripState {
  @override
  List<Object?> get props => [];
}
