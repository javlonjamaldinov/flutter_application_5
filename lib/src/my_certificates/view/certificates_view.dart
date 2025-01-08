import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/src/my_certificates/view/active_view.dart';
import 'package:flutter_application_5/src/my_certificates/view/archive_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CertificatesView extends StatefulWidget {
  const CertificatesView({super.key});

  @override
  State<CertificatesView> createState() => _CertificatesViewState();
}

class _CertificatesViewState extends State<CertificatesView> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge;
    final selectedTextStyle =
        textStyle?.copyWith(fontWeight: FontWeight.w800, fontSize: 15.sp);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Мои карты',
              style: TextStyle(
                color: const Color(0xFF0F0F0F),
                fontSize: 16.sp,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.sp),
                child: SegmentedTabControl(
                  tabTextColor: const Color(0xFF4C4DDC),
                  selectedTabTextColor: Colors.white,
                  textStyle: textStyle,
                  indicatorDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  selectedTextStyle: selectedTextStyle,
                  barDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0x2D4C4DDC),
                  ),
                  tabs: [
                    SegmentTab(
                      label: "Активные",
                      color: Color(0xFF4C4DDC),
                    ),
                    SegmentTab(
                      label: "Архив",
                      color: Color(0xFF4C4DDC),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 9.h),
                child: TabBarView(
                  children: [
                    ActiveView(),
                    ArchiveView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
