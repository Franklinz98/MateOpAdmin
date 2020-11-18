import 'package:flutter/cupertino.dart';
import 'package:mateop_admin/constants/enums.dart';
import 'package:mateop_admin/models/user.dart';

class StaffProvider extends ChangeNotifier {
  StaffUser _staffUser;
  MainRouteContent _screen = MainRouteContent.undefined;
  Map _institution, _course;

  StaffUser get user => _staffUser;
  MainRouteContent get screen => _screen;
  Map get institution => _institution;
  Map get course => _course;

  void updateScreen(MainRouteContent screen) {
    _screen = screen;
    notifyListeners();
  }

  void setUser(StaffUser user) {
    _staffUser = user;
  }

  void setInstitution(Map institution) {
    _institution = institution;
  }

  void setCourse(Map course) {
    _course = course;
  }
}
