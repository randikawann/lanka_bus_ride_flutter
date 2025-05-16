import '../entities/bus.dart';
import '../repositories/bus_repository.dart';

class GetBuses {
  final BusRepository repository;

  GetBuses(this.repository);

  Future<List<Bus>> call() async {
    return await repository.getAvailableBuses();
  }
}
