import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_init_performance/splash.dart';

void main() async {
  log(DateTime.now().toIso8601String());

  // First screen of the app before loading all dependencies, as shown in the documentation.
  // This is so that a white screen is not displayed before all dependencies are loaded.
  // https://api.flutter.dev/flutter/widgets/runApp.html
  runApp(const Splash());

  // Dependency loading simulation such as: Firebase, crashlytics, appsflyer, analytics....
  await Future.delayed(const Duration(seconds: 1));
  await Future.delayed(const Duration(seconds: 3));
  await Future.delayed(const Duration(seconds: 1));

  // Main app launch
  log(DateTime.now().toIso8601String());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
