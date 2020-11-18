import 'package:flutter/foundation.dart';

class StaffUser {
  String name, email, unit, clearance, token;

  StaffUser(
      {@required this.name,
      @required this.email,
      @required this.clearance,
      @required this.token,
      this.unit});
}
