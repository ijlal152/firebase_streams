import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_challenge_ariba/constants/colors.dart';
import 'package:coding_challenge_ariba/constants/fonts.dart';
import 'package:coding_challenge_ariba/repo/repo.dart';
import 'package:coding_challenge_ariba/screens/filter_screen.dart';
import 'package:coding_challenge_ariba/screens/sorting_screen.dart';
import 'package:coding_challenge_ariba/widgets/chip.dart';
import 'package:coding_challenge_ariba/widgets/hot_sales.dart';
import 'package:coding_challenge_ariba/widgets/kids_products.dart';
import 'package:coding_challenge_ariba/widgets/mens_products.dart';
import 'package:coding_challenge_ariba/widgets/womens_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/productModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myIndex = 0;

  ProductModel productModel = ProductModel();
  final firestore = FirebaseFirestore.instance.collection('products').doc();

  var productData;

  Future getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('products').get();

    productData = querySnapshot.docs.map((e) => e.data()).toList();
    print(productData);
    return productData;
  }

  var activeIndex = 0;

  // GoogleAuthFirebase class instance
  var googleAuthFirebase = GoogleAuthFirebase();

  @override
  void initState() {
    // TODO: implement initState
    googleAuthFirebase.getData();
    productData = getData();
    super.initState();
  }

  var catList = ["Shirts", "Bags", "Shoes", "Hair Bands"];

// [{id:  BKcibxP5dnTFdvmW5V1Z, productPrice: 500, productName: T-Shirt, productCategory: Men}]
  @override
  Widget build(BuildContext context) {
    print(productData);
    return Scaffold(
      backgroundColor: const Color(0xffFBFBFB),
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0).w,
              child: Container(
                height: 150.0,
                width: 400.0,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFB56D),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: SizedBox(
                            child: Text(
                              'Stay Home \nWe deliver',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0).w,
                          child: Text(
                            'Any where ... Any time! ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5),
                          ),
                        ),
                      ],
                    ),
                    // const Image(
                    //   image: AssetImage('assets/images/home_screen/girl.png', ),
                    // ),
                    Image.asset(
                      "assets/images/home_screen/girl.png",
                    )
                  ],
                ),
              ),
            ),
            10.verticalSpace,

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SizedBox(
                width: double.infinity,
                height: 37.h,
                child: ListView.separated(
                  itemCount: catList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ChipWidget(
                      chiptext: catList[index],
                      borderColor: activeIndex == index
                          ? Colors.orange
                          : const Color(0xFFEBEBEB),
                      onTap: () {
                        setState(() {
                          activeIndex = index;
                          debugPrint("$activeIndex");
                        });
                      },
                      index: index,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return 5.horizontalSpace;
                  },
                ),
              ),
            ), // Row(

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Image(
                        image:
                            AssetImage('assets/images/home_screen/Frame.png'),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FilterScreen()));
                        },
                        child: Text(
                          'Filter',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Readex Pro',
                            fontWeight: FontWeight.w500,
                            color: kTextColor,
                          ),
                        ),
                      ), //
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const SortingScreen();
                              });
                        },
                        child: Row(children: [
                          Text(
                            'Sort by',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Readex Pro',
                              fontWeight: FontWeight.w500,
                              color: kTextColor,
                            ),
                          ),
                          const Image(
                            image: AssetImage(
                                'assets/images/home_screen/Frame.png'),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hot Sales',
                    style: TextStyle(
                      color: const Color(0xff333333),
                      fontSize: 24.sp,
                      fontFamily: 'roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: const Color(0xFFFC6F20),
                      fontSize: 12.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("products").snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(!snapshot.hasData){
                    return const Center(child: CircularProgressIndicator(),);
                  }else{
                    return SizedBox(
                      height: 235.h,
                      width: double.infinity,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return HotSalesCustomWidget(
                            imgPath: 'assets/products/shirt.png', 
                            productName: snapshot.data!.docs[index]['productName'], 
                            category: snapshot.data!.docs[index]['productCategory'], 
                            price: snapshot.data!.docs[index]['productPrice'].toString(), 
                          );
                        }, 
                        separatorBuilder: (context, index){
                          return SizedBox(width: 10.w,);
                        }, 
                        itemCount: snapshot.data!.docs.length,  // 2
                      ),
                    );
                  }
                }
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Women Products ',
                    style: TextStyle(
                      color: const Color(0xff333333),
                      fontSize: 24.sp,
                      fontFamily: 'roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: const Color(0xFFFC6F20),
                      fontSize: 12.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("women").snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(!snapshot.hasData){
                    return const Center(child: CircularProgressIndicator(),);
                  }else{
                    return SizedBox(
                      height: 235.h,
                      width: double.infinity,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return HotSalesCustomWidget(
                            imgPath: 'assets/products/shirt.png', 
                            productName: snapshot.data!.docs[index]['productName'], 
                            category: snapshot.data!.docs[index]['productCategory'], 
                            price: snapshot.data!.docs[index]['productPrice'].toString(), 
                          );
                        }, 
                        separatorBuilder: (context, index){
                          return SizedBox(width: 10.w,);
                        }, 
                        itemCount: snapshot.data!.docs.length,
                      ),
                    );
                  }
                }
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kids Products ',
                    style: TextStyle(
                      color: const Color(0xff333333),
                      fontSize: 24.sp,
                      fontFamily: 'roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: const Color(0xFFFC6F20),
                      fontSize: 12.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("kids").snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(!snapshot.hasData){
                    return const Center(child: CircularProgressIndicator(),);
                  }else{
                    return SizedBox(
                      height: 235.h,
                      width: double.infinity,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return HotSalesCustomWidget(
                            imgPath: 'assets/products/shirt.png', 
                            productName: snapshot.data!.docs[index]['productName'], 
                            category: snapshot.data!.docs[index]['productCategory'], 
                            price: snapshot.data!.docs[index]['productPrice'].toString(), 
                          );
                        }, 
                        separatorBuilder: (context, index){
                          return SizedBox(width: 10.w,);
                        }, 
                        itemCount: snapshot.data!.docs.length,
                      ),
                    );
                  }
                }
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KidsProductsCustomWidget(
                      imgPath: 'assets/products/shirt.png',
                      productName: 'T-Shirt',
                      category: 'Mens',
                      price: '\$1.32'),
                  KidsProductsCustomWidget(
                      imgPath: 'assets/products/shirt.png',
                      productName: 'T-Shirt',
                      category: 'Mens',
                      price: '\$1.32')
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mens Products',
                    style: TextStyle(
                      color: const Color(0xff333333),
                      fontSize: 24.sp,
                      fontFamily: 'roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: const Color(0xFFFC6F20),
                      fontSize: 12.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MensProductsCustomWidget(
                      imgPath: 'assets/products/shirt.png',
                      productName: 'T-Shirt',
                      category: 'Mens',
                      price: '\$1.32'),
                  MensProductsCustomWidget(
                      imgPath: 'assets/products/shirt.png',
                      productName: 'T-Shirt',
                      category: 'Mens',
                      price: '\$1.32')
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Womens Products',
                    style: TextStyle(
                      color: const Color(0xff333333),
                      fontSize: 24.sp,
                      fontFamily: 'roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: const Color(0xFFFC6F20),
                      fontSize: 12.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WomensProductsCustomWidget(
                      imgPath: 'assets/products/shirt.png',
                      productName: 'T-Shirt',
                      category: 'Mens',
                      price: '\$1.32'),
                  MensProductsCustomWidget(
                      imgPath: 'assets/products/shirt.png',
                      productName: 'T-Shirt',
                      category: 'Mens',
                      price: '\$1.32')
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: kTextColor,
        showUnselectedLabels: true,
        selectedItemColor: const Color(0xFFFFB56D),
        unselectedFontSize: 14,
        onTap: (index) {
          setState(() {});
          myIndex = index;
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: 'Cart'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          // Add your desired functionality here
        },
        icon: const Icon(
          Icons.arrow_back,
          color: kTextColor, // Set the color of the icon
        ),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            // Add your desired functionality here
          },
          icon: const Icon(
            Icons.search,
            color: kTextColor, // Set the color of the icon
          ),
        ),
        IconButton(
          onPressed: () {
            // Add your desired functionality here
          },
          icon: const Icon(
            Icons.add_shopping_cart_sharp,
            color: kTextColor, // Set the color of the icon
          ),
        ),
        const SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
