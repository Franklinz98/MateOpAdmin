import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mateop_admin/backend/api.dart';
import 'package:mateop_admin/backend/auth.dart';
import 'package:mateop_admin/constants/enums.dart';
import 'package:mateop_admin/models/user.dart';
import 'package:mateop_admin/provider/state.dart';
import 'package:mateop_admin/screens/routes/auth_route.dart';
import 'package:mateop_admin/screens/views/content/admin.dart';
import 'package:mateop_admin/screens/views/content/course.dart';
import 'package:mateop_admin/screens/views/content/institution.dart';
import 'package:mateop_admin/screens/views/content/student.dart';
import 'package:provider/provider.dart';

class MainRoute extends StatefulWidget {
  @override
  _RouteState createState() => _RouteState();
}

class _RouteState extends State<MainRoute> {
  StaffProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<StaffProvider>(context, listen: false);
    Firebase.initializeApp().then((value) async {
      // signOut();
      User firebaseUser = currentUser();
      if (firebaseUser != null) {
        String token = await firebaseUser.getIdToken();
        Map user = await getStaff(firebaseUser.email);
        provider.setUser(StaffUser(
            name: firebaseUser.displayName,
            email: firebaseUser.email,
            clearance: user['clearance'],
            token: token,
            unit: user['data']['unit']));
        updateUI(provider.user.clearance);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider<StaffProvider>.value(
              value: provider,
              child: AuthRoute(),
            ),
          ),
        ).then((value) => updateUI(provider.user.clearance));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: screen(),
      ),
    );
  }

  void updateUI(String clearance) {
    switch (clearance) {
      case 'admin':
        provider.updateScreen(MainRouteContent.admin);
        break;
      case 'deputy':
        provider.updateScreen(MainRouteContent.deputy);
        break;
      case 'teacher':
        provider.updateScreen(MainRouteContent.teacher);
        break;
    }
  }

  Widget screen() {
    switch (Provider.of<StaffProvider>(context).screen) {
      case MainRouteContent.admin:
        return FutureBuilder(
          future: getInstitutions(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return AdminView(institutions: snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
            }
            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          },
        );
      case MainRouteContent.deputy:
        return FutureBuilder(
          future: getCourses(provider.institution['id']),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return InstitutionView(courses: snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
            }
            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          },
        );
      case MainRouteContent.teacher:
        return FutureBuilder(
          future: getStudents(provider.course['id']),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return CourseView(students: snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
            }
            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          },
        );
      default:
        return Center(
          child: CircularProgressIndicator(),
        );
    }
  }
}
