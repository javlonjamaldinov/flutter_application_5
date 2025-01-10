import 'package:flutter/material.dart';
import 'package:flutter_application_5/src/components/app_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  int expandedIndex = -1;

  final faqs = [
    {
      "question": "What are your opening hours?",
      "answer":
          "We are open daily from 7:00 AM to 10:00 PM. On weekends, we stay open until 11:00 PM."
    },
    {
      "question": "Do you offer vegan options?",
      "answer":
          "Yes, we offer a variety of vegan-friendly options, including almond milk lattes, vegan pastries, and salads."
    },
    {
      "question": "Is Wi-Fi available in the cafe?",
      "answer":
          "Yes, we provide free Wi-Fi to all our customers. Just ask for the password at the counter."
    },
    {
      "question": "Can I reserve a table?",
      "answer":
          "Currently, we do not accept table reservations. Seating is on a first-come, first-served basis."
    },
    {
      "question": "Do you have a loyalty program?",
      "answer":
          "Yes, we have a loyalty program. For every 10 drinks purchased, you get one free. Sign up at the counter!"
    },
    {
      "question": "Are pets allowed in the cafe?",
      "answer":
          "We welcome pets in our outdoor seating area, but they are not allowed inside the cafe."
    },
    {
      "question": "Do you cater for events?",
      "answer":
          "Yes, we offer catering services for events. Contact us directly for more information and menu options."
    },
    {
      "question": "Do you have gluten-free options?",
      "answer":
          "Yes, we offer gluten-free pastries and bread. Please inform our staff if you have specific dietary requirements."
    },
  ];

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Colors.white;
    final Color borderColor = Colors.black.withOpacity(0.1);
    const Color accentColor = Color(0xFF4C4DDC);
    // const Color titleColor = Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // AppBar Row
                  CustomAppBar(
                    showArrowBackButton: true,
                    title: "FAQ",
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4.h),

                  ...faqs.asMap().entries.map((entry) {
                    int index = entry.key;
                    var item = entry.value;

                    bool isExpanded = expandedIndex == index;

                    return Container(
                      margin: EdgeInsets.only(bottom: 2.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.02),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: borderColor),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                expandedIndex = isExpanded ? -1 : index;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    item["question"]!,
                                    style: TextStyle(
                                      color: accentColor,
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Icon(
                                  isExpanded ? Icons.remove : Icons.add,
                                  color: accentColor,
                                  size: 6.w,
                                ),
                              ],
                            ),
                          ),
                          if (isExpanded) ...[
                            SizedBox(height: 1.h),
                            Text(
                              item["answer"]!,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 3.5.w,
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  }),
                  SizedBox(height: 4.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
