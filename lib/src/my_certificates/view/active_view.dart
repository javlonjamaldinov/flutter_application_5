import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ActiveView extends StatelessWidget {
  const ActiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildPromotionCard(),
                Container(
                  width: double.infinity,
                  height: 10.5.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x0C000000),
                        blurRadius: 21.50,
                        offset: Offset(1, 2),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x0C000000),
                        blurRadius: 21.50,
                        offset: Offset(-1, 2),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 1.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '234 сом',
                                  style: TextStyle(
                                    color: Color(0xFF4C4DDC),
                                    fontSize: 15.5.sp,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 0.5.h),
                                Text(
                                  'Sierra',
                                  style: TextStyle(
                                    color: Color(0xFF0F0F0F),
                                    fontSize: 15.5.sp,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/images/sierra.png",
                            ),
                          ],
                        ),
                        SizedBox(height: 0.8.h),
                        Text(
                          '- - - - - - - - - - - - - - - - - - - -',
                          style: TextStyle(
                            color: Colors.grey, // Цвет разделителя
                            fontSize: 16, // Размер шрифта
                            letterSpacing: 2,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 7.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x0C000000),
                        blurRadius: 21.50,
                        offset: Offset(1, 2),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x0C000000),
                        blurRadius: 21.50,
                        offset: Offset(-1, 2),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 1.5.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'до 10.12.2024',
                              style: TextStyle(
                                color: Color(0xFF0F0F0F),
                                fontSize: 15.5.sp,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 0.5.h),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildPromotionCard() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(17),
        topRight: Radius.circular(17),
        bottomLeft: Radius.zero,
        bottomRight: Radius.zero,
      ),
      child: Stack(
        children: [
          Image.asset(
            "assets/images/4.png",
            width: double.infinity,
            height: 20.h,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.sp, left: 15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "GROCERY",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    shadows: [
                      Shadow(
                        offset: const Offset(1, 1),
                        blurRadius: 3,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ],
                  ),
                ),
                Text(
                  "winestory",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: const Offset(1, 1),
                        blurRadius: 3,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  "Special Offer",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: const Offset(1, 1),
                        blurRadius: 3,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
