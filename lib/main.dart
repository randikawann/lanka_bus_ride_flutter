import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart' as di;
import 'presentation/blocs/bus_bloc.dart';
import 'presentation/blocs/bus_event.dart';
import 'presentation/views/home_page.dart';


void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lanka Bus Ride',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: BlocProvider(
          create: (_) => di.sl<BusBloc>()..add(LoadBuses()),
        child: const HomePage(),
      )
    );
  }
}