import 'package:flutter/material.dart';

class ChangeColorWidget extends StatefulWidget {
  const ChangeColorWidget({super.key});

  @override
  State<ChangeColorWidget> createState() => _ChangeColorWidgetState();
}

class _ChangeColorWidgetState extends State<ChangeColorWidget> {

  var colorList = [
    Colors.amber,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.green,
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
        children: [
          const SizedBox(height: 100,),
          SizedBox(
            height: 50,
            child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
            return RoundCircles(
              color: colorList[index], 
              index: index,
              iconData: activeIndex == index ? const Icon(Icons.check, color: Colors.white,) : const SizedBox(),
              onTap: (){
                setState(() {
                  activeIndex = index;
                });
              },
            );
          }, 
          separatorBuilder: (context, index){
            return const SizedBox(width: 20,);
          }, 
          itemCount: colorList.length),
          ),
        ],
      ),
      )
    );
  }
}

class RoundCircles extends StatelessWidget {
  final Color color;
  final Widget iconData;
  var index;
  final VoidCallback onTap;
  RoundCircles({super.key, required this.color, this.iconData = const Icon(Icons.check, color: Colors.white,), required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(0.5)
        ),
        child: Center(
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color
        ),
        child: iconData,
          ),
        ),
      ),
    );
  }
}