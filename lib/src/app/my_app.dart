import 'package:flutter/material.dart';
import 'package:flutter_application_5/src/my_certificates/view/home_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          home: HomeView(),
        );
      },
    );
  }
}
