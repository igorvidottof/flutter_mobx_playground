import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './home.dart';
import 'controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Controller>(
          create: (_) => Controller(),
          dispose: (_, controller) => controller.dispose(),
        ),
      ],
      child: MaterialApp(
        title: 'MobX',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
