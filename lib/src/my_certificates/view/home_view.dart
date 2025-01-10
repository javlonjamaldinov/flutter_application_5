import 'package:flutter/material.dart';
import 'package:flutter_application_5/src/categories_screen/categories_screen.dart';
import 'package:flutter_application_5/src/city/my_city.dart';
import 'package:flutter_application_5/src/faq/faq.dart';
import 'package:flutter_application_5/src/my_certificates/view/certificates_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CertificatesView(),
                  ),
                );
              },
              child: Container(
                height: 10.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 217, 211, 211),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code,
                      size: 25.sp,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      "Мои сертификаты",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Faq(),
                  ),
                );
              },
              child: Container(
                height: 10.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 217, 211, 211),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.help,
                      size: 25.sp,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      "Faq",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyTown(),
                  ),
                );
              },
              child: Container(
                height: 10.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 217, 211, 211),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_city,
                      size: 25.sp,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      "City",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 1.h),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoriesScreen(),
                  ),
                );
              },
              child: Container(
                height: 10.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 217, 211, 211),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.coffee,
                      size: 25.sp,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      "Companu",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
