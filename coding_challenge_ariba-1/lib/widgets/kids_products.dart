
import 'package:coding_challenge_ariba/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KidsProducts extends StatelessWidget {
  const KidsProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/circles.svg',
                              ),
                              Image.asset('assets/products/frok.png'),
                            ],
                          ),
                          SizedBox(width: 10.h),
                          Text(
                            'Frok',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text("Kid's",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w500,
                              )),
                          SizedBox(width: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$1.32',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.green, width: 5.w),
                                  borderRadius: BorderRadius.circular(10).w,
                                ),
                                child: const Icon(Icons.add,
                                    size: 18, color: Colors.black),
                              )
                            ],
                          )
                        ],
                      )))),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30).w,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/circles.svg',
                        ),
                        Image.asset('assets/products/baby_scooter.png'),
                      ],
                    ),
                    SizedBox(width: 10.h),
                    Text(
                      'Baby Scooter',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text("Kid's",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(width: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$1.32',
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 10.w),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green, width: 5),
                              borderRadius: BorderRadius.circular(10).w),
                          child: const Icon(Icons.add,
                              size: 18, color: Colors.black),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class KidsProductsCustomWidget extends StatelessWidget {
  final String imgPath;
  final String productName;
  final String category;
  final String price;
  const KidsProductsCustomWidget({
    super.key,
    required this.imgPath,
    required this.productName,
    required this.category,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235.h,
      width: 160.w,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Column(
        children: [
          Image.asset(
            imgPath,
            height: 120.h,
            width: 110.w,
          ),
          10.verticalSpace,
          Align(
            alignment: Alignment.centerLeft,
            child: LabelWidget(
              title: productName,
              fontSize: 18.sp,
              textColor: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          3.verticalSpace,
          Align(
            alignment: Alignment.centerLeft,
            child: LabelWidget(
              title: category,
              fontSize: 12.sp,
              textColor: const Color(0xFFBDBDBD),
              fontWeight: FontWeight.w400,
            ),
          ),
          5.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LabelWidget(
                title: price,
                fontSize: 14.sp,
                textColor: Colors.black,
                fontWeight: FontWeight.w700,
              ),
              Container(
                height: 36.h,
                width: 36.w,
                padding: const EdgeInsets.all(6).w,
                decoration: BoxDecoration(
                    color: const Color(0xFF6FCF97),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Image.asset('assets/images/home_screen/plus.png'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
