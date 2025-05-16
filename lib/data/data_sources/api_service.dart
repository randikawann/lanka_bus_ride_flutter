import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/bus_model.dart';
import '../models/user_model.dart';

abstract class ApiService {
  Future<List<BusModel>> fetchBuses();
  Future<UserModel> fetchUser();
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

  @override
  Future<UserModel> fetchUser() async {
    final response = await http.get(Uri.parse("https://run.mocky.io/v3/ca6dc778-ae2d-49db-bd65-11e4f0c2f2de"));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return UserModel.fromJson(jsonData);
    } else {
      throw Exception("Failed to load user");
    }
  }
}
