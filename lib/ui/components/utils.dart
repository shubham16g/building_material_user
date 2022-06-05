

import 'package:flutter/material.dart';

class Responsive  {
  static const _mobileBreakPoint = 564;
  static const _desktopBreakPoint = 1000;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < _mobileBreakPoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < _desktopBreakPoint &&
          MediaQuery.of(context).size.width >= _mobileBreakPoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= _desktopBreakPoint;

}