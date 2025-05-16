import '../entities/bus.dart';

abstract class BusRepository {
  Future<List<Bus>> getAvailableBuses();
}
