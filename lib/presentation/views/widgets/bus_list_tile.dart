import 'package:flutter/material.dart';

import '../../../domain/entities/bus.dart';

class BusListTile extends StatelessWidget {
  final Bus bus;

  const BusListTile({super.key, required this.bus});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.directions_bus),
      title: Text('${bus.source} → ${bus.destination}'),
      subtitle: Text('${bus.departure} - ${bus.arrival} (${bus.duration})'),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(bus.routeNumber, style: const TextStyle(color: Colors.green)),
          Text(bus.companyName, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
