import 'package:flutter/material.dart';
import 'package:miio_flutter_test/app/modules/home/presentation/pages/home_page.dart';
import 'package:miio_flutter_test/core/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Slidy',
      theme: appTheme,
      home: const HomePage(),
    );
  }
}
