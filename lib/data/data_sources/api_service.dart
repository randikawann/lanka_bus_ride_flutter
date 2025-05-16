import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/bus_model.dart';

abstract class ApiService {
  Future<List<BusModel>> fetchBuses();
}

class ApiServiceImpl implements ApiService {
  @override
  Future<List<BusModel>> fetchBuses() async {
    final response = await http.get(Uri.parse('https://run.mocky.io/v3/c946052c-51b7-48ad-b757-e7b51512f55a'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((e) => BusModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load buses');
    }
  }
}
