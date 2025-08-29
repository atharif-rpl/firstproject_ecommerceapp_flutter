

import 'package:ecommerce_mobile/features/features.dart';
import 'package:flutter/material.dart';

class FoodBanner extends StatefulWidget {
  const FoodBanner({
    super.key,
    required this.item,
  });

  final ItemFoodModel item;


  @override
  State<FoodBanner> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodBanner> {

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: widget.item.bgColor ?? Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Color(0xff202020).withOpacity(0.05),
              spreadRadius: 0,
              blurRadius: 6,
              offset: Offset(0, 3),
            )
          ]
      ),
      child: Stack(
        children: [
          Column(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen()));
                },
                child: Image.asset(widget.item.imagePath, width: 90, height: 90,
                ),
              ),
              SizedBox(height: 16),
              Text(widget.item.name,
                style: TextStyle(
                    fontWeight: FontWeight.w500
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 14,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.item.price, style: TextStyle(color: Color(0xffFFA451)),),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xffFFF2E7)
                    ),
                    child: Icon(Icons.add, color: Color(0xffFFA451), size: 12,),
                  )
                ],
              )
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border_rounded ,
                size: 16,
                color: Color(0xffFFA451),),
            ),
          )
        ],
      ),
    );
  }
}
