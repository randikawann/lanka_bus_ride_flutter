import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart' as di;
import 'presentation/blocs/bus_bloc.dart';
import 'presentation/blocs/bus_event.dart';
import 'presentation/blocs/user_bloc.dart';
import 'presentation/blocs/user_event.dart';
import 'presentation/views/main_screen.dart';


void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<BusBloc>()..add(LoadBuses())),
        BlocProvider(create: (_) => di.sl<UserBloc>()..add(LoadUser())),
      ],
      child: MaterialApp(
        title: 'Lanka Bus Ride',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: const MainScreen(),
      ),
    );
  }
}