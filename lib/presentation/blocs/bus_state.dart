import 'package:equatable/equatable.dart';
import '../../domain/entities/bus.dart';

abstract class BusState extends Equatable {
  @override
  List<Object> get props => [];
}

class BusInitial extends BusState {}

class BusLoading extends BusState {}

class BusLoaded extends BusState {
  final List<Bus> buses;

  BusLoaded(this.buses);

  @override
  List<Object> get props => [buses];
}

class BusError extends BusState {
  final String message;

  BusError(this.message);

  @override
  List<Object> get props => [message];
}
