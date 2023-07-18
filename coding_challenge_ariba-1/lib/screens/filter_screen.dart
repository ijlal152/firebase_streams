import 'package:coding_challenge_ariba/custom_text.dart';
import 'package:coding_challenge_ariba/widgets/button.dart';
import 'package:coding_challenge_ariba/widgets/chip.dart';
import 'package:coding_challenge_ariba/widgets/color_palettes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var sizezList = [
    "All",
    "Medium",
    "Shoes",
    "Hair Bands",
    "Shoes",
    "Hair Bands",
  ];

  // RangeValues values = const RangeValues(70, 20.h0);
  @override
  Widget build(BuildContext context) {
    //RangeValues values = const RangeValues(70, 20.h0);
    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   'Filters',
        //   style: TextStyle(
        //     color: const Color(0xFF172D40),
        //     fontSize: 20.sp,
        //     fontFamily: 'Readex Pro',
        //     fontWeight: FontWeight.w500,
        //   ),  //

        // ),
        title: LabelWidget(
          title: 'Filters',
          fontSize: 20.sp,
          textColor: const Color(0xFF172D40),
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Add your desired functionality here
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Price Range',
              style: TextStyle(
                color: const Color(0XFF172D48),
                fontSize: 16.sp,
                fontFamily: 'Readex Pro',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Image(
              image: AssetImage('assets/images/filter_screen/range.png'),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Colors',
              style: TextStyle(
                color: const Color(0XFF172D48),
                fontSize: 16.sp,
                fontFamily: 'Readex Pro',
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 50.h, child: const ChangeColorWidget()),

            SizedBox(
              height: 16.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Sizes',
                  style: TextStyle(
                    color: const Color(0XFF172D48),
                    fontSize: 16.sp,
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 20.h,
            ),
            //List.generate(sizezList.length, (index) => ChipWidget(onTap: onTap))

            Wrap(
              children: [
                ChipWidgetWithColor(
                  onTap: () {},
                  chiptext: 'Small',
                  filledColor: const Color(0xFFFC6F20),
                  textColor: Colors.white,
                ),
                ChipWidgetWithColor(
                  onTap: () {},
                  chiptext: 'Medium',
                  filledColor: Colors.white,
                  textColor: const Color(0xFF333333),
                ),
                ChipWidgetWithColor(
                  onTap: () {},
                  chiptext: 'Large',
                  filledColor: Colors.white,
                  textColor: const Color(0xFF333333),
                ),
                ChipWidgetWithColor(
                  onTap: () {},
                  chiptext: 'X-Large',
                  filledColor: Colors.white,
                  textColor: const Color(0xFF333333),
                ),
                ChipWidgetWithColor(
                  onTap: () {},
                  chiptext: 'XXL',
                  filledColor: Colors.white,
                  textColor: const Color(0xFF333333),
                ),
                ChipWidgetWithColor(
                  onTap: () {},
                  chiptext: '3XL',
                  filledColor: Colors.white,
                  textColor: const Color(0xFF333333),
                ),
              ],
            ),

            SizedBox(
              height: 20.h,
            ),
            Text(
              'Categories',
              style: TextStyle(
                color: const Color(0XFF172D48),
                fontSize: 16.sp,
                fontFamily: 'Readex Pro',
                fontWeight: FontWeight.w500,
              ),
            ),
            Wrap(
              children: [
                ChipWidgetWithColor(
                  onTap: () {},
                  chiptext: 'All',
                  filledColor: const Color(0xFFFC6F20),
                  textColor: Colors.white,
                ),
                ChipWidgetWithColor(
                  onTap: () {},
                  chiptext: "Men's ",
                  filledColor: Colors.white,
                  textColor: const Color(0xFF333333),
                ),
                ChipWidgetWithColor(
                  onTap: () {},
                  chiptext: 'Kids',
                  filledColor: Colors.white,
                  textColor: const Color(0xFF333333),
                ),
                ChipWidgetWithColor(
                  onTap: () {},
                  chiptext: "Women's",
                  filledColor: Colors.white,
                  textColor: const Color(0xFF333333),
                ),
                ChipWidgetWithColor(
                  onTap: () {},
                  chiptext: 'Boys',
                  filledColor: Colors.white,
                  textColor: const Color(0xFF333333),
                ),
                ChipWidgetWithColor(
                  onTap: () {},
                  chiptext: 'Girls',
                  filledColor: Colors.white,
                  textColor: const Color(0xFF333333),
                ),
              ],
            ),

            SizedBox(
              height: 20.h,
            ),
            Text(
              'Brands',
              style: TextStyle(
                color: const Color(0XFF172D48),
                fontSize: 16.sp,
                fontFamily: 'Readex Pro',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Wrap(
              children: [
                ChipWidgetWithColor(
                  onTap: () {},
                  chiptext: 'All',
                  filledColor: const Color(0xFFFC6F20),
                  textColor: Colors.white,
                ),
                ChipWidgetWithColor(
                  onTap: () {},
                  chiptext: "Niki ",
                  filledColor: Colors.white,
                  textColor: const Color(0xFF333333),
                ),
                ChipWidgetWithColor(
                  onTap: () {},
                  chiptext: 'Dynum',
                  filledColor: Colors.white,
                  textColor: const Color(0xFF333333),
                ),
                ChipWidgetWithColor(
                  onTap: () {},
                  chiptext: "Outfitter",
                  filledColor: Colors.white,
                  textColor: const Color(0xFF333333),
                ),
                ChipWidgetWithColor(
                  onTap: () {},
                  chiptext: 'Addidas',
                  filledColor: Colors.white,
                  textColor: const Color(0xFF333333),
                ),
                ChipWidgetWithColor(
                  onTap: () {},
                  chiptext: 'Undermore',
                  filledColor: Colors.white,
                  textColor: const Color(0xFF333333),
                ),
                ChipWidgetWithColor(
                  onTap: () {},
                  chiptext: 'Olivers',
                  filledColor: Colors.white,
                  textColor: const Color(0xFF333333),
                ),
              ],
            ),

            SizedBox(
              height: 10.h,
            ),

            ButtonWidget(ontap: () {}, buttontitle: 'Apply Sort'),
          ]),
        ),
      ),
    );
  }
}
