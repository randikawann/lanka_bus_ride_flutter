import '../../domain/entities/bus.dart';
import '../../domain/repositories/bus_repository.dart';
import '../data_sources/api_service.dart';

class BusRepositoryImpl implements BusRepository {
  final ApiService apiService;

  BusRepositoryImpl(this.apiService);

  @override
  Future<List<Bus>> getAvailableBuses() async {
    final buses = await apiService.fetchBuses();
    return buses.map((busModel) => Bus(
      id: busModel.id,
      companyName: busModel.company,
      source: busModel.source,
      destination: busModel.destination,
      departure: busModel.departure,
      arrival: busModel.arrival,
      routeNumber: busModel.routeNumber,
      duration: busModel.duration,
    )).toList();
  }
}
