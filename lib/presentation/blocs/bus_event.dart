import 'package:equatable/equatable.dart';

abstract class BusEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadBuses extends BusEvent {}
