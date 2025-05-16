import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/bus_bloc.dart';
import '../blocs/bus_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? selectedRoute;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<BusBloc, BusState>(
        builder: (context, state) {
          if (state is BusLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BusLoaded) {
            final buses = state.buses;
            final uniqueRoutes = <String>{};
            final topRoutes = <String>[];
            for (var bus in buses) {
              if (uniqueRoutes.add(bus.routeNumber) && topRoutes.length < 5) {
                topRoutes.add(bus.routeNumber);
              }
            }
            final filteredBuses = selectedRoute == null
                ? []
                : buses.where((b) => b.routeNumber == selectedRoute).toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    spacing: 10,
                    children: topRoutes.map((route) {
                      return ChoiceChip(
                        label: Text(route),
                        selected: selectedRoute == route,
                        onSelected: (_) {
                          setState(() {
                            selectedRoute = route;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Recents Routes",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 8),
                    itemCount: filteredBuses.length,
                    itemBuilder: (_, index) {
                      final bus = filteredBuses[index];
                      return ListTile(
                        leading: const Icon(Icons.directions_bus),
                        title: Text('${bus.source} → ${bus.destination}'),
                        subtitle: Text(
                            '${bus.departure} - ${bus.arrival} (${bus.duration})'),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(bus.routeNumber, style: const TextStyle(color: Colors.green)),
                            Text(bus.companyName, style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is BusError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
