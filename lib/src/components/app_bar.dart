import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showTrailingButton;
  final bool showArrowBackButton;
  final TextStyle? textStyle;
  final Function()? onTapTrailing;
  final Color? backgroundColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.showTrailingButton = false,
    this.showArrowBackButton = false,
    this.textStyle,
    this.onTapTrailing,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      surfaceTintColor: Colors.white,
      leading: showArrowBackButton
          ? Padding(
              padding: EdgeInsets.all(11.0.sp),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 1.h,
                  width: 1.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.sp),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 17.sp,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : SizedBox(width: 11.5.w),
      centerTitle: true,
      title: Center(
        child: Text(
          title ?? '',
          style: textStyle ??
              TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
        ),
      ),
      actions: [
        showTrailingButton
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: GestureDetector(
                  onTap: onTapTrailing,
                  child: Container(
                    height: 5.2.h,
                    width: 11.5.w,
                    decoration: BoxDecoration(
                      color: const Color(0x2D4C4DDC),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    
                  ),
                ),
              )
            : SizedBox(width: 11.5.w),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
