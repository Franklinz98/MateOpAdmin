import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mateop_admin/screens/routes/main_route.dart';

class AdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Mate Op',
      home: MainRoute(),
    );
  }
}
