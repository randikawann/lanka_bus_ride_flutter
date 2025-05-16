import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/bus_bloc.dart';
import '../blocs/bus_state.dart';
import '../blocs/bus_event.dart';
import '../blocs/user_bloc.dart';
import '../blocs/user_event.dart';
import '../blocs/user_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Available Buses")),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<BusBloc>().add(LoadBuses());
          context.read<UserBloc>().add(LoadUser());
        },
        child: Column(
          children: [
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserLoading) {
                  return const CircularProgressIndicator();
                } else if (state is UserLoaded) {
                  final user = state.user;
                  return ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(user.name),
                  );
                } else if (state is UserError) {
                  return Text(state.message);
                }
                return const SizedBox.shrink();
              },
            ),
            const Divider(),
            Expanded(
              child: BlocBuilder<BusBloc, BusState>(
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
            ),
          ],
        ),
      ),
    );
  }
}
