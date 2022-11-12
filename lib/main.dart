import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/app_bloc.dart';
import 'package:todo/blocs/app_event.dart';
import 'package:todo/blocs/app_state.dart';
import 'package:todo/data/model/trip_model.dart';
import 'package:todo/data/repository/trip_provider.dart';

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
          create: ((context) => TripProvider()),
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
        RepositoryProvider.of<TripProvider>(context),
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
              final List<TripModel> trips = state.trips;
              return ListView.builder(
                itemCount: trips.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(trips[index].tripInformation!.fullName!),
                    subtitle: Text(trips[index].tripStatus!),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
