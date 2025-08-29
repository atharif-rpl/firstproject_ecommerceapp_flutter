

import 'package:flutter/cupertino.dart';

class ItemTest extends StatefulWidget {

  const ItemTest({super.key, required this.title, required this.price, required this.imagePath});

  final String title;
  final String imagePath;
  final String price;

  @override
  State<ItemTest> createState() => _ItemTestState();
}

class _ItemTestState extends State<ItemTest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xff999999),
          borderRadius: BorderRadius.circular(10),

      ),
      child: Column(
        children: [
          Text(widget.title),
          Image.asset(widget.imagePath, width: 80,),
          Text(widget.price),
        ],
      ),
    );
  }
}
