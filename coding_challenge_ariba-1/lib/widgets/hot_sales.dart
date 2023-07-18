import 'package:coding_challenge_ariba/custom_text.dart';
import 'package:coding_challenge_ariba/models/productModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HotSales extends StatelessWidget {
  HotSales({super.key});

  final auth = FirebaseAuth.instance;

  User? user = FirebaseAuth.instance.currentUser;


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
                              Image.asset('assets/products/shirt.png'),
                            ],
                          ),
                          SizedBox(width: 10.h),
                          Text(
                            'T-shirt',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text("Mens's",
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
                        Image.asset('assets/products/bag.png'),
                      ],
                    ),
                    SizedBox(width: 10.h),
                    Text(
                      'Hand Bag',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text("Womens's",
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

class HotSalesCustomWidget extends StatefulWidget {
  final String imgPath;
  final String productName;
  final String category;
  final String price;
 HotSalesCustomWidget({
    super.key,
   this.imgPath = '',
    required this.productName,
    required this.category,
    required this.price,
  });

  @override
  State<HotSalesCustomWidget> createState() => _HotSalesCustomWidgetState();
}

class _HotSalesCustomWidgetState extends State<HotSalesCustomWidget> {
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
            widget.imgPath,
            height: 120.h,
            width: 110.w,
          ),
          10.verticalSpace,
          Align(
            alignment: Alignment.centerLeft,
            child: LabelWidget(
              title: widget.productName,
              fontSize: 18.sp,
              textColor: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          3.verticalSpace,
          Align(
            alignment: Alignment.centerLeft,
            child: LabelWidget(
              title: widget.category,
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
                title: widget.price,
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
