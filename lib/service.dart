import 'package:flutter/material.dart';

class Service {
  Service._();
  static Service _bloc = Service._();
  factory Service() {
    return _bloc;
  }

  TabController? tabController;
  double? top;
  ValueNotifier<bool> searchOpen = ValueNotifier(false);
  ValueNotifier<double> topAppBarHeight = ValueNotifier(0.0);
  ValueNotifier<double> topSearchBarHeight = ValueNotifier(0.0);
  
}
