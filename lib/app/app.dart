import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mateop_admin/provider/state.dart';
import 'package:mateop_admin/screens/routes/auth_route.dart';
import 'package:mateop_admin/screens/routes/main_route.dart';
import 'package:provider/provider.dart';

class AdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Mate Op',
      theme: ThemeData.dark().copyWith(
        accentColor: Color(0xff3d85d7),
      ),
      home: ChangeNotifierProvider(
        create: (context) => StaffProvider(),
        child: MainRoute(),
      ),
    );
  }
}
