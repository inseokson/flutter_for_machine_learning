import 'package:flutter/material.dart';

import 'cifar10/screen.dart' as cifar10;

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
        primaryColor: Colors.black,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Machine Learning with Flutter"),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.photo)),
                Tab(icon: Icon(Icons.camera)),
              ],
              isScrollable: true,
            ),
          ),
          body: TabBarView(
            children: [
              cifar10.Screen(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
