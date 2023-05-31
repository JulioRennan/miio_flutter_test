import 'package:flutter/material.dart';
import 'package:miio_flutter_test/app/modules/app_injection_container.dart';
import 'app/modules/app_widget.dart';

void main() {
  AppInjectionContainer();
  return runApp(
    const AppWidget(),
  );
}
