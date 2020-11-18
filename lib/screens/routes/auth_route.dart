import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mateop_admin/backend/api.dart';
import 'package:mateop_admin/backend/auth.dart';
import 'package:mateop_admin/models/user.dart';
import 'package:mateop_admin/provider/state.dart';
import 'package:mateop_admin/screens/routes/main_route.dart';
import 'package:mateop_admin/screens/views/auth/login.dart';
import 'package:provider/provider.dart';

class AuthRoute extends StatefulWidget {
  @override
  _RouteState createState() => _RouteState();
}

class _RouteState extends State<AuthRoute> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Login(),
      ),
    );
  }
}
