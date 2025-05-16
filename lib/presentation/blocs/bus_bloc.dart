import 'package:flutter_bloc/flutter_bloc.dart';
import 'bus_event.dart';
import 'bus_state.dart';
import '../../domain/usecases/get_buses.dart';

class BusBloc extends Bloc<BusEvent, BusState> {
  final GetBuses getBuses;

  BusBloc(this.getBuses) : super(BusInitial()) {
    on<LoadBuses>((event, emit) async {
      emit(BusLoading());
      try {
        final buses = await getBuses();
        emit(BusLoaded(buses));
      } catch (e) {
        emit(BusError("Failed to load buses"));
      }
    });
  }
}
