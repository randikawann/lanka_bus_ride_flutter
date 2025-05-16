import 'package:flutter/material.dart';

import '../../../domain/entities/bus.dart';
import 'bus_list_tile.dart';

class BusListView extends StatelessWidget {
  final List<Bus> buses;

  const BusListView({super.key, required this.buses});

  @override
  Widget build(BuildContext context) {
    if (buses.isEmpty) {
      return const Center(
        child: Text('No buses found for selected route.'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      itemCount: buses.length,
      itemBuilder: (_, index) {
        final bus = buses[index];
        return BusListTile(bus: bus);
      },
    );
  }
}
