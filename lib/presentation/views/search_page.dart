import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/bus.dart';
import '../blocs/bus_bloc.dart';
import '../blocs/bus_state.dart';
import 'widgets/bus_list_view.dart';
import 'widgets/route_choice_chips.dart';

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
            final List<Bus> filteredBuses = selectedRoute == null
                ? []
                : buses.where((b) => b.routeNumber == selectedRoute).toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                RouteChoiceChips(
                  routes: topRoutes,
                  selectedRoute: selectedRoute,
                  onSelected: (route) {
                    setState(() {
                      selectedRoute = route;
                    });
                  },
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
                  child: BusListView(buses: filteredBuses),
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
