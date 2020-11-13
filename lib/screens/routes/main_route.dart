import 'package:flutter/material.dart';
import 'package:mateop_admin/screens/views/content/admin.dart';
import 'package:mateop_admin/screens/views/content/course.dart';
import 'package:mateop_admin/screens/views/content/institution.dart';
import 'package:mateop_admin/screens/views/content/student.dart';

class MainRoute extends StatefulWidget {
  @override
  _RouteState createState() => _RouteState();
}

class _RouteState extends State<MainRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StudentDetails(),
      ),
    );
  }
}
