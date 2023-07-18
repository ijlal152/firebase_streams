import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChipWidget extends StatelessWidget {
  final String? chiptext;
  final Color? textColor;
  final Color? borderColor;
  final VoidCallback onTap;
  int index;

  ChipWidget(
      {super.key,
      this.chiptext,
      this.textColor,
      this.borderColor = const Color(0xFFEBEBEB),
      required this.onTap,
      this.index = 0});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        //height: 34.h,
        //width: 70.w,

        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 9.h),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor!),
          borderRadius: BorderRadius.circular(10).w,
        ),
        child: Center(
            child: Text(
          chiptext.toString(),
          style: TextStyle(
            color: textColor,
            fontSize: 14.sp,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
        )),
      ),
    );
  }
}

class ChipWidgetWithColor extends StatelessWidget {
  final String? chiptext;
  final Color? textColor;
  final Color? filledColor;
  final VoidCallback onTap;
  int index;

  ChipWidgetWithColor(
      {super.key,
      this.chiptext,
      this.textColor,
      this.filledColor = const Color(0xFFEBEBEB),
      required this.onTap,
      this.index = 0});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 38.h,
        width: 70.w,
        //margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 9.h),
        decoration: BoxDecoration(
          color: filledColor,
          border: Border.all(color: const Color(0xFFE0E0E0)),
          borderRadius: BorderRadius.circular(10).w,
        ),
        child: Center(
            child: Text(
          chiptext.toString(),
          style: TextStyle(
            color: textColor,
            fontSize: 14.sp,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
        )),
      ),
    );
  }
}
