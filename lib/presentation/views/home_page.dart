import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/bus_bloc.dart';
import '../blocs/bus_state.dart';
import '../blocs/bus_event.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Available Buses")),
      body: BlocBuilder<BusBloc, BusState>(
        builder: (context, state) {
          if (state is BusLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BusLoaded) {
            return ListView.builder(
              itemCount: state.buses.length,
              itemBuilder: (context, index) {
                final bus = state.buses[index];
                return ListTile(
                  leading: const Icon(Icons.directions_bus),
                  title: Text('${bus.companyName} | ${bus.source} → ${bus.destination}'),
                  subtitle: Text('${bus.duration}'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(bus.id.toString(), style: const TextStyle(color: Colors.green)),
                      Text(bus.duration),
                    ],
                  ),
                );
              },
            );
          } else if (state is BusError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text("Press button to load"));
          }
        },
      ),
    );
  }
}
