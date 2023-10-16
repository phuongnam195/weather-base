import 'package:flutter/material.dart';

class Global {
  Global._();

  static final globalKey = GlobalKey<NavigatorState>();
  static NavigatorState get navigator => globalKey.currentState!;
  static BuildContext get context => globalKey.currentContext!;
}
