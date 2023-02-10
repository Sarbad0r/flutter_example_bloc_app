import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_3/bloc/bloc_observer.dart';
import 'package:flutter_bloc_example_3/bloc/main_bloc.dart';
import 'package:flutter_bloc_example_3/pages/main_page.dart';

void main() {
  Bloc.observer = const BlocObs();
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
          providers: [BlocProvider(create: (_) => MainBloc())],
          child: const MainPage()),
    );
  }
}
