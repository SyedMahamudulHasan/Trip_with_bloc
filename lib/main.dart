import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/app_bloc.dart';
import 'package:todo/blocs/app_event.dart';
import 'package:todo/blocs/app_state.dart';
import 'package:todo/data/repogitori/repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
          create: ((context) => TripRepository()),
          child: const MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripBloc(
        RepositoryProvider.of<TripRepository>(context),
      )..add(
          LoadTripEvent(),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Trips"),
        ),
        body: BlocBuilder<TripBloc, TripState>(
          builder: (context, state) {
            if (state is TripLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is TripLoadedState) {
              return const Center(
                child: Text("Data loaded bhai"),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
