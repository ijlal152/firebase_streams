import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeColorWidget extends StatefulWidget {
  const ChangeColorWidget({super.key});

  @override
  State<ChangeColorWidget> createState() => _ChangeColorWidgetState();
}

class _ChangeColorWidgetState extends State<ChangeColorWidget> {
  var colorList = const [
    Color(0xFFFC6F20),
    Color(0xFF8F59A6),
    Color(0xFF59A661),
    Color(0xFFFFCA28),
    Color(0xFFFF2727),
    Color(0xff000000),
    Color(0xFF1A09D8),
  ];

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: double.infinity,

        height: 30.h,
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return RoundCircles(
                color: colorList[index],
                index: index,
                iconData: activeIndex == index
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    : const SizedBox(),
                onTap: () {
                  setState(() {
                    activeIndex = index;
                  });
                },
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 17.w,
              );
            },
            itemCount: colorList.length),
      ),
    );
  }
}

class RoundCircles extends StatelessWidget {
  final Color color;
  final Widget iconData;
  var index;
  final VoidCallback onTap;

  RoundCircles(
      {super.key,
      required this.index,
      required this.color,
      required this.iconData,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30.h,
        width: 30.w,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: color.withOpacity(0.5)),
        child: Center(
          child: Container(
            height: 22.h,
            width: 22.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: iconData,
          ),
        ),
      ),
    );
  }
}
