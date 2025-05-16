class BusModel {

  final int id;
  final String company;
  final String source;
  final String destination;
  final String departure;
  final String arrival;
  final String routeNumber;
  final String duration;
  final List<String> popularStops;
  final int fare;
  final String busType;

  BusModel({
    required this.id,
    required this.company,
    required this.source,
    required this.destination,
    required this.departure,
    required this.arrival,
    required this.routeNumber,
    required this.duration,
    required this.popularStops,
    required this.fare,
    required this.busType,
  });

  factory BusModel.fromJson(Map<String, dynamic> json) {
    return BusModel(
      id: json['id'],
      company: json['company'],
      source: json['source'],
      destination: json['destination'],
      departure: json['departure'],
      arrival: json['arrival'],
      routeNumber: json['routeNumber'],
      duration: json['duration'],
      popularStops: List<String>.from(json['popularStops']),
      fare: json['fare'],
      busType: json['busType'],
    );
  }
}
