import 'package:coding_challenge_ariba/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SortingScreen extends StatelessWidget {
  const SortingScreen({super.key});

  @override
  Widget build(BuildContext context) {
   

    return Column(
      children: [
        SizedBox(
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(0, 203, 203, 203),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(24).w,
                topRight: const Radius.circular(24).w,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sort by',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 24.sp,
                          color: const Color(0xFF333333),
                        ),
                      ),
                      const Image(
                        image: AssetImage('assets/images/login/close_big.png'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Newest',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFFC6F20),
                        ),
                      ),
                      Image.asset(
                        'assets/images/login/orangetick.png',
                        height: 30.h,
                        width: 30.w,
                      ),
 
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Popular',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Readex Pro',
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Hot product',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Readex Pro',
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Customer Review',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Readex Pro',
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Lowest to highest price ',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Readex Pro',
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Highest to lowest price',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Readex Pro',
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  ButtonWidget(ontap: () {}, buttontitle: 'Apply Filter'),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}


